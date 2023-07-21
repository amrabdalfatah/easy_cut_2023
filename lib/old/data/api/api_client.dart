import 'package:easycut/old/utils/constants.dart';
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
    try {
      // Uri url = Uri(host: AppConstants.BASE_URL, path: uri);
      final url = Uri.parse(AppConstants.BASE_URL + uri);
      print(url);
      var response = await get(uri).then((value) {
        print('Inside get from Getx');
        print(value.body);
      });
      print('Response from Getx done');

      

      

      // print('Response ${response.statusCode}');

      return response;
    } catch (e) {
      print('Error Api Client ' + e.toString());
      // return Response(
      //   statusCode: 1,
      //   statusText: e.toString(),
      // );
      return Response(
        bodyString: e.toString(),
        statusCode: 1,
      );
    }
  }
}
