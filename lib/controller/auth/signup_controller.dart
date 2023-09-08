import 'dart:io';

import 'package:easycut/core/class/status_request.dart';
import 'package:easycut/core/constant/routes.dart';
import 'package:easycut/core/functions/handling_data_controller.dart';
import 'package:easycut/core/shared/widgets/small_text.dart';
import 'package:easycut/data/data_source/remote/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goBackLogin();
  changeGender(Gender value);
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  late Gender gender;

  bool isShowPassword = true;
  showPassword() {
    isShowPassword = !isShowPassword;
    update();
  }

  @override
  goBackLogin() {
    Get.offNamed(AppRoute.login);
  }

  late TextEditingController country;
  late TextEditingController city;
  late TextEditingController address;
  File? myFile;

  void addFilePath(String path) {
    myFile = File(path);
    update();
  }

  SignUpData signUpData = SignUpData(Get.find());
  StatusRequest statusRequest = StatusRequest.success;

  @override
  signUp() async {
    if (myFile == null) {
      return Get.defaultDialog(
        title: "Warning",
        content: const SmallText(
          text: "You must upload image for your Profile",
        ),
      );
    }
    var formData = formState.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signUpData.postData(
        name.text,
        email.text,
        password.text,
        phone.text,
        gender.name,
        country.text,
        city.text,
        address.text,
        myFile!,
      );
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          Get.snackbar(
            'Register Success',
            'Your Register is successfully \nGo to your account to get verify code',
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.green,
          );
          Get.toNamed(AppRoute.activateCode, arguments: {
            'email': email.text,
          });
        } else {
          Get.snackbar(
            'Warning',
            'Email Already Exists',
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
    email = TextEditingController();
    password = TextEditingController();
    name = TextEditingController();
    phone = TextEditingController();
    country = TextEditingController();
    city = TextEditingController();
    address = TextEditingController();
    gender = Gender.gender;
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    name.dispose();
    phone.dispose();
    password.dispose();
    country.dispose();
    city.dispose();
    address.dispose();
    super.dispose();
  }

  @override
  changeGender(Gender value) {
    gender = value;
    update();
  }
}

enum Gender {
  gender,
  male,
  female,
}
