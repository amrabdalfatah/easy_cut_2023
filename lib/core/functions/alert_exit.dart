import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

alertExit() {
  return Get.defaultDialog(
    title: "47".tr,
    middleText: "48".tr,
    actions: [
      ElevatedButton(
        onPressed: () {
          exit(0);
        },
        child: Text('49'.tr),
      ),
      ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: Text('50'.tr),
      ),
    ],
  );
}
