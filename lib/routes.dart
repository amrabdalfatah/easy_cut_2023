import 'package:easycut/core/constant/routes.dart';
import 'package:easycut/view/screen/auth/activate_code.dart';
import 'package:easycut/view/screen/auth/forget_password/forgot_password.dart';
import 'package:easycut/view/screen/auth/forget_password/reset_password.dart';
import 'package:easycut/view/screen/auth/forget_password/verify_code.dart';
import 'package:easycut/view/screen/auth/login.dart';
import 'package:easycut/view/screen/auth/signup.dart';
import 'package:easycut/view/screen/auth/success.dart';
import 'package:easycut/view/screen/onboarding.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  // =================== On Boarding ======================
  AppRoute.onBoarding: (context) => const OnBoarding(),
  // ===================     Auth    ======================
  AppRoute.login: (context) => const Login(),
  AppRoute.signUp: (context) => const SignUp(),
  AppRoute.forgetPassword: (context) => const ForgotPassword(),
  AppRoute.verifyCode: (context) => const VerifyCode(),
  AppRoute.resetPassword: (context) => const ResetPassword(),
  AppRoute.activateCode: (context) => const ActivateCode(),
  AppRoute.success: (context) => const Success(),
};
