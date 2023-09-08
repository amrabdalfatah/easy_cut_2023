import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:easycut/core/functions/check_internet.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

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

  Future<Either<StatusRequest, Map<String, dynamic>>> postDataWithFile(
    String linkUrl,
    Map<String, dynamic> data,
    File file,
  ) async {
    try {
      if (await checkInternet()) {
        var request = http.MultipartRequest(
          "POST",
          Uri.parse(linkUrl),
        );

        var length = await file.length();

        var stream = http.ByteStream(file.openRead());

        var multipartFile = http.MultipartFile(
          "file",
          stream,
          length,
          filename: basename(file.path),
        );

        request.files.add(multipartFile);
        data.forEach((key, value) {
          request.fields[key] = value;
        });
        var myRequest = await request.send();
        var response = await http.Response.fromStream(myRequest);
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
