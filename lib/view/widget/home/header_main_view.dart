import 'package:easycut/core/constant/dimensions.dart';
import 'package:easycut/core/shared/widgets/big_text.dart';
import 'package:easycut/core/shared/widgets/small_text.dart';
import 'package:easycut/linkapi.dart';
import 'package:flutter/material.dart';

class HeaderMainView extends StatelessWidget {
  final String image;
  final String name;
  const HeaderMainView({
    super.key,
    required this.name,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: Dimensions.height60,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(Dimensions.height30),
            child: Image.network(
              "${AppLink.imageUsers}$image",
              fit: BoxFit.cover,
            ),
          ),
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
        const Spacer(),
        // Center(
        //   child: Container(
        //     width: Dimensions.width45,
        //     height: Dimensions.height45,
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(
        //         Dimensions.radius15,
        //       ),
        //       color: AppColor.primaryColor,
        //     ),
        //     child: Icon(
        //       Icons.search,
        //       color: Colors.white,
        //       size: Dimensions.iconSize24,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
