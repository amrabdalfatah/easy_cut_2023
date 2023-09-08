import 'package:easycut/core/constant/dimensions.dart';
import 'package:easycut/core/shared/widgets/big_text.dart';
import 'package:easycut/core/shared/widgets/small_text.dart';
import 'package:easycut/view/widget/main_circle_image.dart';
import 'package:flutter/material.dart';

class CartProfile extends StatelessWidget {
  final String userName;
  final String userImage;
  final String userEmail;
  final void Function() update;
  const CartProfile({
    super.key,
    required this.userName,
    required this.userImage,
    required this.userEmail,
    required this.update,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.height150,
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(Dimensions.height15),
          child: Column(
            children: [
              SizedBox(
                height: Dimensions.height100,
                child: Row(
                  children: [
                    MainCircleImage(image: userImage),
                    SizedBox(width: Dimensions.width20),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BigText(
                            text: userName,
                          ),
                          SmallText(text: userEmail)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
