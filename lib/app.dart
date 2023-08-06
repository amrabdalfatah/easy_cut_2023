import 'package:easycut/core/utils/colors.dart';
import 'package:easycut/features/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'helper/binding.dart';

class EasyCut extends StatelessWidget {
  const EasyCut({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      theme: ThemeData().copyWith(
        scaffoldBackgroundColor: AppColors.secondaryColor,
      ),
      home: const SplashView(),
    );
  }
}
