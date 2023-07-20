import 'package:easycut/data/api/api_client.dart';
import 'package:easycut/utils/constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;

  RecommendedProductRepo({required this.apiClient});

  Future<http.Response> getRecommendedProductList() async {
    return await apiClient.getData(AppConstants.RECOMMENDED_PRODUCT_URI);
  }
}
