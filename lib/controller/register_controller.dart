import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tecbloc/Services/dio_service.dart';
import 'package:tecbloc/component/api_constant.dart';
import 'package:tecbloc/component/storage_const.dart';
import 'package:tecbloc/view/main_screen/main_screen.dart';

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
    if (response.data['response'] == 'verified') {
      var box = GetStorage();
      box.write(token, response.data['token']);
      box.write(userId, response.data['user_id']);
      print("Token: ${box.read(token)}");
      print("User ID: ${box.read(userId)}");
      Get.offAll(() => MainScreen());
    } else {
      print("Verification failed: ${response.data}");
    }
  }
}
