import 'package:easycut/core/constant/color.dart';
import 'package:easycut/core/localization/change_local.dart';
import 'package:easycut/core/localization/translation.dart';
import 'package:easycut/routes.dart';
import 'package:easycut/view/screen/language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EasyCut extends StatelessWidget {
  const EasyCut({super.key});
  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    return GetMaterialApp(
      title: "Easy Cut",
      translations: MyTranslation(),
      locale: controller.language,
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
      home: const Language(),
      routes: routes,
    );
  }
}
