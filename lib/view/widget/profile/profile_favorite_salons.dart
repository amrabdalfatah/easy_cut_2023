import 'package:easycut/core/constant/dimensions.dart';
import 'package:flutter/material.dart';

class ProfileFavoriteSalons extends StatelessWidget {
  const ProfileFavoriteSalons({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(
        vertical: Dimensions.height20,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
    );
  }
}
