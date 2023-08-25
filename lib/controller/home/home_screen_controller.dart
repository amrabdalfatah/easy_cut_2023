import 'package:easycut/view/screen/home/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int val);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentPage = 0;

  List<Widget> pages = [
    MainView(),
    Center(child: Text('Notification')),
    Center(child: Text('Booking')),
    Center(child: Text('Profile')),
  ];

  @override
  changePage(int val) {
    currentPage = val;
    update();
  }
}
