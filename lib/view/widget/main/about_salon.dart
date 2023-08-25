import 'package:easycut/core/constant/dimensions.dart';
import 'package:easycut/core/constant/image_asset.dart';
import 'package:easycut/core/shared/widgets/big_text.dart';
import 'package:easycut/view/widget/home/expandable_text_widget.dart';
import 'package:flutter/material.dart';

class AboutSalon extends StatelessWidget {
  final String description;
  const AboutSalon({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: Dimensions.height10),
        SizedBox(
          height: Dimensions.height120,
          child: SingleChildScrollView(
            child: ExpandableTextWidget(
              text: description,
            ),
          ),
        ),
        SizedBox(height: Dimensions.height10),
        const BigText(text: "Gallery"),
        SizedBox(height: Dimensions.height10),
        SizedBox(
          height: Dimensions.height100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 6,
            itemBuilder: (context, index) {
              return Container(
                height: Dimensions.height100,
                width: Dimensions.width100,
                margin: EdgeInsets.only(
                  right: Dimensions.width10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    Dimensions.radius15,
                  ),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      AppImageAsset.salonFour,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: Dimensions.height10),
      ],
    );
  }
}
