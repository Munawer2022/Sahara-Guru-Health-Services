import 'package:flutter/material.dart';

class SearchTextFieldComponent extends StatelessWidget {
  final text;
  final controller;
  const SearchTextFieldComponent({
    super.key,
    required this.text,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return TextFormField(
      controller: controller,
      style: theme.textTheme.subtitle2,
      decoration: InputDecoration(
        // filled: false,
        // enabledBorder: InputBorder.none,
        contentPadding: EdgeInsets.all(10),
        border: OutlineInputBorder(),
        // prefixIcon: Icon(Icons.search),
        // hintStyle: theme.textTheme.subtitle2,
        hintStyle: theme.textTheme.subtitle2!.copyWith(color: Colors.grey),
        hintText: text,
      ),
    );
  }
}
