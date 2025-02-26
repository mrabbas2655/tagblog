import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tecbloc/Services/dio_service.dart';
import 'package:tecbloc/component/api_constant.dart';
import 'package:tecbloc/component/storage_const.dart';
import 'package:tecbloc/view/main_screen/main_screen.dart';
import 'package:tecbloc/view/register/register_intro.dart';

import '../../gen/assets.gen.dart';

class RegisterController extends GetxController {
  TextEditingController editingTextEditingController = TextEditingController();
  TextEditingController activeCodeTextEditingController =
      TextEditingController();
  var email = '';
  var userId = '';

  register() async {
    Map<String, dynamic> map = {
      "email": editingTextEditingController.text,
      "command": "register",
    };
    var response =
        await DioService().postMethod(map, ApiUrlConstant.postRegister);
    if (response.data != null && response.data['user_id'] != null) {
      email = editingTextEditingController.text;
      userId = response.data['user_id'];
      print("Registration successful: $response");
    } else {
      print("Registration failed: ${response.data}");
    }
  }

  verify() async {
    Map<String, dynamic> map = {
      "email": email,
      "user_id": userId,
      "code": activeCodeTextEditingController.text,
      "command": "verify",
    };
    var response =
        await DioService().postMethod(map, ApiUrlConstant.postRegister);
    print("Verification response: ${response.data}");
    var status = response.data['response'];
    switch (status) {
      case 'verified':
        var box = GetStorage();
        box.write(token, response.data['token']);
        box.write(userId, response.data['user_id']);
        print("Token: ${box.read(token)}");
        print("User ID: ${box.read(userId)}");
        Get.offAll(() => MainScreen());
        break;
      case "incorrect_code ":
        Get.snackbar("error", "no code register");
        break;
      case "expired":
        Get.snackbar("error", "no code register time");
        break;
    }
  }

  toggleLogin() {
    if (GetStorage().read(token) == null) {
      Get.to(RegisterIntro());
    } else {
      routeToWriteBottomSheet();
    }
  }

  routeToWriteBottomSheet() {
    Get.bottomSheet(
      Container(
        height: Get.height / 3,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    Assets.images.tcbot.path,
                    height: 40,
                  ),
                  SizedBox(width: 12),
                  Text("دونسته هات رو با بقیه به اشتراک بذار ...")
                ],
              ),
              SizedBox(height: 18),
              Text(
                  """فکر کن !!  اینجا بودنت به این معناست که یک گیک تکنولوژی هستی
دونسته هات رو با  جامعه‌ی گیک های فارسی زبان به اشتراک بذار.."""),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        debugPrint('rr');
                      },
                      child: Container(
                        child: Row(
                          children: [
                            Image.asset(
                              Assets.icons.writeArticleIcon.path,
                              height: 40,
                            ),
                            SizedBox(width: 8),
                            Text("مدیریت مقاله ها")
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        debugPrint('rr');
                      },
                      child: Container(
                        child: Row(
                          children: [
                            Image.asset(
                              Assets.icons.writePodcastIcon.path,
                              height: 40,
                            ),
                            SizedBox(width: 8),
                            Text("مدیریت پادکست ها")
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
