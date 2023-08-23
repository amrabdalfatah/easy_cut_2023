import 'package:easycut/core/constant/routes.dart';
import 'package:easycut/core/middleware/my_middleware.dart';
import 'package:easycut/view/screen/auth/activate_code.dart';
import 'package:easycut/view/screen/auth/forget_password/forgot_password.dart';
import 'package:easycut/view/screen/auth/forget_password/reset_password.dart';
import 'package:easycut/view/screen/auth/forget_password/verify_code.dart';
import 'package:easycut/view/screen/auth/login.dart';
import 'package:easycut/view/screen/auth/signup.dart';
import 'package:easycut/view/screen/auth/success.dart';
import 'package:easycut/view/screen/language.dart';
import 'package:easycut/view/screen/onboarding.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
// =================== On Boarding ======================
  GetPage(
    name: "/",
    page: () => const Language(),
    middlewares: [
      MyMiddleware(),
    ],
  ),
  // GetPage(
  //   name: "/",
  //   page: () => const TestView(),
  // ),
  GetPage(
    name: AppRoute.onBoarding,
    page: () => const OnBoarding(),
  ),
// ===================     Auth    ======================
  GetPage(
    name: AppRoute.login,
    page: () => const Login(),
  ),
  GetPage(
    name: AppRoute.signUp,
    page: () => const SignUp(),
  ),
  GetPage(
    name: AppRoute.forgetPassword,
    page: () => const ForgotPassword(),
  ),
  GetPage(
    name: AppRoute.verifyCode,
    page: () => const VerifyCode(),
  ),
  GetPage(
    name: AppRoute.resetPassword,
    page: () => const ResetPassword(),
  ),
  GetPage(
    name: AppRoute.activateCode,
    page: () => const ActivateCode(),
  ),
  GetPage(
    name: AppRoute.success,
    page: () => const Success(),
  ),
];
