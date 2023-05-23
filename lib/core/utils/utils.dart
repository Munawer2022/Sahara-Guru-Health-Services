import 'package:flutter/material.dart';

class Utils {
  void snackBarMessage(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Text(message.toString()),
        action: SnackBarAction(
          textColor: Colors.white,
          label: 'OK',
          onPressed: () {},
          // onPressed: scaffold.hideCurrentSnackBar
        ),
      ),
    );
  }

  void errorSnackBarMessage(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(message.toString()),
        action: SnackBarAction(
          textColor: Colors.white,
          label: 'OK',
          onPressed: () {},
          // onPressed: scaffold.hideCurrentSnackBar
        ),
      ),
    );
  }
}
