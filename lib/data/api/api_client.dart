import 'package:easycut/utils/constants.dart';
import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  // when you call server you need it
  late String token;
  final String appBaseUrl;

  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    token = AppConstants.TOKEN;
    timeout = const Duration(seconds: 30);
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }

  Future<Response> getData(String uri) async {
    print('Get Data from Api Client');
    print(uri);
    try {
      Response response = await get(uri);
      print('Response ${response.statusCode}');
      return response;
    } catch (e) {
      return Response(
        statusCode: 1,
        statusText: e.toString(),
      );
    }
  }
}
