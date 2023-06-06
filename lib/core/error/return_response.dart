import 'dart:convert';

import 'package:http/http.dart' as http;

import 'app_excaptions.dart';

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
