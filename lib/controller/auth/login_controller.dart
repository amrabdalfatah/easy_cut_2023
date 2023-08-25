import 'package:easycut/core/class/status_request.dart';
import 'package:easycut/core/constant/routes.dart';
import 'package:easycut/core/functions/handling_data_controller.dart';
import 'package:easycut/core/services/services.dart';
import 'package:easycut/data/data_source/remote/auth/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  goToForgetPassword();
  goToSignUp();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  LoginData loginData = LoginData(Get.find());
  StatusRequest statusRequest = StatusRequest.success;
  bool isShowPassword = true;
  MyServices myServices = Get.find();

  showPassword() {
    isShowPassword = !isShowPassword;
    update();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  login() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(email.text, password.text);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          if (response['data']['approve'] == '1') {
            Get.snackbar(
              'Congratulation',
              'You information is correct \nWait for loading Data.',
              snackPosition: SnackPosition.BOTTOM,
              colorText: Colors.green,
            );
            Get.offAllNamed(AppRoute.home);
            myServices.sharedPreferences
                .setString('id', response['data']['id']);
            myServices.sharedPreferences
                .setString('name', response['data']['name']);
            myServices.sharedPreferences
                .setString('gender', response['data']['gender']);
            myServices.sharedPreferences
                .setString('country', response['data']['country']);
            myServices.sharedPreferences
                .setString('city', response['data']['city']);

            myServices.sharedPreferences.setString('step', '2');

            String userId = myServices.sharedPreferences.getString('id')!;

            // FirebaseMessaging.insance.subscribeToTopic("users");
            // FirebaseMessaging.insance.subscribeToTopic("users${userId}");
          } else {
            Get.toNamed(AppRoute.activateCode, arguments: {
              "email": email.text,
            });
          }
        } else {
          Get.snackbar(
            'Warning',
            'Your information is incorrect',
            snackPosition: SnackPosition.TOP,
            colorText: Colors.red,
          );
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      String? token = value;
    });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
