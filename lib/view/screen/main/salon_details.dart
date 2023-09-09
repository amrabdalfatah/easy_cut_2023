import 'package:easycut/controller/main/salon_detail_controller.dart';
import 'package:easycut/core/class/handling_data_view.dart';
import 'package:easycut/core/constant/color.dart';
import 'package:easycut/core/constant/dimensions.dart';
import 'package:easycut/core/constant/routes.dart';
import 'package:easycut/core/shared/widgets/big_text.dart';
import 'package:easycut/view/widget/home/app_icon.dart';
import 'package:easycut/view/widget/main/stack_image_detail.dart';
import 'package:easycut/view/widget/main/stack_salon_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SalonDetails extends StatelessWidget {
  const SalonDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SalonDetailControllerImp());
    return Scaffold(
      body: GetBuilder<SalonDetailControllerImp>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      StackImageDetail(salonImage: "${controller.salon.image}"),
                      Positioned(
                        left: Dimensions.width20,
                        right: Dimensions.width20,
                        top: Dimensions.height45,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: const AppIcon(icon: Icons.arrow_back_ios),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.changeFavoriteState();
                              },
                              child: AppIcon(
                                icon: controller.isFavorite!
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                iconColor: controller.isFavorite!
                                    ? Colors.red
                                    : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      StackSalonDetails(
                        salon: controller.salon,
                        services: controller.services,
                        products: controller.products,
                        comments: controller.comments,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: Dimensions.height60,
                  width: double.infinity,
                  color: AppColor.primaryColor,
                  child: MaterialButton(
                    onPressed: () {
                      Get.toNamed(AppRoute.bookSalonView, arguments: {
                        "id": controller.salon.id,
                      });
                    },
                    child: const BigText(
                      text: "Booking Now",
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
