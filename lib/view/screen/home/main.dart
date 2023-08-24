import 'package:easycut/controller/home/home_controller.dart';
import 'package:easycut/core/class/handling_data_view.dart';
import 'package:easycut/core/constant/dimensions.dart';
import 'package:easycut/view/widget/home/header_main_view.dart';
import 'package:easycut/view/widget/home/newest_salon_item.dart';
import 'package:easycut/view/widget/home/newest_text.dart';
import 'package:easycut/view/widget/home/sliding_popular_salons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<HomeControllerImp>(
        builder: (controller) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width20,
                ),
                child: HeaderMainView(
                  name: controller.name!,
                ),
              ),
              SizedBox(height: Dimensions.height20),
              HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SlidingPopularSalons(
                          popularSalon: controller.salons,
                        ),
                        SizedBox(height: Dimensions.height20),
                        NewestText(),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return NewestSalonItem();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
