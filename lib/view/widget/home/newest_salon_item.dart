import 'package:easycut/core/constant/color.dart';
import 'package:easycut/core/constant/dimensions.dart';
import 'package:easycut/core/constant/image_asset.dart';
import 'package:easycut/core/constant/routes.dart';
import 'package:easycut/core/shared/widgets/big_text.dart';
import 'package:easycut/core/shared/widgets/small_text.dart';
import 'package:easycut/data/model/salon_model.dart';
import 'package:easycut/view/widget/home/icon_and_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewestSalonItem extends StatelessWidget {
  final SalonModel salon;
  const NewestSalonItem({
    super.key,
    required this.salon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoute.salonDetails, arguments: {
          "salonid": salon.id,
        });
      },
      child: Container(
        margin: EdgeInsets.only(
          left: Dimensions.width20,
          right: Dimensions.width20,
          bottom: Dimensions.height10,
        ),
        child: Row(
          children: [
            Container(
              width: Dimensions.pageViewTextContainer,
              height: Dimensions.pageViewTextContainer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  Dimensions.radius20,
                ),
                color: Colors.white38,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    AppImageAsset.salonOne,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: Dimensions.height100,
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius20),
                    bottomRight: Radius.circular(Dimensions.radius20),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BigText(
                      text: salon.name!,
                      color: Colors.black,
                      size: Dimensions.font20,
                    ),
                    SmallText(
                      text: "${salon.city} | ${salon.address}",
                      color: Colors.black,
                      size: Dimensions.font16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconAndTextWidget(
                          icon: Icons.circle_sharp,
                          text: salon.categoryId == "1" ? "Men" : "Women",
                          iconColor: AppColor.grey,
                        ),
                        IconAndTextWidget(
                          icon: Icons.phone,
                          text: salon.phone!,
                          iconColor: AppColor.primaryColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
