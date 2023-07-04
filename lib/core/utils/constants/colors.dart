import 'package:flutter/material.dart';

class AppColor {
  static const textColor = Colors.black87;
  static const textButtonColor = Color(0xff010066);
}

Widget arrow(BuildContext context) {
  return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.arrow_back_ios_new_rounded,
        color: Colors.white,
      ));
}

Widget text(BuildContext context, title) {
  var theme = Theme.of(context);
  return Text(title,
      style: theme.textTheme.subtitle1?.copyWith(
          fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18));
}
