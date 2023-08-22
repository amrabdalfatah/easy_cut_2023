import 'package:easycut/controller/auth/signup_controller.dart';
import 'package:easycut/core/constant/color.dart';
import 'package:easycut/core/constant/dimensions.dart';
import 'package:easycut/core/shared/widgets/small_text.dart';
import 'package:easycut/view/widget/auth/custom_button_auth.dart';
import 'package:easycut/view/widget/auth/custom_text_form_auth.dart';
import 'package:easycut/view/widget/auth/header_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controller = Get.put(SignUpControllerImp());
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.width15,
          vertical: Dimensions.height15,
        ),
        child: ListView(
          children: [
            SizedBox(
              height: Dimensions.height200,
              child: const HeaderAuth(
                title: "Register Now",
                firstDesc: "So happy to see you,",
                secondDesc: "Let's make your life easy.",
              ),
            ),
            CustomTextFormAuth(
              myController: controller.name,
              type: TextInputType.text,
              hintText: "Full Name",
              prefixIcon: Icons.person,
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
            CustomTextFormAuth(
              myController: controller.phone,
              type: TextInputType.phone,
              hintText: "Phone",
              prefixIcon: Icons.phone_android,
            ),
            Container(
              height: Dimensions.height60,
              padding: const EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                border: const Border(
                  top: BorderSide(
                    color: AppColor.grey,
                    width: 1,
                  ),
                  left: BorderSide(
                    color: AppColor.grey,
                    width: 1,
                  ),
                  right: BorderSide(
                    color: AppColor.grey,
                    width: 1,
                  ),
                  bottom: BorderSide(
                    color: AppColor.grey,
                    width: 1,
                  ),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 6,
                    ),
                    child: Icon(
                      Icons.person_pin,
                      color: AppColor.primaryColor,
                    ),
                  ),
                  Expanded(
                    child: GetBuilder<SignUpControllerImp>(
                      builder: (con) {
                        return DropdownButton(
                          isExpanded: true,
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: AppColor.primaryColor,
                          ),
                          underline: const SizedBox(),
                          value: con.gender,
                          items: [
                            DropdownMenuItem(
                              value: Gender.gender,
                              onTap: () {},
                              child: const Text(
                                'Gender',
                                style: TextStyle(
                                  color: AppColor.grey,
                                ),
                              ),
                            ),
                            DropdownMenuItem(
                              value: Gender.male,
                              onTap: () {},
                              child: const Text(
                                'Male',
                                style: TextStyle(
                                  color: AppColor.grey,
                                ),
                              ),
                            ),
                            DropdownMenuItem(
                              value: Gender.female,
                              onTap: () {},
                              child: const Text(
                                'Female',
                                style: TextStyle(
                                  color: AppColor.grey,
                                ),
                              ),
                            ),
                          ],
                          onChanged: (value) {
                            con.changeGender(value!);
                          },
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            CustomButtonAuth(
              onPressed: () {
                controller.signUp();
              },
              text: "Sign Up",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SmallText(
                  text: "Have an account? ",
                  color: Colors.black54,
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    controller.goBackLogin();
                  },
                  child: const SmallText(
                    text: "Login",
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

/*
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
 */
