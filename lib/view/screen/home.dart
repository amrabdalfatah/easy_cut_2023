import 'package:easycut/controller/home/home_screen_controller.dart';
import 'package:easycut/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      // body: _pages[controller.currentVal],
      body: GetBuilder<HomeScreenControllerImp>(
        builder: (controller) {
          return controller.pages[controller.currentPage];
        },
      ),
      bottomNavigationBar: GetBuilder<HomeScreenControllerImp>(
        builder: (controller) {
          return BottomNavigationBar(
            currentIndex: controller.currentPage,
            type: BottomNavigationBarType.shifting,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            selectedItemColor: AppColor.primaryColor,
            unselectedItemColor: Colors.grey[400],
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications_active),
                label: 'Notification',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month),
                label: 'Booking',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            onTap: (index) {
              controller.changePage(index);
            },
          );
        },
      ),
    );
  }
}
