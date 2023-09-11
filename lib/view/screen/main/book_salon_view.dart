import 'package:easycut/controller/main/booking_controller.dart';
import 'package:easycut/core/class/handling_data_view.dart';
import 'package:easycut/core/constant/color.dart';
import 'package:easycut/core/constant/dimensions.dart';
import 'package:easycut/core/constant/routes.dart';
import 'package:easycut/core/shared/widgets/big_text.dart';
import 'package:easycut/core/shared/widgets/small_text.dart';
import 'package:easycut/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookSalonView extends StatelessWidget {
  const BookSalonView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => BookingControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.offNamed(AppRoute.home);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Book Now',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: GetBuilder<BookingControllerImp>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Padding(
              padding: EdgeInsets.all(Dimensions.height15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BigText(
                    text: "Name",
                  ),
                  SizedBox(height: Dimensions.height10),
                  SmallText(
                    text: controller.userName,
                    size: Dimensions.font20,
                  ),
                  SizedBox(height: Dimensions.height10),
                  const BigText(
                    text: "Salon Name",
                  ),
                  SizedBox(height: Dimensions.height10),
                  SmallText(
                    text: controller.salon.name!,
                    size: Dimensions.font20,
                  ),
                  SizedBox(height: Dimensions.height10),
                  const BigText(
                    text: "Choose Chair",
                  ),
                  SizedBox(height: Dimensions.height10),
                  SizedBox(
                    height: Dimensions.height45,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: int.parse(controller.salon.chairs!),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            controller.chooseChair(index);
                          },
                          child: Container(
                            height: Dimensions.height45,
                            padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.width10,
                            ),
                            margin: EdgeInsets.symmetric(
                              horizontal: Dimensions.width5,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                Dimensions.radius15,
                              ),
                              color: controller.chair == index
                                  ? AppColor.primaryColor
                                  : Colors.grey,
                            ),
                            child: Center(
                              child: SmallText(
                                text: "Chair ${index + 1}",
                                color: controller.chair == index
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: Dimensions.height10),
                  const BigText(
                    text: "Choose Date",
                  ),
                  SizedBox(height: Dimensions.height10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmallText(
                        text: controller.date,
                        size: Dimensions.font20,
                      ),
                      TextButton(
                        onPressed: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime(
                              DateTime.now().year,
                              DateTime.now().month,
                              DateTime.now().day,
                            ),
                            firstDate: DateTime(
                              DateTime.now().year,
                              DateTime.now().month,
                              DateTime.now().day,
                            ),
                            lastDate: DateTime(DateTime.now().year + 3),
                          ).then((value) {
                            // 2023-08-16 00:00:00.000 -> 2023-08-16
                            var date = value.toString().substring(0, 10);
                            controller.chooseDate(date);
                          }).catchError((error) {});
                        },
                        child: const SmallText(
                          text: "Choose",
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Dimensions.height10),
                  const BigText(
                    text: "Choose Time",
                  ),
                  SizedBox(height: Dimensions.height10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmallText(
                        text: controller.time,
                        size: Dimensions.font20,
                      ),
                      TextButton(
                        onPressed: () {
                          showTimePicker(
                            context: context,
                            initialTime: TimeOfDay(
                              hour: DateTime.now().hour,
                              minute: 0,
                            ),
                          ).then((value) {
                            // TimeOfDay(15:37) -> 15:37
                            var hours =
                                int.parse(value.toString().substring(10, 12));
                            var minutes = value.toString().substring(13, 15);

                            String act = "AM";
                            if (hours > 12) {
                              hours = hours - 12;
                              act = "PM";
                            } else if (hours == 12) {
                              act = "PM";
                            }
                            String finalTime = "$hours:$minutes $act";
                            controller.chooseTime(finalTime);
                          }).catchError((error) {});
                        },
                        child: const SmallText(
                          text: "Choose",
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Dimensions.height10),
                  const BigText(
                    text: "Choose Services",
                  ),
                  SizedBox(height: Dimensions.height10),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.services.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            controller
                                .chooseServices(controller.services[index]);
                          },
                          child: Container(
                            width: Dimensions.width200,
                            padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.width10,
                            ),
                            margin: EdgeInsets.symmetric(
                              horizontal: Dimensions.width5,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                Dimensions.radius15,
                              ),
                              image: DecorationImage(
                                image: NetworkImage(
                                  "${AppLink.imageServices}${controller.services[index].image}",
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(Dimensions.width5),
                                  color: Colors.black54,
                                  child: BigText(
                                    text: controller.services[index].name!,
                                    size: Dimensions.font20,
                                    color: Colors.white,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(Dimensions.width5),
                                  color: Colors.black54,
                                  child: SmallText(
                                    text:
                                        "${controller.services[index].price!} \$",
                                    color: Colors.white,
                                    size: Dimensions.font20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                controller.chosenServices
                                        .contains(controller.services[index])
                                    ? SizedBox(
                                        height: Dimensions.height45,
                                        child: const Icon(
                                          Icons.check_circle,
                                          color: Colors.green,
                                        ),
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: Dimensions.height10),
                  GestureDetector(
                    onTap: () {
                      controller.submitBooking();
                    },
                    child: Container(
                      height: Dimensions.height60,
                      width: double.infinity,
                      color: AppColor.primaryColor,
                      child: const Center(
                        child: BigText(
                          text: "Submit",
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
