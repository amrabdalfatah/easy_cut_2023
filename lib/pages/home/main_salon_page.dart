import 'package:easycut/constant/imageasset.dart';
import 'package:easycut/utils/colors.dart';
import 'package:easycut/utils/dimensions.dart';
import 'package:flutter/material.dart';

import 'salon_page_body.dart';

class MainSalonPage extends StatelessWidget {
  const MainSalonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: Dimensions.height45,
            bottom: Dimensions.height15,
          ),
          padding: EdgeInsets.only(
            left: Dimensions.width20,
            right: Dimensions.width20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: Dimensions.radius20,
                backgroundImage: AssetImage(
                  ImageAsset.profileAvatar,
                ),
              ),
              Center(
                child: Container(
                  width: Dimensions.width45,
                  height: Dimensions.height45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      Dimensions.radius15,
                    ),
                    color: AppColors.mainColor,
                  ),
                  child: Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: Dimensions.iconSize24,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: SalonPageBody(),
          ),
        ),
      ],
    );
  }
}
