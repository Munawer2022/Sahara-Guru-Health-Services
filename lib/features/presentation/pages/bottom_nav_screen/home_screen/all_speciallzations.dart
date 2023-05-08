import 'package:flutter/material.dart';
import 'package:sahara_guru_health_services/core/utils/constants/padding.dart';
import 'package:sahara_guru_health_services/core/utils/resources/components/app_bar.dart';
import 'package:sahara_guru_health_services/core/utils/resources/components/search_text_field_component.dart';

import '../../../../../config/routes/routes_names.dart';
import '../../../widgets/slide_horizontal_list.dart';

class AllSpeciallzations extends StatelessWidget {
  const AllSpeciallzations({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    debugPrint('object');
    return Scaffold(
      appBar: const MyAppBarWidget(
        arrow_back: true,
        title: 'Find a Doctor',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              elevation: 0,
              child: Padding(
                padding: card_padding,
                child: const SearchTextFieldComponent(
                    text: 'Doctors, hospitals, specialties, services, d...'),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: screen_padding,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Recent searches', style: theme.textTheme.subtitle2),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Clear all',
                          ))
                    ],
                  ),
                ),
                SlideHorizontalList(
                  text: 'Skin Specialist',
                  ontap: () {
                    Navigator.pushNamed(context, RoutesName.skinspecialists);
                  },
                ),
                SizedBox(
                  height: mediaQuery.height * 0.02,
                ),
                Padding(
                  padding: screen_padding,
                  child: Text('Search by specialty',
                      style: theme.textTheme.subtitle2),
                ),
                Padding(
                  padding: screen_padding,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 2.5, crossAxisCount: 2),
                    itemBuilder: (_, index) => Card(
                      elevation: 0,
                      child: Center(
                        child: ListTile(
                          title: Text('Urologist',
                              style: theme.textTheme.subtitle2),
                          leading: const CircleAvatar(),
                        ),
                      ),
                    ),
                    itemCount: 20,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
