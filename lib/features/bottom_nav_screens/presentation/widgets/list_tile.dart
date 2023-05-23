import 'package:flutter/material.dart';

Widget listTile(dynamic text, subtitle, leading) {
  return Builder(builder: (context) {
    ThemeData theme;
    theme = Theme.of(context);
    return ListTile(
        title: Text(text,
            style: theme.textTheme.subtitle2?.copyWith(color: Colors.black54)),
        subtitle: Text(subtitle,
            style: theme.textTheme.subtitle2
                ?.copyWith(fontWeight: FontWeight.bold)),
        leading: Icon(
          leading,
          color: Colors.black87,
          size: 26,
        ));
  });
}
