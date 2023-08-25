import 'package:easycut/controller/home/profile_controller.dart';
import 'package:easycut/core/constant/dimensions.dart';
import 'package:easycut/core/shared/widgets/big_text.dart';
import 'package:easycut/core/shared/widgets/small_text.dart';
import 'package:easycut/view/widget/home/cart_profile.dart';
import 'package:easycut/view/widget/home/expandable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileControllerImp());
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.width15),
        child: GetBuilder<ProfileControllerImp>(
          builder: (controller) {
            return Column(
              children: [
                CartProfile(
                  userName: controller.id!,
                  userImage: "",
                  userEmail: "",
                  update: () {},
                ),
                Expanded(
                  child: DefaultTabController(
                    length: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TabBar(
                          labelColor: Colors.black,
                          tabs: [
                            Tab(
                              text: "About",
                            ),
                            Tab(
                              text: "Favorites",
                            ),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: Dimensions.height20),
                                  BigText(text: "About"),
                                  SizedBox(height: Dimensions.height10),
                                  SizedBox(
                                    height: Dimensions.height120,
                                    child: SingleChildScrollView(
                                      child: ExpandableTextWidget(
                                        text:
                                            "Hello My name is Amr Abdalfatah \nI'm Software Developer \nWorking as freelancer",
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: Dimensions.height10),
                                  BigText(text: "Phone Number"),
                                  SizedBox(height: Dimensions.height10),
                                  SmallText(text: "+201016716496"),
                                  SizedBox(height: Dimensions.height20),
                                  BigText(text: "Address"),
                                  SizedBox(height: Dimensions.height10),
                                  SmallText(
                                      text:
                                          "Tanesha - Birket Elsabaa - ElMenofia"),
                                ],
                              ),
                              GridView.builder(
                                padding: EdgeInsets.symmetric(
                                  vertical: Dimensions.height20,
                                ),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: Dimensions.height15,
                                  crossAxisSpacing: Dimensions.height15,
                                  childAspectRatio: 3 / 4,
                                ),
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  return Container(
                                    color: Colors.red,
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
            );
          },
        ),
      ),
    );
  }
}
