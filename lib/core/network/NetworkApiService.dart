import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../config/routes/routes_names.dart';
import '../error/app_excaptions.dart';
import 'BaseApiServices.dart';

class NetworkApiService extends BaseApiServices {
  final box = GetStorage();
  @override
  Future getLoginPostApiResponse(
      BuildContext context, String url, dynamic data) async {
    dynamic responseJson;

    try {
      Response response = await post(
        Uri.parse(url),
        body: data,
        headers: {
          'Accept': 'application/json',
        },
      ).timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        Navigator.pushNamed(context, RoutesName.bottomnavdashboard);
        box.write('token', data['token']);
        box.write('id', data['user']['id']);
        box.write('first_name', data['user']['first_name']);
        box.write('last_name', data['user']['last_name']);
      } else {
        return const Text('error');
      }
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
      case 400:
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
