import 'package:easycut/data/repository/recommended_product_repo.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({required this.recommendedProductRepo});

  List<dynamic> _recommendedProductList = [];
  List<dynamic> get recommendedProductList => _recommendedProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList() async {
    http.Response response =
        await recommendedProductRepo.getRecommendedProductList();
    print(response.body);
    if (response.statusCode == 200) {
      print("Got Products");
      _recommendedProductList = [];
      // _recommendedProductList.addAll(Product.fromJson(response.body).products);
      // print(_popularProductList);
      _isLoaded = true;
      update();
    } else {
      print('Failed');
    }
  }
}
