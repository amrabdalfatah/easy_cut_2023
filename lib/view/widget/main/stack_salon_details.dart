import 'package:easycut/core/constant/color.dart';
import 'package:easycut/core/constant/dimensions.dart';
import 'package:easycut/data/model/comment_model.dart';
import 'package:easycut/data/model/products_model.dart';
import 'package:easycut/data/model/salon_model.dart';
import 'package:easycut/data/model/services_model.dart';
import 'package:easycut/view/widget/home/show_salon_card.dart';
import 'package:easycut/view/widget/main/about_salon.dart';
import 'package:easycut/view/widget/main/show_products_salon.dart';
import 'package:flutter/material.dart';

class StackSalonDetails extends StatelessWidget {
  final SalonModel salon;
  final List<ServiceModel> services;
  final List<ProductModel> products;
  final List<CommentModel> comments;
  const StackSalonDetails({
    super.key,
    required this.salon,
    required this.services,
    required this.products,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: Dimensions.height350 - Dimensions.height70,
      left: 0,
      right: 0,
      bottom: 0,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              Container(
                height: constraints.maxHeight,
                width: constraints.maxWidth,
                padding: EdgeInsets.only(
                  right: Dimensions.width20,
                  left: Dimensions.width20,
                  top: Dimensions.height20,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius30),
                    topLeft: Radius.circular(Dimensions.radius30),
                  ),
                ),
                child: DefaultTabController(
                  length: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShowSalonCard(
                        text: "${salon.name}",
                        phone: "${salon.phone}",
                        gender: "${salon.categoryId}",
                        rate: "${salon.rate}",
                      ),
                      SizedBox(height: Dimensions.height10),
                      TabBar(
                        labelColor: AppColor.primaryColor,
                        unselectedLabelColor: Colors.grey[700],
                        indicatorColor: AppColor.primaryColor,
                        tabs: const [
                          Tab(
                            text: "Services",
                          ),
                          Tab(
                            text: "Products",
                          ),
                          // Tab(
                          //   text: "Comments",
                          // ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            AboutSalon(services: services),
                            ShowProductsSalon(products: products),
                            // ShowCommentsSalon(comments: comments),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
