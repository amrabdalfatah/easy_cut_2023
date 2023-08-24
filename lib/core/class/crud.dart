import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:easycut/core/functions/check_internet.dart';
import 'package:http/http.dart' as http;

import 'status_request.dart';

class Crud {
  Future<Either<StatusRequest, Map<String, dynamic>>> postData(
      String linkUrl, Map<String, dynamic> data) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(
          Uri.parse(linkUrl),
          body: data,
        );
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map<String, dynamic> responseBody = jsonDecode(response.body);
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverException);
    }
  }
}
