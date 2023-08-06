import 'package:easycut/core/utils/dimensions.dart';
import 'package:easycut/core/widgets/big_text.dart';
import 'package:easycut/core/widgets/small_text.dart';
import 'package:flutter/material.dart';

class HeaderAuth extends StatelessWidget {
  const HeaderAuth({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.firstDesc,
    required this.secondDesc,
  });

  final String imageAsset;
  final String title;
  final String firstDesc;
  final String secondDesc;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.heightImage - Dimensions.height45,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: Dimensions.height50),
          Expanded(
            child: Center(
              child: Image.asset(imageAsset),
            ),
          ),
          SizedBox(height: Dimensions.height20),
          BigText(
            text: title,
            color: Colors.black,
            size: Dimensions.font32,
          ),
          SizedBox(height: Dimensions.height10),
          SmallText(
            text: firstDesc,
            size: Dimensions.font12,
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.start,
            color: Colors.black54,
          ),
          SmallText(
            text: secondDesc,
            size: Dimensions.font12,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.w600,
            color: Colors.black54,
          ),
          SizedBox(height: Dimensions.height50),
        ],
      ),
    );
  }
}
