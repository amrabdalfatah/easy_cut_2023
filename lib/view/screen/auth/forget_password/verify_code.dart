import 'package:easycut/controller/auth/verify_code_controller.dart';
import 'package:easycut/core/constant/color.dart';
import 'package:easycut/core/constant/dimensions.dart';
import 'package:easycut/view/widget/auth/header_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerImp controller = Get.put(VerifyCodeControllerImp());
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.width15,
          vertical: Dimensions.height15,
        ),
        child: ListView(
          children: [
            const HeaderAuth(
              title: "OTP Verification!",
              firstDesc: "Check your Email, we've sent code to",
              secondDesc: "email@email.com",
            ),
            PinCodeTextField(
              appContext: context,
              pastedTextStyle: const TextStyle(
                color: AppColor.primaryColor,
                fontWeight: FontWeight.bold,
              ),
              length: 6,
              animationType: AnimationType.fade,
              validator: (v) {
                if (v!.length < 6) {
                  return "Enter Full Number";
                } else {
                  return null;
                }
              },
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: Dimensions.height50,
                fieldWidth: Dimensions.width45,
                activeFillColor: Colors.white,
                inactiveColor: Colors.white,
                disabledColor: Colors.white,
                inactiveFillColor: Colors.white,
                activeColor: Colors.white,
                selectedColor: Colors.white,
                selectedFillColor: Colors.white,
              ),
              cursorColor: Colors.black,
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: true,
              keyboardType: TextInputType.number,
              onChanged: (value) {},
              onCompleted: (value) {
                controller.checkCode();
              },
            ),
          ],
        ),
      ),
    );
  }
}
