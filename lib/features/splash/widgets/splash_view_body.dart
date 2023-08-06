import 'package:easycut/core/utils/colors.dart';
import 'package:easycut/core/utils/dimensions.dart';
import 'package:easycut/core/utils/images_strings.dart';
import 'package:easycut/features/auth/login_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import 'image_sliding_animation.dart';
// import 'text_sliding_animation.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  // late AnimationController animationController;
  // late Animation<Offset> slidingAnimation;
  // late Animation<Offset> slidingImageAnimation;

  @override
  void initState() {
    super.initState();
    // initAnimation();
    navigateToControl();
  }

  @override
  void dispose() {
    // animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          child: Image.asset(
            ImagesStrings.background,
            fit: BoxFit.cover,
          ),
          // child: ImageSlidingAnimation(
          //   slidingImageAnimation: slidingImageAnimation,
          // ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.14,
          // child: TextSlidingAnimation(
          //   slidingAnimation: slidingAnimation,
          // ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Al-Yamama App',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: AppColors.secondaryColor,
                ),
              ),
              Text(
                'Connected with Smart Camera\n to make your Home Smart.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ],
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
    );
  }

  // void initAnimation() {
  //   animationController = AnimationController(
  //     vsync: this,
  //     duration: const Duration(seconds: 3),
  //   );

  //   slidingAnimation = Tween<Offset>(
  //     begin: const Offset(2, 0),
  //     end: const Offset(0, 0),
  //   ).animate(animationController);

  //   slidingImageAnimation = Tween<Offset>(
  //     begin: const Offset(0, 2),
  //     end: const Offset(0, 0),
  //   ).animate(animationController);

  //   animationController.forward();
  // }

  void navigateToControl() {
    Future.delayed(const Duration(seconds: 4), () {
      Get.to(
        () => LoginView(),
        transition: Transition.cupertino,
        duration: kTransitionDuration,
      );
    });
  }
}

// This is a hint for use later
const kTransitionDuration = Duration(milliseconds: 300);
