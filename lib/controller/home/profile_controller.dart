import 'package:easycut/core/class/status_request.dart';
import 'package:easycut/core/constant/routes.dart';
import 'package:easycut/core/functions/handling_data_controller.dart';
import 'package:easycut/core/services/services.dart';
import 'package:easycut/data/data_source/remote/home/profile_data.dart';
import 'package:easycut/data/model/favorite_model.dart';
import 'package:easycut/data/model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ProfileController extends GetxController {
  getData();
  logout();
  deleteAccount();
}

class ProfileControllerImp extends ProfileController {
  MyServices myServices = Get.find();
  String? id;

  ProfileData profileData = ProfileData(Get.find());
  StatusRequest statusRequest = StatusRequest.success;
  ProfileModel profile = ProfileModel();
  List<FavoriteModel> favorites = [];

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
        var data = response['profile'] as Map<String, dynamic>;
        profile = ProfileModel.fromJson(data);
        List items = response['favorites'] as List;
        items.forEach((element) {
          var item = element as Map<String, dynamic>;
          favorites.add(FavoriteModel.fromJson(item));
        });
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
  deleteAccount() {
    Get.defaultDialog(
      title: "Delete Account",
      middleText: "Are you sure to delete your account?",
      actions: [
        TextButton(
          onPressed: () async {
            Get.back();
            statusRequest = StatusRequest.loading;
            update();
            var response = await profileData.deleteData(
              id!,
              profile.image!,
            );
            statusRequest = handlingData(response);
            if (statusRequest == StatusRequest.success) {
              if (response['status'] == 'success') {
                logout();
              } else {
                Get.snackbar(
                  'Warning',
                  'Failed to Delete Account, Try Again',
                  snackPosition: SnackPosition.TOP,
                  colorText: Colors.red,
                );
                statusRequest = StatusRequest.failure;
              }
            }
            update();
          },
          child: const Text(
            "Yes",
            style: TextStyle(
              color: Colors.red,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text(
            "No",
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }

  @override
  void onInit() {
    initialData();
    getData();
    super.onInit();
  }

  @override
  logout() {
    Get.offAllNamed(AppRoute.login);
    myServices.sharedPreferences.clear();
    myServices.sharedPreferences.setString('step', '1');
  }
}
