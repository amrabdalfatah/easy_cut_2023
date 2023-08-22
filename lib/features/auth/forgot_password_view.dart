// import 'package:easycut/core/utils/colors.dart';
// import 'package:easycut/core/utils/dimensions.dart';
// import 'package:easycut/core/view_model/auth_view_model.dart';
// import 'package:easycut/core/widgets/main_button.dart';
// import 'package:easycut/features/auth/otp_verification_password_view.dart';
// import 'package:easycut/view/widget/auth/header_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class ForgotPasswordView extends GetWidget<AuthViewModel> {
//   ForgotPasswordView({Key? key}) : super(key: key);
//
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           height: Dimensions.screenHeight,
//           padding: EdgeInsets.symmetric(
//             horizontal: Dimensions.width15,
//             vertical: Dimensions.height15,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               const HeaderAuth(
//                 title: "Forgot Password!",
//                 firstDesc: "Don't worry it happens !",
//                 secondDesc: "Please enter them email address.",
//               ),
//               Form(
//                 key: _formKey,
//                 child: Column(
//                   children: [
//                     TextFormField(
//                       keyboardType: TextInputType.emailAddress,
//                       style: const TextStyle(
//                         color: AppColors.mainColor,
//                       ),
//                       decoration: InputDecoration(
//                         filled: true,
//                         fillColor: Colors.white,
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(
//                             Dimensions.radius20,
//                           ),
//                         ),
//                         hintText: "Email",
//                         prefixIcon: const Icon(
//                           Icons.email,
//                           color: AppColors.mainColor,
//                         ),
//                       ),
//                       onSaved: (value) {
//                         controller.email = value!;
//                       },
//                       validator: (value) {
//                         final regex = RegExp(
//                             r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
//                         if (controller.email.isEmpty) {
//                           return 'Please, Enter your Email';
//                         } else if (!regex.hasMatch(value!)) {
//                           return 'Your Email is not valid';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(
//                       height: Dimensions.height30,
//                     ),
//                     MainButton(
//                       text: 'Check Email',
//                       onTap: () {
//                         _formKey.currentState!.save();
//                         // if (_formKey.currentState!.validate()) {
//                         //   Get.snackbar(
//                         //     'Reset Password',
//                         //     'check your Email \nThe Resetting Password sent to your Email.',
//                         //     snackPosition: SnackPosition.TOP,
//                         //     colorText: const Color.fromARGB(255, 0, 99, 3),
//                         //   );
//                         //   Get.off(() => LoginView());
//                         //   controller.forgetPassword();
//                         // }
//                         Get.to(() => OtpVerificationPasswordView());
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
