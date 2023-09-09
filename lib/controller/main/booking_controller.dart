import 'package:easycut/core/class/status_request.dart';
import 'package:easycut/core/constant/routes.dart';
import 'package:easycut/core/functions/handling_data_controller.dart';
import 'package:easycut/core/services/services.dart';
import 'package:easycut/data/data_source/remote/main/booking_data.dart';
import 'package:easycut/data/data_source/remote/main/service_booking_data.dart';
import 'package:easycut/data/model/salon_model.dart';
import 'package:easycut/data/model/services_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BookingController extends GetxController {
  chooseDate(String chosenDate);
  chooseTime(String chosenTime);
  chooseChair(int index);
  chooseServices(ServiceModel service);
  submitBooking();
}

class BookingControllerImp extends BookingController {
  SalonModel salon = SalonModel();
  List<ServiceModel> services = [];
  String userName = "";
  String userId = "";
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.success;
  BookingData bookingData = BookingData(Get.find());
  BookingServiceData bookingServiceData = BookingServiceData(Get.find());

  initialData() {
    salon = Get.arguments['salon'];
    services = Get.arguments['services'];
    userName = myServices.sharedPreferences.getString('name')!;
    userId = myServices.sharedPreferences.getString('id')!;
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  int chair = 0;
  @override
  chooseChair(int index) {
    chair = index;
    update();
  }

  String date = "Date";
  @override
  chooseDate(String chosenDate) {
    date = chosenDate;
    update();
  }

  List<ServiceModel> chosenServices = [];
  @override
  chooseServices(ServiceModel service) {
    if (chosenServices.contains(service)) {
      chosenServices.remove(service);
    } else {
      chosenServices.add(service);
    }
    update();
  }

  String time = "Time";
  @override
  chooseTime(String chosenTime) {
    time = chosenTime;
    update();
  }

  @override
  submitBooking() async {
    if (date == "Date") {
      Get.snackbar(
        "Warning",
        "Please, choose Date",
        snackPosition: SnackPosition.TOP,
        colorText: Colors.red,
      );
    } else if (time == "Time") {
      Get.snackbar(
        "Warning",
        "Please, choose Time",
        snackPosition: SnackPosition.TOP,
        colorText: Colors.red,
      );
    } else if (chosenServices.isEmpty) {
      Get.snackbar(
        "Warning",
        "Please, choose 1 service minimum",
        snackPosition: SnackPosition.TOP,
        colorText: Colors.red,
      );
    } else {
      int endTime = 0;
      int total = 0;
      chosenServices.forEach((element) {
        endTime += int.parse(element.time!);
        total += int.parse(element.price!);
      });
      statusRequest = StatusRequest.loading;
      update();
      var response = await bookingData.postData(
        salon.id!,
        userId,
        date,
        time,
        "$endTime",
        "${chair + 1}",
        "$total",
      );
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          statusRequest = StatusRequest.loading;
          update();
          var responseBooking = await bookingData.getData(
            userId,
            salon.id!,
          );
          statusRequest = handlingData(responseBooking);
          if (statusRequest == StatusRequest.success) {
            if (responseBooking['status'] == 'success') {
              var bookingId = responseBooking['data']['id'];
              chosenServices.forEach((element) async {
                var responseBookingService = await bookingServiceData.postData(
                  bookingId,
                  element.id!,
                );
                statusRequest = handlingData(responseBookingService);
                if (statusRequest == StatusRequest.success) {
                  if (responseBookingService['status'] == 'success') {
                    Get.snackbar(
                      'Success',
                      'Added Services To Booking',
                      snackPosition: SnackPosition.TOP,
                      colorText: Colors.green,
                      duration: const Duration(milliseconds: 300),
                    );
                  }
                }
              });
              Get.snackbar(
                'Added Booking',
                'Please wait until Salon Accepted your booking',
                snackPosition: SnackPosition.TOP,
                colorText: Colors.green,
              );
              Get.offNamed(AppRoute.successBooking, arguments: {
                "total": "$total",
                "start": time,
                "end": "$endTime",
                "day": date,
                "salon": salon.name,
                "chair": "${chair + 1}",
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
  }
}
