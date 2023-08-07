import 'package:easycut/features/home/widgets/show_salon_card.dart';
import 'package:easycut/utils/colors.dart';
import 'package:easycut/utils/dimensions.dart';
import 'package:easycut/widgets/app_icon.dart';
import 'package:easycut/widgets/big_text.dart';
import 'package:easycut/features/home/widgets/expandable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularSalonDetail extends StatelessWidget {
  final int pageId;
  const PopularSalonDetail({
    super.key,
    required this.pageId,
  });

  @override
  Widget build(BuildContext context) {
    // var product =
    //     Get.find<PopularProductController>().popularProductList[pageId];
    var product;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: Dimensions.height350,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    product.products[pageId].img!,
                  ),
                  // image: NetworkImage(
                  //   AppConstants.BASE_URL + "/upload/" + product.img!,
                  // ),
                ),
              ),
            ),
          ),
          Positioned(
            left: Dimensions.width20,
            right: Dimensions.width20,
            top: Dimensions.height45,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    // Get.toNamed(RouteHelper.getInitial());
                  },
                  child: AppIcon(icon: Icons.arrow_back_ios),
                ),
                AppIcon(icon: Icons.favorite_border),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.height350 - Dimensions.height30,
            child: Container(
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
                      text: product.products[pageId].name!,
                    ),
                    SizedBox(height: Dimensions.height10),
                    TabBar(
                      labelColor: AppColors.mainColor,
                      unselectedLabelColor: Colors.grey[700],
                      indicatorColor: AppColors.mainColor,
                      tabs: [
                        Tab(
                          text: "About",
                        ),
                        Tab(
                          text: "Products",
                        ),
                        Tab(
                          text: "Comments",
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: Dimensions.height10),
                              SizedBox(
                                height: Dimensions.height100,
                                child: SingleChildScrollView(
                                  child: ExpandableTextWidget(
                                    text: product.products[pageId].description!,
                                  ),
                                ),
                              ),
                              SizedBox(height: Dimensions.height10),
                              BigText(text: "Gallery"),
                              SizedBox(height: Dimensions.height10),
                              SizedBox(
                                height: Dimensions.height100,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      product.products[pageId].images.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      height: Dimensions.height100,
                                      width: Dimensions.width100,
                                      margin: EdgeInsets.only(
                                        right: Dimensions.width10,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          Dimensions.radius15,
                                        ),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                            product
                                                .products[pageId].images[index],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(height: Dimensions.height10),
                            ],
                          ),
                          GridView.builder(
                            padding: EdgeInsets.symmetric(
                              vertical: Dimensions.height20,
                            ),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
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
                          GridView.builder(
                            padding: EdgeInsets.symmetric(
                              vertical: Dimensions.height20,
                            ),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: Dimensions.height15,
                              crossAxisSpacing: Dimensions.height15,
                              childAspectRatio: 3 / 4,
                            ),
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return Container(
                                color: Colors.green,
                              );
                              // return Card(
                              //   margin: EdgeInsets.only(
                              //     bottom: Dimensions.height15,
                              //   ),
                              //   child: Container(
                              //     height: Dimensions.height150,
                              //     padding: EdgeInsets.all(Dimensions.height15),
                              //     child: Column(
                              //       crossAxisAlignment: CrossAxisAlignment.start,
                              //       children: [
                              //         ListTile(
                              //           leading: CircleAvatar(
                              //             radius: Dimensions.radius30,
                              //             backgroundImage: AssetImage(
                              //               'assets/images/salonbk/salon1.jpg',
                              //             ),
                              //           ),
                              //           title: BigText(
                              //             text: "Amr Abdalfatah",
                              //           ),
                              //           subtitle: SmallText(
                              //             text: "20 Minutes Ago",
                              //           ),
                              //           trailing: SizedBox(
                              //             width: Dimensions.width45,
                              //             child: Row(
                              //               children: [
                              //                 Icon(
                              //                   Icons.star,
                              //                   size: Dimensions.width15,
                              //                   color: Colors.yellow,
                              //                 ),
                              //                 SmallText(
                              //                   text: "5.00",
                              //                   color: Colors.black45,
                              //                 ),
                              //               ],
                              //             ),
                              //           ),
                              //         ),
                              //         Container(
                              //           height: 1,
                              //           color: Colors.grey[300],
                              //         ),
                              //         SizedBox(
                              //           height: Dimensions.height10,
                              //         ),
                              //         Expanded(
                              //           child: SmallText(
                              //             text: "Hiiiiiiiiiiiiiiiiii\nHello My name ",
                              //             color: Colors.black45,
                              //           ),
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.height80,
        color: AppColors.mainColor,
        child: Center(
          child: TextButton(
            onPressed: () {},
            child: BigText(
              text: "Booking Now",
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
