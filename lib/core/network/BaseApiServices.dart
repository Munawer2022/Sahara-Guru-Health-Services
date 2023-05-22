import 'package:flutter/cupertino.dart';

abstract class BaseApiServices {
  // Future<dynamic> getGetApiResponse(String url);

  Future<dynamic> getLoginPostApiResponse(
      BuildContext context, String url, dynamic data);
}
