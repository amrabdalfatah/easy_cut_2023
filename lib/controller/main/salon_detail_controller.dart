import 'package:easycut/core/class/status_request.dart';
import 'package:easycut/core/functions/handling_data_controller.dart';
import 'package:easycut/core/services/services.dart';
import 'package:easycut/data/data_source/remote/main/salon_detail_data.dart';
import 'package:easycut/data/model/comment_model.dart';
import 'package:easycut/data/model/products_model.dart';
import 'package:easycut/data/model/salon_model.dart';
import 'package:easycut/data/model/services_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SalonDetailController extends GetxController {
  getSalonDetail();
}

class SalonDetailControllerImp extends SalonDetailController {
  String? salonId;
  String? userId;
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.success;
  SalonDetailData salonDetail = SalonDetailData(Get.find());
  SalonModel salon = SalonModel();
  List<ServiceModel> services = [];
  List<ProductModel> products = [];
  List<CommentModel> comments = [];

  @override
  getSalonDetail() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await salonDetail.getData(
      salonId!,
    );
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        var data = response['salon'] as Map<String, dynamic>;
        salon = SalonModel.fromJson(data);
        List dataService = response['services'] as List;
        dataService.forEach((element) {
          var item = element as Map<String, dynamic>;
          services.add(ServiceModel.fromJson(item));
        });
        dataService = [];
        dataService = response['products'] as List;
        dataService.forEach((element) {
          var item = element as Map<String, dynamic>;
          products.add(ProductModel.fromJson(item));
        });
        dataService = [];
        dataService = response['comments'] as List;
        dataService.forEach((element) {
          var item = element as Map<String, dynamic>;
          comments.add(CommentModel.fromJson(item));
        });
        dataService = [];
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
    getSalonDetail();
    super.onInit();
  }
}
