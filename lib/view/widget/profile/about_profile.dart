import 'package:easycut/core/constant/dimensions.dart';
import 'package:easycut/core/shared/widgets/big_text.dart';
import 'package:easycut/core/shared/widgets/small_text.dart';
import 'package:flutter/material.dart';

class AboutProfile extends StatelessWidget {
  final String email;
  final String country;
  final String gender;
  final String city;
  final String address;
  final String phone;
  const AboutProfile({
    super.key,
    required this.email,
    required this.country,
    required this.gender,
    required this.city,
    required this.address,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: Dimensions.height20),
        BigText(text: "Email"),
        SizedBox(height: Dimensions.height10),
        SmallText(text: email),
        SizedBox(height: Dimensions.height10),
        BigText(text: "Gender"),
        SizedBox(height: Dimensions.height10),
        SmallText(text: gender),
        SizedBox(height: Dimensions.height10),
        BigText(text: "Phone Number"),
        SizedBox(height: Dimensions.height10),
        SmallText(text: phone),
        SizedBox(height: Dimensions.height20),
        BigText(text: "Address"),
        SizedBox(height: Dimensions.height10),
        SmallText(text: "$country - $city - $address"),
      ],
    );
  }
}
