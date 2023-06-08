import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/all_speciallzations_provider.dart';
import '../widget/home_slide_horizontal_list_widget.dart';

class HomeSlideHorizontalList extends StatelessWidget {
  const HomeSlideHorizontalList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Consumer<AllSpeciallzationsProvider>(builder: (context, value, _) {
      return HomeSlideHorizontalListWidget(
        value: value,
      );
    });
  }
}
