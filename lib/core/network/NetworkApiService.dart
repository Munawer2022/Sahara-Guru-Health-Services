import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:sahara_guru_health_services/features/bottom_nav_screen/appointments/data/models/old_appointment_model.dart';

import '../error/app_excaptions.dart';
import '../utils/constants/app_url.dart';
import 'BaseApiServices.dart';

class NetworkApiService extends BaseApiServices {
  final box = GetStorage();
  @override
  Future loginPostApiResponse(String url, dynamic data) async {
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

  @override
  Future searchDoctorApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${box.read('token')}',
        },
      ).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  @override
  Future<dynamic> baseOldAppointments(String url, dynamic data) async {
    dynamic responseJson;
    try {
      Response response = await get(
        Uri.parse(url),
        headers: data,
      ).timeout(const Duration(seconds: 10));
      // var data = jsonDecode(response.body.toString());
      responseJson = returnResponse(response);
      debugPrint(responseJson.toString());
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

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
