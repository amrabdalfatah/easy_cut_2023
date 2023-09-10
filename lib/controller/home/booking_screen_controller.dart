import 'package:easycut/core/class/status_request.dart';
import 'package:easycut/core/functions/handling_data_controller.dart';
import 'package:easycut/core/services/services.dart';
import 'package:easycut/data/data_source/remote/home/booking_user_data.dart';
import 'package:easycut/data/model/booking_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BookingScreenController extends GetxController {
  getAllBookings();
}

class BookingScreenControllerImp extends BookingScreenController {
  String? userId;
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.success;
  BookingUserData bookingUserData = BookingUserData(Get.find());
  List<BookingModel> bookings = [];

  @override
  getAllBookings() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await bookingUserData.getData(
      userId!,
    );
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List data = response['data'] as List;
        data.forEach((element) {
          var item = element as Map<String, dynamic>;
          bookings.add(BookingModel.fromJson(item));
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

  initialData() {
    userId = myServices.sharedPreferences.getString('id')!;
  }

  @override
  void onInit() {
    initialData();
    getAllBookings();
    super.onInit();
  }
}
