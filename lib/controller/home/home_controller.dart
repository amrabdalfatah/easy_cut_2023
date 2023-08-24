import 'package:easycut/core/class/status_request.dart';
import 'package:easycut/core/functions/handling_data_controller.dart';
import 'package:easycut/core/services/services.dart';
import 'package:easycut/data/data_source/remote/home/home_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  initialData();
  getData();
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  String? id;
  String? name;
  String? email;
  String? phone;
  String? gender;
  String? country;
  String? city;

  HomeData homeData = HomeData(Get.find());
  StatusRequest statusRequest = StatusRequest.success;
  List salons = [];

  @override
  initialData() {
    id = myServices.sharedPreferences.getString('id');
    name = myServices.sharedPreferences.getString('name');
    email = myServices.sharedPreferences.getString('email');
    phone = myServices.sharedPreferences.getString('phone');
    gender = myServices.sharedPreferences.getString('gender');
    country = myServices.sharedPreferences.getString('country');
    city = myServices.sharedPreferences.getString('city');
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homeData.postData(
      gender!,
      country!,
      city!,
    );
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        salons.addAll(response['salons']);
      } else {
        Get.snackbar(
          'Warning',
          'There is no data for your country',
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
    super.onInit();
  }
}
