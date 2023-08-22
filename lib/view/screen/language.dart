import 'package:easycut/core/localization/change_local.dart';
import 'package:easycut/view/widget/language/custom_button_lang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Language extends GetView<LocalController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '1'.tr,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 20),
            CustomButtonLang(
              textButton: 'AR',
              onPressed: () {
                controller.changeLang('ar');
              },
            ),
            CustomButtonLang(
              textButton: 'EN',
              onPressed: () {
                controller.changeLang('en');
              },
            ),
            CustomButtonLang(
              textButton: 'DE',
              onPressed: () {
                controller.changeLang('de');
              },
            ),
          ],
        ),
      ),
    );
  }
}