import 'package:easycut/controller/home/profile_controller.dart';
import 'package:easycut/core/class/handling_data_view.dart';
import 'package:easycut/core/constant/dimensions.dart';
import 'package:easycut/core/shared/widgets/big_text.dart';
import 'package:easycut/view/widget/home/cart_profile.dart';
import 'package:easycut/view/widget/profile/about_profile.dart';
import 'package:easycut/view/widget/profile/profile_favorite_salons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ProfileControllerImp());
    return SafeArea(
      child: GetBuilder<ProfileControllerImp>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CartProfile(
                    userName: controller.profile.name ?? "",
                    userImage: controller.profile.image ?? "",
                    userEmail: controller.profile.email ?? "",
                    logout: () {
                      controller.logout();
                    },
                  ),
                  SizedBox(height: Dimensions.height15),
                  GestureDetector(
                    onTap: () {
                      controller.deleteAccount();
                    },
                    child: BigText(
                      text: "Delete Account",
                      color: Colors.red,
                      size: Dimensions.font20,
                    ),
                  ),
                  SizedBox(height: Dimensions.height15),
                  Expanded(
                    child: DefaultTabController(
                      length: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TabBar(
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
                                AboutProfile(
                                  email: controller.profile.email ?? "",
                                  country: controller.profile.country ?? "",
                                  gender: controller.profile.gender ?? "",
                                  city: controller.profile.city ?? "",
                                  address: controller.profile.address ?? "",
                                  phone: controller.profile.phone ?? "",
                                ),
                                ProfileFavoriteSalons(
                                  favorites: controller.favorites,
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
            ),
          );
        },
      ),
    );
  }
}
