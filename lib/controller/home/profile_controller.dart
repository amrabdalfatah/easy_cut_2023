import 'package:easycut/core/class/status_request.dart';
import 'package:easycut/core/functions/handling_data_controller.dart';
import 'package:easycut/core/services/services.dart';
import 'package:easycut/data/data_source/remote/home/profile_data.dart';
import 'package:easycut/data/model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ProfileController extends GetxController {
  initialData();
  getData();
}

class ProfileControllerImp extends ProfileController {
  MyServices myServices = Get.find();
  String? id;

  ProfileData profileData = ProfileData(Get.find());
  StatusRequest statusRequest = StatusRequest.success;
  late ProfileModel profile;

  @override
  initialData() {
    id = myServices.sharedPreferences.getString('id');
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await profileData.postData(
      id!,
    );
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        var data = response['data'] as Map<String, dynamic>;
        // profile = ProfileModel.fromJson(data);
      } else {
        Get.snackbar(
          'Warning',
          'There is no data',
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
    initialData();
    getData();
    profile = ProfileModel();
    super.onInit();
  }
}
