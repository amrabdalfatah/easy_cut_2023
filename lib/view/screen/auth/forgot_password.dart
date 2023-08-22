import 'package:easycut/core/constant/dimensions.dart';
import 'package:easycut/view/widget/auth/custom_button_auth.dart';
import 'package:easycut/view/widget/auth/custom_text_form_auth.dart';
import 'package:easycut/view/widget/auth/header_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.width15,
          vertical: Dimensions.height15,
        ),
        child: ListView(
          children: [
            const HeaderAuth(
              title: "Forgot Password!",
              firstDesc: "Don't worry it happens!",
              secondDesc: "Please enter your Email Address.",
            ),
            CustomTextFormAuth(
              myController: TextEditingController(),
              type: TextInputType.emailAddress,
              hintText: "Email",
              prefixIcon: Icons.email,
            ),
            CustomButtonAuth(
              onPressed: () {},
              text: "Check Email",
            ),
          ],
        ),
      ),
    );
  }
}
