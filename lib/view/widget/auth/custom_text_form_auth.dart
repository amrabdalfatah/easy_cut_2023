import 'package:easycut/core/constant/color.dart';
import 'package:easycut/core/constant/dimensions.dart';
import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hintText;
  final TextInputType type;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final TextEditingController myController;
  final bool obSecure;
  final void Function()? suffixPressed;

  const CustomTextFormAuth({
    Key? key,
    required this.hintText,
    required this.type,
    required this.prefixIcon,
    this.suffixIcon,
    required this.myController,
    this.obSecure = false,
    this.suffixPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: TextFormField(
        controller: myController,
        keyboardType: type,
        obscureText: obSecure,
        style: const TextStyle(
          color: AppColor.primaryColor,
        ),
        decoration: InputDecoration(
          // filled: true,
          // fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              Dimensions.radius20,
            ),
          ),
          hintText: hintText,
          prefixIcon: Icon(
            prefixIcon,
            color: AppColor.primaryColor,
          ),
          suffixIcon: IconButton(
            onPressed: suffixPressed,
            icon: Icon(
              suffixIcon,
              color: AppColor.primaryColor,
            ),
          ),
        ),
        validator: (value) {
          final regex = RegExp(
              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
          // if (controller.email.isEmpty) {
          //   return 'Please, Enter your Email';
          // } else if (!regex.hasMatch(value!)) {
          //   return 'Your Email is not valid';
          // }
          return null;
        },
      ),
    );
  }
}
