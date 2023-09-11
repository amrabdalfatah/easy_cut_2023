import 'package:easycut/controller/home/home_controller.dart';
import 'package:easycut/core/class/handling_data_view.dart';
import 'package:easycut/core/constant/dimensions.dart';
import 'package:easycut/core/shared/widgets/small_text.dart';
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
    // Get.lazyPut(() => HomeControllerImp());
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
                  image: controller.image!,
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
                        SizedBox(
                          height: Dimensions.pageView + Dimensions.height20,
                          child: controller.popSalons.isEmpty
                              ? Center(
                                  child: SmallText(
                                    text:
                                        "Sorry, \nThere is no Salon highly rated on your location",
                                    size: Dimensions.font16,
                                  ),
                                )
                              : SlidingPopularSalons(
                                  popularSalon: controller.popSalons,
                                ),
                        ),
                        SizedBox(height: Dimensions.height20),
                        Container(
                          height: 2,
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(
                            horizontal: Dimensions.width30,
                            vertical: Dimensions.height10,
                          ),
                          color: Colors.grey[300],
                        ),
                        const NewestText(
                          title: 'Near for you',
                        ),
                        controller.nearSalons.isEmpty
                            ? SizedBox(
                                height: Dimensions.height100,
                                child: Center(
                                  child: SmallText(
                                    text:
                                        "Sorry, \nThere is no Salon near for your city",
                                    size: Dimensions.font16,
                                  ),
                                ),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: controller.nearSalons.length,
                                itemBuilder: (context, index) {
                                  return NewestSalonItem(
                                    salon: controller.nearSalons[index],
                                  );
                                },
                              ),
                        Container(
                          height: 2,
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(
                            horizontal: Dimensions.width30,
                            vertical: Dimensions.height10,
                          ),
                          color: Colors.grey[300],
                        ),
                        const NewestText(
                          title: "Newest Salons",
                        ),
                        controller.newSalons.isEmpty
                            ? SizedBox(
                                height: Dimensions.height100,
                                child: Center(
                                  child: SmallText(
                                    text:
                                        "Sorry, \nThere is no New Salon At your Country",
                                    size: Dimensions.font16,
                                  ),
                                ),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: controller.newSalons.length,
                                itemBuilder: (context, index) {
                                  return NewestSalonItem(
                                    salon: controller.newSalons[index],
                                  );
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
