import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../error/app_excaptions.dart';
import 'BaseApiServices.dart';

class NetworkApiService extends BaseApiServices {
  @override
  Future getLoginPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;

    try {
      Response response = await post(
        Uri.parse(url),
        body: data,
        headers: {
          'Accept': 'application/json',
        },
      ).timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  // @override
  // Future getGetApiResponse(String url) async {
  //   dynamic responseJson;
  //   try {
  //     final response =
  //         await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
  //     responseJson = returnResponse(response);
  //   } on SocketException {
  //     throw FetchDataException('No Internet Connection');
  //   }

  //   return responseJson;
  // }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);

        return responseJson;
      case 401:
        throw BadRequestException(response.body.toString());
      case 500:
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException(
            'Error accured while communicating with server with status code ${response.statusCode.toString()}');
    }
  }
}
