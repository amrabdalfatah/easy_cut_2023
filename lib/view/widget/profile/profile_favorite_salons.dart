import 'package:easycut/core/constant/dimensions.dart';
import 'package:easycut/core/shared/widgets/big_text.dart';
import 'package:easycut/core/shared/widgets/small_text.dart';
import 'package:easycut/data/model/favorite_model.dart';
import 'package:easycut/linkapi.dart';
import 'package:flutter/material.dart';

class ProfileFavoriteSalons extends StatelessWidget {
  final List<FavoriteModel> favorites;
  const ProfileFavoriteSalons({
    super.key,
    required this.favorites,
  });

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
      itemCount: favorites.length,
      itemBuilder: (context, index) {
        return Card(
          child: Padding(
            padding: EdgeInsets.all(Dimensions.width5),
            child: Column(
              children: [
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    child: Image.network(
                      "${AppLink.imageSalons}${favorites[index].image}",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const Divider(),
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: Dimensions.width5,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          BigText(
                            text: favorites[index].name!,
                          ),
                          SmallText(
                            text: "${favorites[index].phone}",
                            size: Dimensions.font16,
                          ),
                          SmallText(
                            text: "${favorites[index].email}",
                            size: Dimensions.font16,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
