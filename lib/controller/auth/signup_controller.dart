import 'package:easycut/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goBackLogin();
  changeGender(Gender value);
}

class SignUpControllerImp extends SignUpController {
  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  late Gender gender;

  @override
  goBackLogin() {
    Get.back();
  }

  @override
  signUp() {
    Get.toNamed(AppRoute.activateCode);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    name = TextEditingController();
    phone = TextEditingController();
    gender = Gender.gender;
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    name.dispose();
    phone.dispose();
    password.dispose();
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
