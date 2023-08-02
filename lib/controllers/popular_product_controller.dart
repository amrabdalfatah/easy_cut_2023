import 'package:easycut/constant/imageasset.dart';
import 'package:easycut/models/products_model.dart';
import 'package:get/get.dart';

import '../data/repository/popular_product_repo.dart';

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
          img: ImageAsset.onBoardingOne,
          location: 'Egypt',
          createdAt: '23 Feb, 2023',
          updatedAt: '24 Feb, 2023',
          typeId: 2,
          images: [
            ImageAsset.onBoardingOne,
            ImageAsset.onBoardingTwo,
            ImageAsset.onBoardingThree,
            ImageAsset.onBoardingOne,
            ImageAsset.onBoardingTwo,
            ImageAsset.onBoardingThree,
          ],
        ),
        ProductModel(
          id: 2,
          name: 'Head & Clear',
          description: 'This is the first element for static',
          price: 24,
          stars: 5,
          img: ImageAsset.onBoardingOne,
          location: 'Egypt',
          createdAt: '23 Feb, 2023',
          updatedAt: '24 Feb, 2023',
          typeId: 2,
          images: [
            ImageAsset.onBoardingOne,
            ImageAsset.onBoardingTwo,
            ImageAsset.onBoardingThree,
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
