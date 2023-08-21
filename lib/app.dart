import 'package:easycut/core/constant/color.dart';
import 'package:easycut/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'view/screen/onboarding.dart';

class EasyCut extends StatelessWidget {
  const EasyCut({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Easy Cut",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Roboto",
        scaffoldBackgroundColor: AppColor.backgroundColor,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.black,
          ),
          bodyLarge: TextStyle(
            height: 2,
            color: AppColor.grey,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
      // initialBinding: Binding(),
      home: const OnBoarding(),
      routes: routes,
    );
  }
}
