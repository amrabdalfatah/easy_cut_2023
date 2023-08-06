import 'package:easycut/core/utils/images_strings.dart';
import 'package:flutter/material.dart';

class ImageSlidingAnimation extends StatelessWidget {
  const ImageSlidingAnimation({
    super.key,
    required this.slidingImageAnimation,
  });

  final Animation<Offset> slidingImageAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingImageAnimation,
      builder: (context, _) {
        return SlideTransition(
          position: slidingImageAnimation,
          child: Image.asset(
            ImagesStrings.background,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
