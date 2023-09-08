import 'package:easycut/core/constant/dimensions.dart';
import 'package:easycut/data/model/products_model.dart';
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
            itemCount: 4,
            itemBuilder: (context, index) {
              return Container(
                color: Colors.red,
              );
            },
          ),
        );
      },
    );
  }
}
