import 'package:easycut/core/utils/colors.dart';
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SlideTransition(
              position: slidingAnimation,
              child: Text(
                'Al-Yamama App',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: AppColors.secondaryColor,
                ),
              ),
            ),
            SlideTransition(
              position: slidingAnimation,
              child: Text(
                'Connected with Smart Camera\n to make your Home Smart.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
