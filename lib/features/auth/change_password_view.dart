import 'package:easycut/core/utils/dimensions.dart';
import 'package:easycut/core/widgets/big_text.dart';
import 'package:easycut/core/widgets/main_button.dart';
import 'package:easycut/core/widgets/small_text.dart';
import 'package:easycut/features/auth/password_changed_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/custom_text_form_field.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Dimensions.screenHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Dimensions.height64,
                    ),
                    BigText(
                      text: 'Create new password',
                      fontFamily: "Urbanist",
                      fontWeight: FontWeight.w700,
                      size: Dimensions.font32,
                      color: const Color(0xFF1E232C),
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    SmallText(
                      text:
                          'Your new password must be unique from those \npreviously used.',
                      textAlign: TextAlign.start,
                      fontFamily: "Urbanist",
                      fontWeight: FontWeight.w500,
                      size: Dimensions.font16,
                      color: const Color(0xFF8391A1),
                    ),
                    SizedBox(
                      height: Dimensions.height30,
                    ),
                    const CustomTextFormField(
                      text: 'New Password',
                      type: TextInputType.visiblePassword,
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    const CustomTextFormField(
                      text: 'Confirm Password',
                      type: TextInputType.visiblePassword,
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    MainButton(
                      text: 'Reset Password',
                      onTap: () {
                        Get.to(() => const PasswordChangedView());
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
