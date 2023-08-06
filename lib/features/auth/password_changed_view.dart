import 'package:easycut/core/utils/dimensions.dart';
import 'package:easycut/core/utils/images_strings.dart';
import 'package:easycut/core/widgets/big_text.dart';
import 'package:easycut/core/widgets/main_button.dart';
import 'package:easycut/core/widgets/small_text.dart';
import 'package:easycut/features/auth/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordChangedView extends StatelessWidget {
  const PasswordChangedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Dimensions.screenHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const BigText(
              text: "Forgot Password",
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width15,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: Dimensions.height100,
                      width: Dimensions.height100,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(ImagesStrings.background),
                        ),
                      ),
                      child: Icon(
                        Icons.done_rounded,
                        size: Dimensions.height64,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height30,
                    ),
                    BigText(
                      text: 'Password Changed!',
                      fontFamily: "Urbanist",
                      fontWeight: FontWeight.w700,
                      size: Dimensions.font32,
                      color: const Color(0xFF1E232C),
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    SmallText(
                      text: 'Your password has been changed \nsuccessfully.',
                      textAlign: TextAlign.center,
                      fontFamily: "Urbanist",
                      fontWeight: FontWeight.w500,
                      size: Dimensions.font16,
                      color: const Color(0xFF8391A1),
                    ),
                    SizedBox(
                      height: Dimensions.height45,
                    ),
                    MainButton(
                      text: 'Back to Login',
                      onTap: () {
                        Get.offAll(() => LoginView());
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
