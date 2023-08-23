import 'package:easycut/core/class/status_request.dart';
import 'package:easycut/core/constant/routes.dart';
import 'package:easycut/core/functions/handling_data_controller.dart';
import 'package:easycut/data/data_source/remote/forget_password/verify_code.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode(String val);
}

class VerifyCodeControllerImp extends VerifyCodeController {
  VerifyCodeData verifyCodeData = VerifyCodeData(Get.find());
  StatusRequest statusRequest = StatusRequest.success;

  String? email;

  @override
  checkCode(String val) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeData.postData(
      email!,
      val,
    );
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        // data.addAll(response['data']);
        Get.snackbar(
          'Congratulation',
          'Your verify code is correct',
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.green,
        );
        Get.toNamed(AppRoute.resetPassword, arguments: {
          'email': email,
        });
      } else {
        Get.snackbar(
          'Warning',
          'Your code is incorrect',
          snackPosition: SnackPosition.TOP,
          colorText: Colors.red,
        );
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
