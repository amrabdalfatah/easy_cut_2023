import 'dart:async';

import 'package:easycut/core/utils/dimensions.dart';
import 'package:easycut/core/utils/images_strings.dart';
import 'package:easycut/data/repository/popular_product_repo.dart';
import 'package:easycut/model/user_model.dart';
import 'package:easycut/model/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  // Nav bar with home
  int currentVal = 0;
  void changeCurrentVal(int index) {
    currentVal = index;
    update();
  }

  UserModel? userData;

  ValueNotifier<bool> dataLoaded = ValueNotifier(false);

  @override
  void onInit() {
    super.onInit();

    getUser();
  }

  Future<void> getUser() async {
    userData = UserModel.fromJson({"name": "amr"} as Map<dynamic, dynamic>?);

    dataLoaded.value = true;
    update();
  }

  Future<void> signOut() async {}

  // Add Members Screen
  // PageController pageController = PageController();

  previewFace(String image) {
    Get.dialog(
      AlertDialog(
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.close,
                  color: Color(0xFFC8D1E1),
                ),
              ),
            ),
            Text(
              'Face Image',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 15,
                fontWeight: FontWeight.w600,
                height: 1.8,
              ),
            ),
          ],
        ),
        content: SizedBox(
          width: 200,
          child: Image.network(
            image,
            fit: BoxFit.contain,
            width: 200,
          ),
        ),
      ),
    );
  }

  // Security which detect locaion
  // LocationData? locationData;
  // var markers = RxSet<Marker>();
  // var isLoading = false.obs;
  // var longitude = 0.0.obs;
  // var latitude = 0.0.obs;
  //
  // fetchLocation({
  //   required double long,
  //   required double lat,
  // }) async {
  //   try {
  //     isLoading(true);
  //     longitude.value = long;
  //     latitude.value = lat;
  //   } catch (e) {
  //     Get.snackbar(
  //       'Error while getting data',
  //       e.toString(),
  //       snackPosition: SnackPosition.TOP,
  //       colorText: Colors.red,
  //     );
  //   } finally {
  //     isLoading(false);
  //     createMarkers();
  //   }
  // }
  //
  // createMarkers() {
  //   markers.add(
  //     Marker(
  //       markerId: const MarkerId('Location'),
  //       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
  //       position: LatLng(latitude.value, longitude.value),
  //       onTap: () {},
  //     ),
  //   );
  // }
}

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  List<Product> popularProductsStatic = [
    Product(
      totalSize: 4,
      typeId: 3444,
      offset: 455,
      products: [
        ProductModel(
          id: 1,
          name: 'Salon Eltomy',
          description:
              'This is the first element for static This is the first element for static This is the first element for static This is the first element for static This is the first element for static This is the first element for static This is the first element for static This is the first element for static This is the first element for static',
          price: 24,
          stars: 5,
          img: ImagesStrings.salonOne,
          location: 'Egypt',
          createdAt: '23 Feb, 2023',
          updatedAt: '24 Feb, 2023',
          typeId: 2,
          images: [
            ImagesStrings.salonOne,
            ImagesStrings.salonOne,
            ImagesStrings.salonOne,
            ImagesStrings.salonOne,
            ImagesStrings.salonOne,
            ImagesStrings.salonOne,
            ImagesStrings.salonOne,
          ],
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
          images: [
            ImagesStrings.salonTwo,
            ImagesStrings.salonTwo,
            ImagesStrings.salonTwo,
            ImagesStrings.salonTwo,
            ImagesStrings.salonTwo,
            ImagesStrings.salonTwo,
            ImagesStrings.salonTwo,
          ],
        ),
      ],
    ),
  ];

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  @override
  onInit() {
    super.onInit();
    getPopularProductList();
  }

  Future<void> getPopularProductList() async {
    print("Got Products");
    _popularProductList = [];
    _popularProductList = popularProductsStatic;
    // _popularProductList.addAll(Product.fromJson(response.).products);
    // print(_popularProductList);
    _isLoaded = true;
    update();
    // Response response = await popularProductRepo.getPopularProductList();
    // print(response.body);
    // if (response.statusCode == 200) {
    //   print("Got Products");
    //   _popularProductList = [];
    //   // _popularProductList.addAll(Product.fromJson(response.).products);
    //   // print(_popularProductList);
    //   _isLoaded = true;
    //   update();
    // } else {
    //   print('Failed');
    // }
  }
}
