import 'package:easycut/core/localization/change_local.dart';
import 'package:easycut/core/localization/translation.dart';
import 'package:easycut/helper/binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes.dart';

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
      theme: controller.appTheme,
      initialBinding: MyBinding(),
      // routes: routes,
      getPages: routes,
    );
  }
}
