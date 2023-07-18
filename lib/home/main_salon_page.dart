import 'package:easycut/home/salon_page_body.dart';
import 'package:easycut/utils/colors.dart';
import 'package:easycut/utils/dimensions.dart';
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
              margin: EdgeInsets.only(
                top: Dimensions.height45,
                bottom: Dimensions.height15,
              ),
              padding: EdgeInsets.only(
                left: Dimensions.width20,
                right: Dimensions.width20,
              ),
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
                      width: Dimensions.width45,
                      height: Dimensions.height45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          Dimensions.radius15,
                        ),
                        color: AppColors.mainColor,
                      ),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: Dimensions.iconSize24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: SalonPageBody(),
            ),
          ),
        ],
      ),
    );
  }
}
