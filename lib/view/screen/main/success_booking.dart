import 'package:easycut/controller/main/success_booking_controller.dart';
import 'package:easycut/core/constant/color.dart';
import 'package:easycut/core/constant/dimensions.dart';
import 'package:easycut/core/constant/routes.dart';
import 'package:easycut/core/shared/widgets/big_text.dart';
import 'package:easycut/core/shared/widgets/small_text.dart';
import 'package:easycut/view/widget/auth/custom_button_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessBokking extends StatelessWidget {
  const SuccessBokking({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SuccessBookingControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.offNamed(AppRoute.home);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Booking Details',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: GetBuilder<SuccessBookingControllerImp>(
        builder: (controller) {
          return Padding(
            padding: EdgeInsets.all(
              Dimensions.height15,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: Dimensions.height100,
                  width: double.infinity,
                  child: Icon(
                    Icons.warning,
                    color: AppColor.primaryColor,
                    size: Dimensions.height100,
                  ),
                ),
                SizedBox(height: Dimensions.height10),
                BigText(
                  text: "Booking Details",
                  color: AppColor.primaryColor,
                ),
                SizedBox(height: Dimensions.height10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmallText(
                      text: "Salon Name: ",
                      size: Dimensions.font16,
                    ),
                    BigText(
                      text: controller.salonName!,
                      color: AppColor.primaryColor,
                    ),
                  ],
                ),
                SizedBox(height: Dimensions.height10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmallText(
                      text: "Chair: ",
                      size: Dimensions.font16,
                    ),
                    BigText(
                      text: controller.chair!,
                      color: AppColor.primaryColor,
                    ),
                  ],
                ),
                SizedBox(height: Dimensions.height10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmallText(
                      text: "Day: ",
                      size: Dimensions.font16,
                    ),
                    BigText(
                      text: controller.day!,
                      color: AppColor.primaryColor,
                    ),
                  ],
                ),
                SizedBox(height: Dimensions.height10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmallText(
                      text: "Start Time: ",
                      size: Dimensions.font16,
                    ),
                    BigText(
                      text: controller.time!,
                      color: AppColor.primaryColor,
                    ),
                  ],
                ),
                SizedBox(height: Dimensions.height10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmallText(
                      text: "Total Time: ",
                      size: Dimensions.font16,
                    ),
                    BigText(
                      text: "${controller.endTime!} min",
                      color: AppColor.primaryColor,
                    ),
                  ],
                ),
                SizedBox(height: Dimensions.height10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmallText(
                      text: "Total Price: ",
                      size: Dimensions.font16,
                    ),
                    BigText(
                      text: "${controller.total!} \$",
                      color: AppColor.primaryColor,
                    ),
                  ],
                ),
                SizedBox(height: Dimensions.height10),
                SizedBox(
                  width: double.infinity,
                  child: CustomButtonAuth(
                    onPressed: () {
                      Get.offNamed(AppRoute.home);
                    },
                    text: "Back to Home",
                  ),
                ),
                SizedBox(height: Dimensions.height20),
                BigText(
                  text:
                      "Your Booking is still not accepted, \nplease wait until salon accepted your booking \nyou can see your bookings in bookings tap from home screen.",
                  color: Colors.red,
                  size: Dimensions.font16,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
