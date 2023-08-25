import 'package:easycut/core/constant/dimensions.dart';
import 'package:easycut/core/constant/image_asset.dart';
import 'package:flutter/material.dart';

class MainCircleImage extends StatelessWidget {
  final String image;
  const MainCircleImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height100,
      width: Dimensions.height100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          Dimensions.radius50,
        ),
        child: Image.asset(
          AppImageAsset.profile,
          fit: BoxFit.cover,
        ),
        // child: Image.network(
        //   image,
        //   fit: BoxFit.cover,
        // ),
      ),
    );
  }
}
