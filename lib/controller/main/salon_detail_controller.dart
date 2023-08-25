import 'package:easycut/core/class/status_request.dart';
import 'package:easycut/core/functions/handling_data_controller.dart';
import 'package:easycut/core/services/services.dart';
import 'package:easycut/data/data_source/remote/main/salon_detail_data.dart';
import 'package:easycut/data/model/salon_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SalonDetailController extends GetxController {
  getSalonDetail();
}

class SalonDetailControllerImp extends SalonDetailController {
  late String salonId;
  late String userId;
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.success;
  SalonDetailData salonDetail = SalonDetailData(Get.find());
  late SalonModel salon;

  @override
  getSalonDetail() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await salonDetail.postData(
      salonId,
    );
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        var data = response['data'] as Map<String, dynamic>;
        salon = SalonModel.fromJson(data);
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
    salonId = Get.arguments['salonid'];
    userId = myServices.sharedPreferences.getString('id')!;
    salon = SalonModel();
    getSalonDetail();
    super.onInit();
  }
}
