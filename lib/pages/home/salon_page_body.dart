import 'package:dots_indicator/dots_indicator.dart';
import 'package:easycut/core/utils/images_strings.dart';
import 'package:easycut/models/products_model.dart';
import 'package:easycut/routes/route_helper.dart';
import 'package:easycut/utils/colors.dart';
import 'package:easycut/utils/dimensions.dart';
import 'package:easycut/widgets/app_column.dart';
import 'package:easycut/widgets/big_text.dart';
import 'package:easycut/widgets/icon_and_text.dart';
import 'package:easycut/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SalonPageBody extends StatefulWidget {
  const SalonPageBody({super.key});

  @override
  State<SalonPageBody> createState() => _SalonPageBodyState();
}

class _SalonPageBodyState extends State<SalonPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;

  List<Product> popularProductsStatic = [
    Product(
      totalSize: 4,
      typeId: 3444,
      offset: 455,
      products: [
        ProductModel(
          id: 1,
          name: 'Head & Sholders',
          description: 'This is the first element for static',
          price: 24,
          stars: 5,
          img: ImagesStrings.salonTwo,
          location: 'Egypt',
          createdAt: '23 Feb, 2023',
          updatedAt: '24 Feb, 2023',
          typeId: 2,
        ),
        ProductModel(
          id: 2,
          name: 'Head & Clear',
          description: 'This is the first element for static',
          price: 24,
          stars: 5,
          img: ImagesStrings.salonTwo,
          location: 'Egypt',
          createdAt: '23 Feb, 2023',
          updatedAt: '24 Feb, 2023',
          typeId: 2,
        ),
      ],
    ),
  ];

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Dimensions.pageView,
          child: PageView.builder(
            controller: pageController,
            itemCount: popularProductsStatic[0].products.length,
            itemBuilder: (context, position) {
              return _buildPageItem(
                position,
                popularProductsStatic[0].products[position],
                // popularProducts.popularProductList[position],
              );
            },
          ),
        ),
        /*
        GetBuilder<PopularProductController>(
          builder: (popularProducts) {
            return Container(
              height: Dimensions.pageView,
              child: PageView.builder(
                controller: pageController,
                itemCount: popularProductsStatic[0].products.length,
                itemBuilder: (context, position) {
                  return _buildPageItem(
                    position,
                    popularProductsStatic[0].products[position],
                    // popularProducts.popularProductList[position],
                  );
                },
              ),
            );
            // return popularProducts.isLoaded
            //     ? Container(
            //         height: Dimensions.pageView,
            //         child: PageView.builder(
            //           controller: pageController,
            //           itemCount: popularProducts.popularProductList.length,
            //           itemBuilder: (context, position) {
            //             return _buildPageItem(
            //               position,
            //               popularProducts.popularProductList[position],
            //             );
            //           },
            //         ),
            //       )
            //     : CircularProgressIndicator(
            //         color: AppColors.mainColor,
            //       );
          },
        ),

         */
        DotsIndicator(
          // dotsCount: popularProducts.popularProductList.length,
          dotsCount: popularProductsStatic[0].products.length,
          position: _currentPageValue.floor(),
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: Size.square(Dimensions.height10),
            activeSize: Size(Dimensions.height20, Dimensions.height10),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius5),
            ),
          ),
        ),
        /*
        GetBuilder<PopularProductController>(
          builder: (popularProducts) {
            return DotsIndicator(
              // dotsCount: popularProducts.popularProductList.length,
              dotsCount: popularProductsStatic[0].products.length,
              position: _currentPageValue.floor(),
              decorator: DotsDecorator(
                activeColor: AppColors.mainColor,
                size: Size.square(Dimensions.height10),
                activeSize: Size(Dimensions.height20, Dimensions.height10),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimensions.radius5),
                ),
              ),
            );
          },
        ),

         */
        SizedBox(height: Dimensions.height30),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            children: [
              BigText(text: 'Recommended'),
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: popularProductsStatic[0].products.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Get.toNamed(RouteHelper.getRecommendedSalon(index));
              },
              child: Container(
                margin: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  bottom: Dimensions.height10,
                ),
                child: Row(
                  children: [
                    Container(
                      width: Dimensions.pageViewTextContainer,
                      height: Dimensions.pageViewTextContainer,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          Dimensions.radius20,
                        ),
                        color: Colors.white38,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            popularProductsStatic[0].products[index].img!,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: Dimensions.height100,
                        padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.width10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(Dimensions.radius20),
                            bottomRight: Radius.circular(Dimensions.radius20),
                          ),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            BigText(
                              text: popularProductsStatic[0]
                                  .products[index]
                                  .name!,
                            ),
                            SmallText(text: 'Salon Description'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconAndTextWidget(
                                  icon: Icons.circle_sharp,
                                  text: 'Men',
                                  iconColor: AppColors.iconColor1,
                                ),
                                IconAndTextWidget(
                                  icon: Icons.location_on,
                                  text: '1.7km',
                                  iconColor: AppColors.mainColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        /*
        GetBuilder<RecommendedProductController>(
          builder: (recommendedProduct) {
            return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: popularProductsStatic[0].products.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getRecommendedSalon(index));
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                      bottom: Dimensions.height10,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: Dimensions.pageViewTextContainer,
                          height: Dimensions.pageViewTextContainer,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              Dimensions.radius20,
                            ),
                            color: Colors.white38,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                popularProductsStatic[0].products[index].img!,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: Dimensions.height100,
                            padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.width10,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(Dimensions.radius20),
                                bottomRight:
                                    Radius.circular(Dimensions.radius20),
                              ),
                              color: Colors.white,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                BigText(
                                  text: popularProductsStatic[0]
                                      .products[index]
                                      .name!,
                                ),
                                SmallText(text: 'Salon Description'),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconAndTextWidget(
                                      icon: Icons.circle_sharp,
                                      text: 'Men',
                                      iconColor: AppColors.iconColor1,
                                    ),
                                    IconAndTextWidget(
                                      icon: Icons.location_on,
                                      text: '1.7km',
                                      iconColor: AppColors.mainColor,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
            // return recommendedProduct.isLoaded
            //     ? ListView.builder(
            //         shrinkWrap: true,
            //         physics: NeverScrollableScrollPhysics(),
            //         itemCount: recommendedProduct.recommendedProductList.length,
            //         itemBuilder: (context, index) {
            //           return GestureDetector(
            //             onTap: () {
            //               Get.toNamed(RouteHelper.getRecommendedSalon(index));
            //             },
            //             child: Container(
            //               margin: EdgeInsets.only(
            //                 left: Dimensions.width20,
            //                 right: Dimensions.width20,
            //                 bottom: Dimensions.height10,
            //               ),
            //               child: Row(
            //                 children: [
            //                   Container(
            //                     width: Dimensions.pageViewTextContainer,
            //                     height: Dimensions.pageViewTextContainer,
            //                     decoration: BoxDecoration(
            //                       borderRadius: BorderRadius.circular(
            //                         Dimensions.radius20,
            //                       ),
            //                       color: Colors.white38,
            //                       image: DecorationImage(
            //                         fit: BoxFit.cover,
            //                         image: NetworkImage(
            //                           AppConstants.BASE_URL +
            //                               "/uploads/" +
            //                               recommendedProduct
            //                                   .recommendedProductList[index]
            //                                   .img!,
            //                         ),
            //                       ),
            //                     ),
            //                   ),
            //                   Expanded(
            //                     child: Container(
            //                       height: Dimensions.height100,
            //                       padding: EdgeInsets.symmetric(
            //                         horizontal: Dimensions.width10,
            //                       ),
            //                       decoration: BoxDecoration(
            //                         borderRadius: BorderRadius.only(
            //                           topRight:
            //                               Radius.circular(Dimensions.radius20),
            //                           bottomRight:
            //                               Radius.circular(Dimensions.radius20),
            //                         ),
            //                         color: Colors.white,
            //                       ),
            //                       child: Column(
            //                         crossAxisAlignment:
            //                             CrossAxisAlignment.start,
            //                         mainAxisAlignment:
            //                             MainAxisAlignment.spaceEvenly,
            //                         children: [
            //                           BigText(
            //                               text: recommendedProduct
            //                                   .recommendedProductList[index]
            //                                   .name!),
            //                           SmallText(text: 'Salon Description'),
            //                           Row(
            //                             mainAxisAlignment:
            //                                 MainAxisAlignment.spaceBetween,
            //                             children: [
            //                               IconAndTextWidget(
            //                                 icon: Icons.circle_sharp,
            //                                 text: 'Men',
            //                                 iconColor: AppColors.iconColor1,
            //                               ),
            //                               IconAndTextWidget(
            //                                 icon: Icons.location_on,
            //                                 text: '1.7km',
            //                                 iconColor: AppColors.mainColor,
            //                               ),
            //                             ],
            //                           ),
            //                         ],
            //                       ),
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           );
            //         },
            //       )
            //     : CircularProgressIndicator(
            //         color: AppColors.mainColor,
            //       );
          },
        ),

         */
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel popularProduct) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(
              left: Dimensions.width10,
              right: Dimensions.width10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  popularProduct.img!,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteHelper.getPopularSalon(index));
            },
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: Dimensions.pageViewTextContainer,
                margin: EdgeInsets.only(
                  left: Dimensions.width30,
                  right: Dimensions.width30,
                  bottom: Dimensions.height30,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, 0),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(5, 0),
                    ),
                  ],
                ),
                child: Container(
                  padding: EdgeInsets.only(
                    top: Dimensions.height15,
                    left: Dimensions.width15,
                    right: Dimensions.width15,
                  ),
                  child: AppColumn(
                    text: popularProduct.name!,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildPageItem(int index, ProductModel popularProduct) {
  //   Matrix4 matrix = Matrix4.identity();
  //   if (index == _currentPageValue.floor()) {
  //     var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
  //     var currTrans = _height * (1 - currScale) / 2;
  //     matrix = Matrix4.diagonal3Values(1, currScale, 1)
  //       ..setTranslationRaw(0, currTrans, 0);
  //   } else if (index == _currentPageValue.floor() + 1) {
  //     var currScale =
  //         _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
  //     var currTrans = _height * (1 - currScale) / 2;
  //     matrix = Matrix4.diagonal3Values(1, currScale, 1)
  //       ..setTranslationRaw(0, currTrans, 0);
  //   } else if (index == _currentPageValue.floor() - 1) {
  //     var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
  //     var currTrans = _height * (1 - currScale) / 2;
  //     matrix = Matrix4.diagonal3Values(1, currScale, 1)
  //       ..setTranslationRaw(0, currTrans, 0);
  //   } else {
  //     var currScale = 0.8;
  //     matrix = Matrix4.diagonal3Values(1, currScale, 1)
  //       ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
  //   }

  //   return Transform(
  //     transform: matrix,
  //     child: Stack(
  //       children: [
  //         Container(
  //           height: Dimensions.pageViewContainer,
  //           margin: EdgeInsets.only(
  //             left: Dimensions.width10,
  //             right: Dimensions.width10,
  //           ),
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(Dimensions.radius30),
  //             color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
  //             image: DecorationImage(
  //               fit: BoxFit.cover,
  //               image: NetworkImage(
  //                 AppConstants.BASE_URL + "/uploads/" + popularProduct.img!,
  //               ),
  //             ),
  //           ),
  //         ),
  //         GestureDetector(
  //           onTap: () {
  //             Get.toNamed(RouteHelper.getPopularSalon(index));
  //           },
  //           child: Align(
  //             alignment: Alignment.bottomCenter,
  //             child: Container(
  //               height: Dimensions.pageViewTextContainer,
  //               margin: EdgeInsets.only(
  //                 left: Dimensions.width30,
  //                 right: Dimensions.width30,
  //                 bottom: Dimensions.height30,
  //               ),
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(Dimensions.radius20),
  //                 color: Colors.white,
  //                 boxShadow: [
  //                   BoxShadow(
  //                     color: Color(0xFFe8e8e8),
  //                     blurRadius: 5.0,
  //                     offset: Offset(0, 5),
  //                   ),
  //                   BoxShadow(
  //                     color: Colors.white,
  //                     offset: Offset(-5, 0),
  //                   ),
  //                   BoxShadow(
  //                     color: Colors.white,
  //                     offset: Offset(5, 0),
  //                   ),
  //                 ],
  //               ),
  //               child: Container(
  //                 padding: EdgeInsets.only(
  //                   top: Dimensions.height15,
  //                   left: Dimensions.width15,
  //                   right: Dimensions.width15,
  //                 ),
  //                 child: AppColumn(
  //                   text: popularProduct.name!,
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
