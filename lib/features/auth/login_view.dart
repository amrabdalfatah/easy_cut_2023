import 'package:easycut/core/utils/colors.dart';
import 'package:easycut/core/utils/dimensions.dart';
import 'package:easycut/core/utils/images_strings.dart';
import 'package:easycut/core/view_model/auth_view_model.dart';
import 'package:easycut/core/widgets/small_text.dart';
import 'package:easycut/features/auth/forgot_password_view.dart';
import 'package:easycut/features/auth/widgets/header_auth.dart';
import 'package:easycut/features/home/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'register_email_password_view.dart';

class LoginView extends GetWidget<AuthViewModel> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: Dimensions.screenHeight,
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.width15,
            vertical: Dimensions.height15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const HeaderAuth(
                imageAsset: ImagesStrings.logo,
                title: "Hi again!",
                firstDesc: "So happy to see you again ,",
                secondDesc: "login to continue managing and saving your time.",
              ),
              Expanded(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // Enter Email
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            style: const TextStyle(
                              color: AppColors.mainColor,
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  Dimensions.radius20,
                                ),
                              ),
                              hintText: "Email",
                              prefixIcon: const Icon(
                                Icons.email,
                                color: AppColors.mainColor,
                              ),
                            ),
                            onSaved: (value) {
                              controller.email = value!;
                            },
                            validator: (value) {
                              final regex = RegExp(
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                              if (controller.email.isEmpty) {
                                return 'Please, Enter your Email';
                              } else if (!regex.hasMatch(value!)) {
                                return 'Your Email is not valid';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: Dimensions.height10),
                          // Enter Password
                          GetX<AuthViewModel>(
                            builder: (authCTRL) => TextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              style: const TextStyle(
                                color: AppColors.mainColor,
                              ),
                              obscureText: authCTRL.shownPassword.value,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    Dimensions.radius20,
                                  ),
                                ),
                                hintText: "Password",
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: AppColors.mainColor,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    controller.changeShownPassword();
                                  },
                                  icon: Icon(
                                    controller.shownPassword.value
                                        ? Icons.remove_red_eye_rounded
                                        : Icons.visibility_off,
                                    color: AppColors.mainColor,
                                  ),
                                ),
                              ),
                              onSaved: (value) {
                                controller.password = value!;
                              },
                              validator: (value) {
                                if (controller.password.isEmpty) {
                                  return 'Please, Enter your Password';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(height: Dimensions.height10),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => ForgotPasswordView());
                            },
                            child: const SmallText(
                              text: "Forget Password?",
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      GetX<AuthViewModel>(
                        builder: (process) {
                          return process.action.value
                              ? const Center(
                                  child: CupertinoActivityIndicator(
                                    color: AppColors.mainColor,
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    formKey.currentState!.save();
                                    if (formKey.currentState!.validate()) {
                                      controller.signInWithEmailAndPassword();
                                      Get.offAll(() => HomeView());
                                    }
                                  },
                                  child: Center(
                                    child: Container(
                                      height: Dimensions.height45,
                                      width: Dimensions.screenWidth / 1.5,
                                      decoration: BoxDecoration(
                                        color: AppColors.mainColor,
                                        borderRadius: BorderRadius.circular(
                                          Dimensions.radius30,
                                        ),
                                      ),
                                      child: const Center(
                                        child: SmallText(
                                          text: "Login",
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SmallText(
                            text: "Don't have an account? ",
                            color: Colors.black54,
                            fontWeight: FontWeight.w600,
                          ),
                          TextButton(
                            onPressed: () {
                              Get.to(() => RegisterEmailPasswordView());
                            },
                            child: const SmallText(
                              text: "Create New",
                              color: AppColors.mainColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.width10,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 1,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(
                                    Dimensions.radius20,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.width10,
                              ),
                              child: const SmallText(
                                text: "OR login with",
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 1,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(
                                    Dimensions.radius20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(ImagesStrings.google),
                            SizedBox(width: Dimensions.width20),
                            Image.asset(ImagesStrings.facebook),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height30,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
