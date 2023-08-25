import 'package:easycut/controller/main/salon_detail_controller.dart';
import 'package:easycut/core/class/handling_data_view.dart';
import 'package:easycut/core/constant/color.dart';
import 'package:easycut/core/constant/dimensions.dart';
import 'package:easycut/core/constant/image_asset.dart';
import 'package:easycut/core/shared/widgets/big_text.dart';
import 'package:easycut/view/widget/home/app_icon.dart';
import 'package:easycut/view/widget/home/expandable_text_widget.dart';
import 'package:easycut/view/widget/home/show_salon_card.dart';
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
                      Positioned(
                        left: 0,
                        right: 0,
                        child: Container(
                          width: double.infinity,
                          height: Dimensions.height350,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                AppImageAsset.salonOne,
                              ),
                            ),
                          ),
                        ),
                      ),
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
                              child: AppIcon(icon: Icons.arrow_back_ios),
                            ),
                            AppIcon(icon: Icons.favorite_border),
                          ],
                        ),
                      ),
                      Positioned(
                        top: Dimensions.height350 - Dimensions.height70,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            return SizedBox(
                              height: constraints.maxHeight,
                              width: constraints.maxWidth,
                              child: ListView(
                                children: [
                                  Container(
                                    height: Dimensions.screenHeight -
                                        Dimensions.height150,
                                    padding: EdgeInsets.only(
                                      right: Dimensions.width20,
                                      left: Dimensions.width20,
                                      top: Dimensions.height20,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(
                                            Dimensions.radius30),
                                        topLeft: Radius.circular(
                                            Dimensions.radius30),
                                      ),
                                    ),
                                    child: DefaultTabController(
                                      length: 3,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ShowSalonCard(
                                            text: "${controller.salon.name}",
                                            phone: "${controller.salon.phone}",
                                            gender:
                                                "${controller.salon.categoryId}",
                                            rate: "${controller.salon.rate}",
                                          ),
                                          SizedBox(height: Dimensions.height10),
                                          TabBar(
                                            labelColor: AppColor.primaryColor,
                                            unselectedLabelColor:
                                                Colors.grey[700],
                                            indicatorColor:
                                                AppColor.primaryColor,
                                            tabs: [
                                              Tab(
                                                text: "About",
                                              ),
                                              Tab(
                                                text: "Products",
                                              ),
                                              Tab(
                                                text: "Comments",
                                              ),
                                            ],
                                          ),
                                          Expanded(
                                            child: TabBarView(
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                        height: Dimensions
                                                            .height10),
                                                    SizedBox(
                                                      height:
                                                          Dimensions.height120,
                                                      child:
                                                          SingleChildScrollView(
                                                        child:
                                                            ExpandableTextWidget(
                                                          text:
                                                              "${controller.salon.description}",
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height: Dimensions
                                                            .height10),
                                                    BigText(text: "Gallery"),
                                                    SizedBox(
                                                        height: Dimensions
                                                            .height10),
                                                    SizedBox(
                                                      height:
                                                          Dimensions.height100,
                                                      child: ListView.builder(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        shrinkWrap: true,
                                                        itemCount: 6,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return Container(
                                                            height: Dimensions
                                                                .height100,
                                                            width: Dimensions
                                                                .width100,
                                                            margin:
                                                                EdgeInsets.only(
                                                              right: Dimensions
                                                                  .width10,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                Dimensions
                                                                    .radius15,
                                                              ),
                                                              image:
                                                                  DecorationImage(
                                                                fit: BoxFit
                                                                    .cover,
                                                                image:
                                                                    AssetImage(
                                                                  AppImageAsset
                                                                      .salonFour,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height: Dimensions
                                                            .height10),
                                                  ],
                                                ),
                                                GridView.builder(
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  shrinkWrap: true,
                                                  padding: EdgeInsets.symmetric(
                                                    vertical:
                                                        Dimensions.height20,
                                                  ),
                                                  gridDelegate:
                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 2,
                                                    mainAxisSpacing:
                                                        Dimensions.height15,
                                                    crossAxisSpacing:
                                                        Dimensions.height15,
                                                    childAspectRatio: 3 / 4,
                                                  ),
                                                  itemCount: 4,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Container(
                                                      color: Colors.red,
                                                    );
                                                  },
                                                ),
                                                GridView.builder(
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  shrinkWrap: true,
                                                  padding: EdgeInsets.symmetric(
                                                    vertical:
                                                        Dimensions.height20,
                                                  ),
                                                  gridDelegate:
                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 2,
                                                    mainAxisSpacing:
                                                        Dimensions.height15,
                                                    crossAxisSpacing:
                                                        Dimensions.height15,
                                                    childAspectRatio: 3 / 4,
                                                  ),
                                                  itemCount: 4,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Container(
                                                      color: Colors.green,
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: Dimensions.height60,
                  width: double.infinity,
                  color: AppColor.primaryColor,
                  child: MaterialButton(
                    onPressed: () {},
                    child: BigText(
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
