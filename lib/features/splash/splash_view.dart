import 'package:easycut/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: AppColors.mainColor,
      ),
      child: const Scaffold(
        backgroundColor: AppColors.mainColor,
      ),
    );
  }
}
