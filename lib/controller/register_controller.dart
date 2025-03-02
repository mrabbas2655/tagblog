import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tecbloc/Services/dio_service.dart';
import 'package:tecbloc/constant/api_url_constant.dart';
import 'package:tecbloc/constant/storage_const.dart';
import 'package:tecbloc/main.dart';
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
      debugPrint("Registration successful: $response");
    } else {
      debugPrint("Registration failed: ${response.data}");
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
    debugPrint("Verification response: ${response.data}");
    var status = response.data['response'];
    switch (status) {
      case 'verified':
        var box = GetStorage();
        box.write(StorageKey.token, response.data['token']);
        box.write(StorageKey.userId, response.data['user_id']);
        debugPrint("Token: ${box.read(StorageKey.token)}");
        debugPrint("User ID: ${box.read(StorageKey.userId)}");
        Get.offAll(() => const MainScreen());
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
    if (GetStorage().read(StorageKey.token) == null) {
      Get.to(const RegisterIntro());
    } else {
      routeToWriteBottomSheet();
    }
  }

  routeToWriteBottomSheet() {
    Get.bottomSheet(
      Container(
        height: Get.height / 3,
        decoration: const BoxDecoration(
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
                  const SizedBox(width: 12),
                  const Text("دونسته هات رو با بقیه به اشتراک بذار ...")
                ],
              ),
              const SizedBox(height: 18),
              const Text(
                  """فکر کن !!  اینجا بودنت به این معناست که یک گیک تکنولوژی هستی
دونسته هات رو با  جامعه‌ی گیک های فارسی زبان به اشتراک بذار.."""),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(MainRoute.manageArticel);
                      },
                      child: Container(
                        color: Colors.white,
                        child: Row(
                          children: [
                            Image.asset(
                              Assets.icons.writeArticleIcon.path,
                              height: 40,
                            ),
                            const SizedBox(width: 8),
                            const Text("مدیریت مقاله ها")
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        debugPrint('rr');
                      },
                      child: Container(
                        color: Colors.white,
                        child: Row(
                          children: [
                            Image.asset(
                              Assets.icons.writePodcastIcon.path,
                              height: 40,
                            ),
                            const SizedBox(width: 8),
                            const Text("مدیریت پادکست ها")
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
