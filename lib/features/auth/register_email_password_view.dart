import 'package:easycut/core/utils/dimensions.dart';
import 'package:easycut/core/view_model/auth_view_model.dart';
import 'package:easycut/core/widgets/main_button.dart';
import 'package:easycut/core/widgets/sized_space_box.dart';
import 'package:easycut/core/widgets/small_text.dart';
import 'package:easycut/features/auth/login_view.dart';
import 'package:easycut/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/register_input_field.dart';

class RegisterEmailPasswordView extends GetWidget<AuthViewModel> {
  RegisterEmailPasswordView({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Dimensions.screenHeight,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const BigText(
                  text: "Registration",
                ),
                SizedBox(
                  height: Dimensions.screenHeight - Dimensions.heightAppBar,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.width15,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            const SizedSpaceBox(),
                            const SizedSpaceBox(),
                            const SizedSpaceBox(),
                            RegisterInputField(
                              text: 'Name',
                              widget: TextFormField(
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  hintText: 'Yassine',
                                  hintStyle: TextStyle(
                                    fontSize: Dimensions.font16,
                                    color: const Color(0xFF5F5F6B),
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                onSaved: (value) {
                                  controller.name = value!;
                                },
                                validator: (value) {
                                  if (value == null) {
                                    return 'Please, Enter your First Name';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            RegisterInputField(
                              text: 'Email',
                              widget: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  hintText: 'Yassine.serrid@eng.ku.edu.kw',
                                  hintStyle: TextStyle(
                                    fontSize: Dimensions.font16,
                                    color: const Color(0xFF5F5F6B),
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w400,
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
                            ),
                            const SizedSpaceBox(),
                            RegisterInputField(
                              text: 'Phone Number',
                              widget: Row(
                                children: [
                                  SmallText(
                                    text: '+965 ',
                                    color: const Color(0xFF5F5F6B),
                                    size: Dimensions.font16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      keyboardType: TextInputType.phone,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                          left: Dimensions.width10,
                                        ),
                                        hintText: '6933297',
                                        hintStyle: TextStyle(
                                          fontSize: Dimensions.font16,
                                          color: const Color(0xFF5F5F6B),
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      onSaved: (value) {
                                        controller.phone = value!;
                                      },
                                      validator: (value) {
                                        if (controller.phone.isEmpty) {
                                          return 'Please, Enter your Phone';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedSpaceBox(),
                            RegisterInputField(
                              text: 'Enter The Password',
                              widget: GetX<AuthViewModel>(
                                builder: (authCtr) => TextFormField(
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: authCtr.shownPassword.value,
                                  decoration: InputDecoration(
                                    hintText: '**********',
                                    hintStyle: TextStyle(
                                      fontSize: Dimensions.font16,
                                      color: const Color(0xFF5F5F6B),
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        authCtr.changeShownPassword();
                                      },
                                      icon: Icon(
                                        authCtr.shownPassword.value
                                            ? Icons.remove_red_eye_rounded
                                            : Icons.visibility_off,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  onSaved: (value) {
                                    controller.password = value!;
                                  },
                                  validator: (value) {
                                    final regexp = RegExp(
                                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                                    if (controller.password == '') {
                                      return 'Please, Enter Password';
                                    } else if (!regexp.hasMatch(value!)) {
                                      return 'Your Password is weak';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                            const SizedSpaceBox(),
                            RegisterInputField(
                              text: 'Confirm The Password',
                              widget: GetX<AuthViewModel>(
                                builder: (passCtr) => TextFormField(
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: passCtr.shownPassword.value,
                                  decoration: InputDecoration(
                                    hintText: '**********',
                                    hintStyle: TextStyle(
                                      fontSize: Dimensions.font16,
                                      color: const Color(0xFF5F5F6B),
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        passCtr.changeShownPassword();
                                      },
                                      icon: Icon(
                                        passCtr.shownPassword.value
                                            ? Icons.remove_red_eye_rounded
                                            : Icons.visibility_off,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  onSaved: (value) {
                                    controller.confirmPassword = value!;
                                  },
                                  validator: (value) {
                                    if (controller.confirmPassword.isNotEmpty) {
                                      if (controller.confirmPassword ==
                                          controller.password) {
                                        return null;
                                      }
                                      return 'these are not the same';
                                    }
                                    return 'Please, Enter to confirm password';
                                  },
                                ),
                              ),
                            ),
                            const SizedSpaceBox(),
                            const SmallText(
                              text:
                                  '*Passwords should have a minimum length of at least \nseven characters and contain both numeric and \nalphabetic characters',
                              color: Colors.red,
                              textAlign: TextAlign.center,
                              fontFamily: 'Montserrat',
                            ),
                          ],
                        ),
                        MainButton(
                          text: 'Continue',
                          onTap: () {
                            _formKey.currentState!.save();
                            if (_formKey.currentState!.validate()) {
                              Get.to(() => LoginView());
                            }
                          },
                        ),
                        const SizedSpaceBox(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
