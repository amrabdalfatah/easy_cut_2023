import 'package:easycut/controller/auth/reset_password_controller.dart';
import 'package:easycut/core/constant/dimensions.dart';
import 'package:easycut/view/widget/auth/custom_button_auth.dart';
import 'package:easycut/view/widget/auth/custom_text_form_auth.dart';
import 'package:easycut/view/widget/auth/header_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controller =
        Get.put(ResetPasswordControllerImp());
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.width15,
          vertical: Dimensions.height15,
        ),
        child: ListView(
          children: [
            HeaderAuth(
              title: "30".tr,
              firstDesc: "31".tr,
              secondDesc: "32".tr,
            ),
            CustomTextFormAuth(
              myController: controller.password,
              type: TextInputType.visiblePassword,
              obSecure: true,
              hintText: "18".tr,
              prefixIcon: Icons.lock,
              suffixIcon: Icons.remove_red_eye_rounded,
              suffixPressed: () {},
            ),
            CustomTextFormAuth(
              myController: controller.confirmPassword,
              type: TextInputType.visiblePassword,
              obSecure: true,
              hintText: "33".tr,
              prefixIcon: Icons.lock,
              suffixIcon: Icons.remove_red_eye_rounded,
              suffixPressed: () {},
            ),
            CustomButtonAuth(
              onPressed: () {
                controller.resetPassword();
              },
              text: "30".tr,
            ),
          ],
        ),
      ),
    );
  }
}
