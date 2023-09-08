import 'package:easycut/core/constant/dimensions.dart';
import 'package:easycut/linkapi.dart';
import 'package:flutter/material.dart';

class StackImageDetail extends StatelessWidget {
  final String salonImage;
  const StackImageDetail({super.key, required this.salonImage});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      child: SizedBox(
        width: double.infinity,
        height: Dimensions.height350,
        child: Image.network(
          "${AppLink.imageSalons}$salonImage",
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
