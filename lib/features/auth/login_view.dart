import 'package:easycut/core/utils/colors.dart';
import 'package:easycut/core/utils/dimensions.dart';
import 'package:easycut/core/view_model/auth_view_model.dart';
import 'package:easycut/core/widgets/small_text.dart';
import 'package:easycut/features/auth/forgot_password_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: Dimensions.screenHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: Dimensions.heightHalf,
                // child: const HeaderLoginView(),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius15),
                      topRight: Radius.circular(Dimensions.radius15),
                    ),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.width45,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              // Enter Email
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
                              // Enter Password
                              GetX<AuthViewModel>(
                                builder: (authCTRL) => Card(
                                  child: TextFormField(
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: authCTRL.shownPassword.value,
                                    decoration: InputDecoration(
                                      border: const OutlineInputBorder(),
                                      label: const SmallText(
                                        text: 'Password',
                                        color: AppColors.secondTextColor,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w500,
                                      ),
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          controller.changeShownPassword();
                                        },
                                        icon: Icon(
                                          controller.shownPassword.value
                                              ? Icons.remove_red_eye_rounded
                                              : Icons.visibility_off,
                                          color: AppColors.secondTextColor,
                                        ),
                                      ),
                                    ),
                                    onSaved: (value) {
                                      controller.password = value!;
                                    },
                                  ),
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
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: Dimensions.height10),
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
                                      _formKey.currentState!.save();
                                      if (_formKey.currentState!.validate()) {
                                        controller.signInWithEmailAndPassword();
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
                                            fontFamily: "Montserrat",
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.width10,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 4,
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
                                  text: "OR",
                                  color: Colors.black,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 4,
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
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.width45,
                          ),
                          child: Card(
                            color: Colors.white,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Row(
                              children: [
                                Expanded(
                                  child: SmallText(
                                    text: "Scan QR Attached \nTo Your Camera",
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w800,
                                    size: Dimensions.font16,
                                    color: AppColors.secondTextColor,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: Dimensions.height64,
                                    width: Dimensions.width70,
                                    color: AppColors.mainColor,
                                    child: Center(
                                      child: Icon(
                                        Icons.qr_code,
                                        size: Dimensions.height30,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.height30,
                        ),
                      ],
                    ),
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
