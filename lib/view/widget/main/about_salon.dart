import 'package:easycut/core/constant/dimensions.dart';
import 'package:easycut/core/shared/widgets/big_text.dart';
import 'package:easycut/core/shared/widgets/small_text.dart';
import 'package:easycut/data/model/services_model.dart';
import 'package:easycut/linkapi.dart';
import 'package:flutter/material.dart';

class AboutSalon extends StatelessWidget {
  final List<ServiceModel> services;
  const AboutSalon({
    super.key,
    required this.services,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constr) {
        return SizedBox(
          height: constr.maxHeight,
          width: constr.maxWidth,
          child: GridView.builder(
            padding: EdgeInsets.symmetric(
              vertical: Dimensions.height20,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: Dimensions.height15,
              crossAxisSpacing: Dimensions.height15,
              childAspectRatio: 3 / 4,
            ),
            itemCount: services.length,
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
                            "${AppLink.imageServices}${services[index].image}",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Divider(),
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
                                  text: services[index].name!,
                                ),
                                SmallText(
                                  text: "Time: ${services[index].time} min",
                                  size: Dimensions.font16,
                                ),
                                SmallText(
                                  text: "Price: ${services[index].price} \$",
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
          ),
        );
      },
    );
  }
}
