import 'dart:ui';

import 'package:easycut/core/constant/routes.dart';
import 'package:easycut/core/services/services.dart';
import 'package:get/get.dart';

class LocalController extends GetxController {
  Locale? language;
  MyServices myServices = Get.find();

  changeLang(String langCode) {
    Locale locale = Locale(langCode);
    myServices.sharedPreferences.setString('lang', langCode);
    Get.updateLocale(locale);
    Get.offNamed(AppRoute.onBoarding);
  }

  @override
  void onInit() {
    String? sharedPrefLang = myServices.sharedPreferences.getString('lang');
    if (sharedPrefLang == 'ar') {
      language = const Locale('ar');
    } else if (sharedPrefLang == 'de') {
      language = const Locale('de');
    } else if (sharedPrefLang == 'en') {
      language = const Locale('en');
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
