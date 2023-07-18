import 'package:easycut/home/salon_page_body.dart';
import 'package:easycut/utils/colors.dart';
import 'package:easycut/widgets/big_text.dart';
import 'package:easycut/widgets/small_text.dart';
import 'package:flutter/material.dart';

class MainSalonPage extends StatefulWidget {
  const MainSalonPage({super.key});

  @override
  State<MainSalonPage> createState() => _MainSalonPageState();
}

class _MainSalonPageState extends State<MainSalonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(top: 45, bottom: 15),
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text: 'Egypt', color: AppColors.mainColor),
                      Row(
                        children: [
                          SmallText(text: "Menofia", color: Colors.black54),
                          Icon(Icons.arrow_drop_down_rounded),
                        ],
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.mainColor,
                      ),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SalonPageBody(),
        ],
      ),
    );
  }
}
