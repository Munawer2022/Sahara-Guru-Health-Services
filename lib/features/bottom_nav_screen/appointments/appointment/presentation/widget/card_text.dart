import 'package:flutter/material.dart';
import 'package:sahara_guru_health_services/core/utils/constants/colors.dart';
import 'package:sahara_guru_health_services/features/bottom_nav_screen/appointments/appointment/presentation/pages/appointments_screen.dart';

class CardText extends StatelessWidget {
  final text;
  const CardText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Card(
          elevation: 0,

          // color: Colors.deepPurpleAccent.shade700,
          // color: Colors.black12,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: theme.textTheme.subtitle2?.copyWith(
                // color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
