import 'package:easycut/core/constant/color.dart';
import 'package:easycut/core/constant/dimensions.dart';
import 'package:easycut/core/constant/image_asset.dart';
import 'package:easycut/core/shared/widgets/big_text.dart';
import 'package:easycut/core/shared/widgets/small_text.dart';
import 'package:flutter/material.dart';

class HeaderMainView extends StatelessWidget {
  final String? image;
  final String name;
  const HeaderMainView({
    super.key,
    required this.name,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        image == null
            ? CircleAvatar(
                radius: Dimensions.radius30,
                backgroundImage: AssetImage(
                  AppImageAsset.profile,
                ),
              )
            : Container(
                height: Dimensions.height60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.network(image!),
              ),
        SizedBox(width: Dimensions.width10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SmallText(
              text: "Hello",
              color: Colors.black,
              size: Dimensions.font16,
            ),
            BigText(
              text: name,
              color: Colors.black,
              size: Dimensions.font20,
            ),
          ],
        ),
        Spacer(),
        Center(
          child: Container(
            width: Dimensions.width45,
            height: Dimensions.height45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                Dimensions.radius15,
              ),
              color: AppColor.primaryColor,
            ),
            child: Icon(
              Icons.menu,
              color: Colors.white,
              size: Dimensions.iconSize24,
            ),
          ),
        ),
      ],
    );
  }
}
