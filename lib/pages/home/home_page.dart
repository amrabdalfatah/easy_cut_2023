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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainSalonPage(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius15),
          color: Colors.red,
        ),
        child: BottomNavigationBar(
          currentIndex: _currpage,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notification_important),
              label: 'Notification',
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
