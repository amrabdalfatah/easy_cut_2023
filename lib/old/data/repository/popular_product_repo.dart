import 'package:easycut/old/data/api/api_client.dart';
import 'package:easycut/old/utils/constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;

  PopularProductRepo({required this.apiClient});

  Future<http.Response> getPopularProductList() async {
    return await apiClient.getData(AppConstants.POPULAR_PRODUCT_URI);
  }
}
