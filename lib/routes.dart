import 'package:easycut/core/constant/routes.dart';
import 'package:easycut/view/screen/auth/login.dart';
import 'package:easycut/view/screen/auth/signup.dart';
import 'package:easycut/view/screen/onboarding.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoute.onBoarding: (context) => const OnBoarding(),
  AppRoute.login: (context) => const Login(),
  AppRoute.signUp: (context) => const SignUp(),
};
