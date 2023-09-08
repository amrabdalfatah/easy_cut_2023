import 'package:easycut/core/constant/dimensions.dart';
import 'package:easycut/linkapi.dart';
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
        child: Image.network(
          "${AppLink.imageUsers}$image",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
