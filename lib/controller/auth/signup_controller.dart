import 'package:easycut/core/class/status_request.dart';
import 'package:easycut/core/constant/routes.dart';
import 'package:easycut/core/functions/handling_data_controller.dart';
import 'package:easycut/data/data_source/remote/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

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

  Location location = Location();

  // getLocation() async {
  //   bool _serviceEnabled;
  //   PermissionStatus _permissionGranted;
  //   LocationData _locationData;
  //
  //   _serviceEnabled = await location.serviceEnabled();
  //   if (!_serviceEnabled) {
  //     _serviceEnabled = await location.requestService();
  //     if (!_serviceEnabled) {
  //       return;
  //     }
  //   }
  //
  //   _permissionGranted = await location.hasPermission();
  //   if (_permissionGranted == PermissionStatus.denied) {
  //     _permissionGranted = await location.requestPermission();
  //     if (_permissionGranted != PermissionStatus.granted) {
  //       return;
  //     }
  //   }
  //
  //   _locationData = await location.getLocation();
  //
  //   print(_locationData);
  // }

  bool isShowPassword = true;
  showPassword() {
    isShowPassword = !isShowPassword;
    update();
  }

  @override
  goBackLogin() {
    Get.offNamed(AppRoute.login);
  }

  SignUpData signUpData = SignUpData(Get.find());
  StatusRequest statusRequest = StatusRequest.success;
  // List data = [];

  @override
  signUp() async {
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
        "Egypt",
        "Menofia",
        "Birket Elsabaa",
      );
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          // data.addAll(response['data']);
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
    gender = Gender.gender;
    // getLocation();
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
