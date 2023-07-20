import 'package:easycut/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getPopularProductList() async {
    http.Response response = await popularProductRepo.getPopularProductList();
    print(response.body);
    if (response.statusCode == 200) {
      print("Got Products");
      _popularProductList = [];
      // _popularProductList.addAll(Product.fromJson(response.).products);
      // print(_popularProductList);
      _isLoaded = true;
      update();
    } else {
      print('Failed');
    }
  }
}
