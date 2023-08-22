import 'package:easycut/controller/auth/login_controller.dart';
import 'package:easycut/core/constant/color.dart';
import 'package:easycut/core/constant/dimensions.dart';
import 'package:easycut/core/shared/widgets/small_text.dart';
import 'package:easycut/view/widget/auth/custom_button_auth.dart';
import 'package:easycut/view/widget/auth/custom_text_form_auth.dart';
import 'package:easycut/view/widget/auth/header_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(LoginControllerImp());
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.width15,
          vertical: Dimensions.height15,
        ),
        child: ListView(
          children: [
            const HeaderAuth(
              title: "Welcome",
              firstDesc: "So happy to see you,",
              secondDesc: "login to continue managing and saving your time.",
            ),
            CustomTextFormAuth(
              myController: controller.email,
              type: TextInputType.emailAddress,
              hintText: "Email",
              prefixIcon: Icons.email,
            ),
            CustomTextFormAuth(
              myController: controller.password,
              type: TextInputType.visiblePassword,
              obSecure: true,
              hintText: "Password",
              prefixIcon: Icons.lock,
              suffixIcon: Icons.remove_red_eye_rounded,
              suffixPressed: () {},
            ),
            GestureDetector(
              onTap: () {
                // Get.to(() => ForgotPasswordView());
              },
              child: const Text(
                "Forget Password?",
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            CustomButtonAuth(
              onPressed: () {},
              text: "Login",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SmallText(
                  text: "Don't have an account? ",
                  color: Colors.black54,
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    controller.goToSignUp();
                  },
                  child: const SmallText(
                    text: "Sign Up",
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            // Padding(
            //   padding: EdgeInsets.symmetric(
            //     horizontal: Dimensions.width10,
            //   ),
            //   child: Row(
            //     children: [
            //       Expanded(
            //         child: Container(
            //           height: 1,
            //           decoration: BoxDecoration(
            //             color: Colors.black,
            //             borderRadius: BorderRadius.circular(
            //               Dimensions.radius20,
            //             ),
            //           ),
            //         ),
            //       ),
            //       Padding(
            //         padding: EdgeInsets.symmetric(
            //           horizontal: Dimensions.width10,
            //         ),
            //         child: const SmallText(
            //           text: "OR login with",
            //           color: Colors.black,
            //           fontWeight: FontWeight.w800,
            //         ),
            //       ),
            //       Expanded(
            //         child: Container(
            //           height: 1,
            //           decoration: BoxDecoration(
            //             color: Colors.black,
            //             borderRadius: BorderRadius.circular(
            //               Dimensions.radius20,
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: Dimensions.height30,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Image.asset(AppImageAsset.google),
            //       SizedBox(width: Dimensions.width20),
            //       Image.asset(AppImageAsset.facebook),
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: Dimensions.height30,
            // ),
          ],
        ),
      ),
    );
  }
}
