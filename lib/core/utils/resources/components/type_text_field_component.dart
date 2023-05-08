import 'package:flutter/material.dart';
import 'package:sahara_guru_health_services/core/utils/constants/colors.dart';

class TypeTextFieldComponent extends StatelessWidget {
  final textInputAction;
  final validator;
  final controller;
  final keyboardType;
  final hintText;
  final prefixIcon;
  final suffixIcon;
  // final obscureText;
  const TypeTextFieldComponent({
    super.key,
    required this.textInputAction,
    required this.validator,
    required this.controller,
    required this.keyboardType,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    // this.obscureText
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return TextFormField(
      style: theme.textTheme.subtitle2,
      // obscureText: obscureText,
      textInputAction: textInputAction,
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        border: const OutlineInputBorder(),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintStyle: theme.textTheme.subtitle2!.copyWith(color: Colors.grey),
        // enabledBorder: InputBorder.none,
        // filled: true,
        hintText: hintText,
      ),
    );
  }
}
