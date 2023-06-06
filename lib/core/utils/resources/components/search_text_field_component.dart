import 'package:flutter/material.dart';
import 'package:sahara_guru_health_services/core/utils/resources/components/app_bar.dart';

class SearchTextFieldComponent extends StatelessWidget {
  final text;
  final controller;
  final ontap;
  final readOnly;
  final suffixIcon;
  const SearchTextFieldComponent({
    super.key,
    required this.text,
    this.controller,
    this.ontap,
    this.readOnly,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return TextFormField(
        readOnly: readOnly,
        onTap: ontap,
        controller: controller,
        style: theme.textTheme.subtitle2,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          suffixIcon: suffixIcon,
          // enabledBorder: InputBorder.none,
          contentPadding: const EdgeInsets.all(10),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: borderRadius,
          ),

          // border: OutlineInputBorder(),
          prefixIcon: const Icon(Icons.search),
          // hintStyle: theme.textTheme.subtitle2,
          hintStyle: theme.textTheme.subtitle2!.copyWith(color: Colors.grey),
          hintText: text,
        ));
  }
}
