import 'package:flutter/material.dart';

class CardText extends StatelessWidget {
  final text;
  const CardText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Align(
      alignment: Alignment.centerLeft,
      child: Card(
        // // elevation: 0,
        // color: Colors.blue.shade50,
        // color: Colors.black12,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: theme.textTheme.subtitle2?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}
