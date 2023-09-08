import 'package:easycut/core/constant/dimensions.dart';
import 'package:easycut/core/shared/widgets/big_text.dart';
import 'package:easycut/core/shared/widgets/small_text.dart';
import 'package:easycut/data/model/products_model.dart';
import 'package:easycut/linkapi.dart';
import 'package:flutter/material.dart';

class ShowProductsSalon extends StatelessWidget {
  final List<ProductModel> products;
  const ShowProductsSalon({
    super.key,
    required this.products,
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
            itemCount: products.length,
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
                            "${AppLink.imageProducts}${products[index].image}",
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
                                  text: products[index].name!,
                                ),
                                SmallText(
                                  text: "Number: ${products[index].number}",
                                  size: Dimensions.font16,
                                ),
                                SmallText(
                                  text: "Price: ${products[index].price} \$",
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
