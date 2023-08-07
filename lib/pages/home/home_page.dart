import 'package:easycut/pages/profile/profile_page.dart';
import 'package:easycut/utils/colors.dart';
import 'package:easycut/utils/dimensions.dart';
import 'package:flutter/material.dart';

import 'main_salon_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currpage = 0;

  List<Widget> pages = [
    MainSalonPage(),
    Container(color: Colors.red),
    Container(color: Colors.green),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[_currpage],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius15),
          color: Colors.red,
        ),
        child: BottomNavigationBar(
          currentIndex: _currpage,
          type: BottomNavigationBarType.shifting,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          selectedItemColor: AppColors.mainColor,
          unselectedItemColor: Colors.grey[400],
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notification_important),
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
            setState(() {
              _currpage = index;
            });
          },
        ),
      ),
    );
  }
}
