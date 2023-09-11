import 'package:easycut/controller/home/booking_screen_controller.dart';
import 'package:easycut/core/class/handling_data_view.dart';
import 'package:easycut/core/constant/color.dart';
import 'package:easycut/core/constant/dimensions.dart';
import 'package:easycut/core/shared/widgets/big_text.dart';
import 'package:easycut/core/shared/widgets/small_text.dart';
import 'package:easycut/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingView extends StatelessWidget {
  const BookingView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => BookingScreenControllerImp());
    return SafeArea(
      child: GetBuilder<BookingScreenControllerImp>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
              child: Column(
                children: [
                  SizedBox(
                    height: Dimensions.height50,
                    width: double.infinity,
                    child: const Center(
                      child: BigText(
                        text: "All Bookings",
                      ),
                    ),
                  ),
                  SizedBox(height: Dimensions.height20),
                  Expanded(
                    child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: Dimensions.height350,
                          width: double.infinity,
                          child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: Dimensions.height150,
                                  width: double.infinity,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      Dimensions.radius5,
                                    ),
                                    child: Image.network(
                                      "${AppLink.imageSalons}${controller.bookings[index].image}",
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                                SizedBox(height: Dimensions.height15),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: Dimensions.width10,
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          SmallText(
                                            text: "Salon Name: ",
                                            size: Dimensions.font16,
                                          ),
                                          BigText(
                                            text: controller
                                                .bookings[index].name!,
                                            color: AppColor.primaryColor,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: Dimensions.height10),
                                      Row(
                                        children: [
                                          SmallText(
                                            text: "Salon Email: ",
                                            size: Dimensions.font16,
                                          ),
                                          BigText(
                                            text: controller
                                                .bookings[index].email!,
                                            color: AppColor.primaryColor,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: Dimensions.height10),
                                      Row(
                                        children: [
                                          SmallText(
                                            text: "Salon Phone: ",
                                            size: Dimensions.font16,
                                          ),
                                          BigText(
                                            text: controller
                                                .bookings[index].phone!,
                                            color: AppColor.primaryColor,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: Dimensions.height10),
                                      Row(
                                        children: [
                                          Row(
                                            children: [
                                              SmallText(
                                                text: "Chair: ",
                                                size: Dimensions.font16,
                                              ),
                                              BigText(
                                                text: controller
                                                    .bookings[index].chair!,
                                                color: AppColor.primaryColor,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: Dimensions.width20,
                                          ),
                                          Row(
                                            children: [
                                              SmallText(
                                                text: "Day: ",
                                                size: Dimensions.font16,
                                              ),
                                              BigText(
                                                text: controller
                                                    .bookings[index].day!,
                                                color: AppColor.primaryColor,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: Dimensions.width20,
                                          ),
                                          Row(
                                            children: [
                                              SmallText(
                                                text: "Time: ",
                                                size: Dimensions.font16,
                                              ),
                                              BigText(
                                                text: controller
                                                    .bookings[index].time!,
                                                color: AppColor.primaryColor,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: Dimensions.height10),
                                      Row(
                                        children: [
                                          Row(
                                            children: [
                                              SmallText(
                                                text: "Total: ",
                                                size: Dimensions.font16,
                                              ),
                                              BigText(
                                                text:
                                                    "${controller.bookings[index].total!} \$",
                                                color: AppColor.primaryColor,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: Dimensions.width20,
                                          ),
                                          Row(
                                            children: [
                                              SmallText(
                                                text: "Status: ",
                                                size: Dimensions.font16,
                                              ),
                                              SizedBox(
                                                width: Dimensions.width5,
                                              ),
                                              controller.bookings[index]
                                                          .approve ==
                                                      "0"
                                                  ? Row(
                                                      children: [
                                                        Container(
                                                          height: Dimensions
                                                              .height20,
                                                          width: Dimensions
                                                              .height20,
                                                          decoration:
                                                              const BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color:
                                                                Colors.orange,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width:
                                                              Dimensions.width5,
                                                        ),
                                                        const BigText(
                                                          text: "Waiting",
                                                          color: Colors.orange,
                                                        )
                                                      ],
                                                    )
                                                  : controller.bookings[index]
                                                              .approve ==
                                                          "1"
                                                      ? Row(
                                                          children: [
                                                            Container(
                                                              height: Dimensions
                                                                  .height20,
                                                              width: Dimensions
                                                                  .height20,
                                                              decoration:
                                                                  const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: Colors
                                                                    .green,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: Dimensions
                                                                  .width5,
                                                            ),
                                                            const BigText(
                                                              text: "Accepted",
                                                              color:
                                                                  Colors.green,
                                                            )
                                                          ],
                                                        )
                                                      : Row(
                                                          children: [
                                                            Container(
                                                              height: Dimensions
                                                                  .height20,
                                                              width: Dimensions
                                                                  .height20,
                                                              decoration:
                                                                  const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color:
                                                                    Colors.red,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: Dimensions
                                                                  .width5,
                                                            ),
                                                            const BigText(
                                                              text: "Refused",
                                                              color: Colors.red,
                                                            )
                                                          ],
                                                        ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: Dimensions.height20);
                      },
                      itemCount: controller.bookings.length,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
