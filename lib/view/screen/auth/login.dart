import 'package:easycut/controller/auth/login_controller.dart';
import 'package:easycut/core/class/handling_data_view.dart';
import 'package:easycut/core/constant/color.dart';
import 'package:easycut/core/constant/dimensions.dart';
import 'package:easycut/core/functions/alert_exit.dart';
import 'package:easycut/core/functions/valid_input.dart';
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
    return Scaffold(
      body: WillPopScope(
        onWillPop: alertExit,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.width15,
            vertical: Dimensions.height15,
          ),
          child: GetBuilder<LoginControllerImp>(
            builder: (controller) {
              return HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Form(
                  key: controller.formState,
                  child: ListView(
                    children: [
                      HeaderAuth(
                        title: "14".tr,
                        firstDesc: "15".tr,
                        secondDesc: "16".tr,
                      ),
                      CustomTextFormAuth(
                        myController: controller.email,
                        valid: (val) {
                          return validInput(val!, 10, 100, 'email');
                        },
                        type: TextInputType.emailAddress,
                        hintText: "17".tr,
                        prefixIcon: Icons.email,
                      ),
                      CustomTextFormAuth(
                        myController: controller.password,
                        valid: (val) {
                          return validInput(val!, 6, 20, 'password');
                        },
                        type: TextInputType.visiblePassword,
                        obSecure: controller.isShowPassword,
                        suffixPressed: () {
                          controller.showPassword();
                        },
                        hintText: "18".tr,
                        prefixIcon: Icons.lock,
                        suffixIcon: controller.isShowPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.goToForgetPassword();
                        },
                        child: Text(
                          "19".tr,
                          textAlign: TextAlign.end,
                          style: const TextStyle(
                            color: AppColor.grey,
                          ),
                        ),
                      ),
                      CustomButtonAuth(
                        onPressed: () {
                          controller.login();
                        },
                        text: "20".tr,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SmallText(
                            text: "21".tr,
                            color: Colors.black54,
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () {
                              controller.goToSignUp();
                            },
                            child: SmallText(
                              text: "22".tr,
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
