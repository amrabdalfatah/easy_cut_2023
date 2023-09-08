import 'package:easycut/core/class/status_request.dart';
import 'package:easycut/core/functions/handling_data_controller.dart';
import 'package:easycut/core/services/services.dart';
import 'package:easycut/data/data_source/remote/home/home_data.dart';
import 'package:easycut/data/model/salon_model.dart';
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
  String? gender;
  String? country;
  String? city;
  String? image;

  HomeData homeData = HomeData(Get.find());
  StatusRequest statusRequest = StatusRequest.success;
  List<SalonModel> popSalons = [];
  List<SalonModel> nearSalons = [];
  List<SalonModel> newSalons = [];

  @override
  initialData() {
    id = myServices.sharedPreferences.getString('id');
    name = myServices.sharedPreferences.getString('name');
    gender = myServices.sharedPreferences.getString('gender');
    country = myServices.sharedPreferences.getString('country');
    city = myServices.sharedPreferences.getString('city');
    image = myServices.sharedPreferences.getString('image');
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
        List data = [];
        data.addAll(response['popsalons']);
        data.forEach((element) {
          element = element as Map<String, dynamic>;
          popSalons.add(SalonModel.fromJson(element));
        });
        data = [];
        data.addAll(response['nearsalons']);
        data.forEach((element) {
          element = element as Map<String, dynamic>;
          nearSalons.add(SalonModel.fromJson(element));
        });
        data = [];
        data.addAll(response['newsalons']);
        data.forEach((element) {
          element = element as Map<String, dynamic>;
          newSalons.add(SalonModel.fromJson(element));
        });
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
