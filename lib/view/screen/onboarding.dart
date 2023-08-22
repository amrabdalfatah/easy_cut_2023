import 'package:easycut/view/widget/onboarding/custom_button.dart';
import 'package:easycut/view/widget/onboarding/custom_slider.dart';
import 'package:easycut/view/widget/onboarding/dots_controller.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: CustomSliderOnBoarding(),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomDotControllerOnBoarding(),
                    CustomButtonOnBoarding(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
