import 'package:easycut/core/utils/dimensions.dart';
import 'package:easycut/view/screen/auth/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'image_sliding_animation.dart';
import 'text_sliding_animation.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  late Animation<Offset> slidingImageAnimation;

  @override
  void initState() {
    super.initState();
    initAnimation();
    navigateToControl();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: Center(
              child: ImageSlidingAnimation(
                slidingImageAnimation: slidingImageAnimation,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.14,
            child: TextSlidingAnimation(
              slidingAnimation: slidingAnimation,
            ),
          ),
          SizedBox(
            height: Dimensions.height10,
          ),
          const Center(
            child: CupertinoActivityIndicator(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  void initAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    slidingAnimation = Tween<Offset>(
      begin: const Offset(2, 0),
      end: const Offset(0, 0),
    ).animate(animationController);

    slidingImageAnimation = Tween<Offset>(
      begin: const Offset(0, 2),
      end: const Offset(0, 0),
    ).animate(animationController);

    animationController.forward();
  }

  void navigateToControl() {
    Future.delayed(const Duration(seconds: 4), () {
      Get.off(
        () => Login(),
        transition: Transition.cupertino,
        duration: kTransitionDuration,
      );
    });
  }
}

// This is a hint for use later
const kTransitionDuration = Duration(milliseconds: 300);
