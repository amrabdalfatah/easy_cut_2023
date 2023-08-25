import 'package:easycut/core/constant/color.dart';
import 'package:easycut/core/constant/dimensions.dart';
import 'package:easycut/core/shared/widgets/big_text.dart';
import 'package:easycut/core/shared/widgets/small_text.dart';
import 'package:easycut/view/widget/home/icon_and_text.dart';
import 'package:flutter/material.dart';

class ShowSalonCard extends StatelessWidget {
  final String text;
  final String phone;
  final String gender;
  final String rate;
  const ShowSalonCard({
    super.key,
    required this.text,
    required this.phone,
    required this.gender,
    required this.rate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: Dimensions.font26,
        ),
        SizedBox(height: Dimensions.height10),
        Row(
          children: [
            Wrap(
              children: List.generate(
                5,
                (index) => Icon(
                  Icons.star,
                  color: index < num.parse(rate).floor()
                      ? AppColor.primaryColor
                      : AppColor.grey,
                  size: Dimensions.height15,
                ),
              ),
            ),
            SizedBox(width: Dimensions.width10),
            SmallText(text: rate),
            // SmallText(text: '1287'),
            // SmallText(text: 'comments'),
          ],
        ),
        SizedBox(height: Dimensions.height10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidget(
              icon: Icons.circle_sharp,
              text: gender == "1" ? "Men" : "Women",
              iconColor: AppColor.grey,
            ),
            IconAndTextWidget(
              icon: Icons.phone,
              text: phone,
              iconColor: AppColor.primaryColor,
            ),
          ],
        ),
      ],
    );
  }
}
