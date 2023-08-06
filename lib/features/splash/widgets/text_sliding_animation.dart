import 'package:easycut/core/utils/colors.dart';
import 'package:easycut/core/utils/dimensions.dart';
import 'package:easycut/core/widgets/big_text.dart';
import 'package:flutter/material.dart';

class TextSlidingAnimation extends StatelessWidget {
  const TextSlidingAnimation({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context, _) {
        return Column(
          children: [
            SlideTransition(
              position: slidingAnimation,
              child: const BigText(
                text: 'EASY CUT',
                textAlign: TextAlign.center,
                color: AppColors.mainColor,
              ),
            ),
            SlideTransition(
              position: slidingAnimation,
              child: BigText(
                text: 'save your time',
                textAlign: TextAlign.center,
                size: Dimensions.font20,
                color: Colors.black,
              ),
            ),
          ],
        );
      },
    );
  }
}
