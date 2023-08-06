import 'package:easycut/helper/dependencies.dart';
import 'package:easycut/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app.dart';

void main() async {
  runApp(const EasyCut());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Easy Cut',
      onInit: init,
      // locale: controller.language,
      // theme: controller.appTheme,
      // initialBinding: InitialBindings(),
      getPages: RouteHelper.routes,
      // getPages: routes,
    );
  }
}
