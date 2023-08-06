import 'package:easycut/core/utils/colors.dart';
import 'package:easycut/core/utils/dimensions.dart';
import 'package:easycut/core/view_model/auth_view_model.dart';
import 'package:easycut/core/widgets/big_text.dart';
import 'package:easycut/core/widgets/main_button.dart';
import 'package:easycut/core/widgets/small_text.dart';
import 'package:easycut/features/auth/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordView extends GetWidget<AuthViewModel> {
  ForgotPasswordView({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Dimensions.height64,
                      ),
                      BigText(
                        text: 'Forgot Password?',
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
                            'Don\'t worry! It occurs. \nPlease enter your email.',
                        textAlign: TextAlign.start,
                        fontFamily: "Urbanist",
                        fontWeight: FontWeight.w500,
                        size: Dimensions.font16,
                        color: const Color(0xFF8391A1),
                      ),
                      SizedBox(
                        height: Dimensions.height30,
                      ),
                      Card(
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            label: SmallText(
                              text: 'Email',
                              color: AppColors.secondTextColor,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w500,
                            ),
                            suffixIcon: Icon(
                              Icons.email,
                              color: AppColors.secondTextColor,
                            ),
                          ),
                          onSaved: (value) {
                            controller.emailPasswordReset = value!;
                          },
                          validator: (value) {
                            final regex = RegExp(
                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                            if (controller.emailPasswordReset.isEmpty) {
                              return 'Please, Enter your Email';
                            } else if (!regex.hasMatch(value!)) {
                              return 'Your Email is not valid';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height30,
                      ),
                      MainButton(
                        text: 'Reset Now',
                        onTap: () {
                          _formKey.currentState!.save();
                          if (_formKey.currentState!.validate()) {
                            Get.snackbar(
                              'Reset Password',
                              'check your Email \nThe Resetting Password sent to your Email.',
                              snackPosition: SnackPosition.TOP,
                              colorText: const Color.fromARGB(255, 0, 99, 3),
                            );
                            Get.off(() => LoginView());
                            controller.forgetPassword();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
