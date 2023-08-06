import 'package:easycut/core/utils/colors.dart';
import 'package:easycut/core/utils/dimensions.dart';
import 'package:easycut/core/widgets/small_text.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final void Function() onTap;
  final String text;
  final Color color;
  const MainButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.color = AppColors.mainColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: Dimensions.height50,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(Dimensions.radius15),
        ),
        child: Center(
          child: SmallText(
            text: text,
            color: Colors.white,
            fontFamily: "Urbanist",
            fontWeight: FontWeight.w600,
            size: Dimensions.font16,
          ),
        ),
      ),
    );
  }
}
