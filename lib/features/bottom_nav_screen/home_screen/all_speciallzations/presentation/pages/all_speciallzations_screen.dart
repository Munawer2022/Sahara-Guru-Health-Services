import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../config/routes/routes_names.dart';
import '../../../../../../core/utils/constants/colors.dart';
import '../../../../../../core/utils/resources/components/app_bar.dart';
import '../provider/all_speciallzations_provider.dart';
import '../widget/all_speciallzations_widget.dart';

class AllSpeciallzationsScreen extends StatelessWidget {
  const AllSpeciallzationsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: true,
            leading: arrow(context),
            backgroundColor: AppColor.textButtonColor,
            title: text(context, 'All Speciallzations')),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Consumer<AllSpeciallzationsProvider>(
                  builder: (context, value, _) {
                return AllSpeciallzationsWidget(value: value);
              }),
            ],
          ),
        )
        // body: MyAppBarWidget(
        //     readOnly: true,
        //     ontap: () {
        //       Navigator.pushNamed(context, RoutesName.searchdoctor);
        //     },
        //     bottomText: 'Find Dectors, Specialities, Disease and Hospital',
        //     arrow_back: true,
        //     title: 'All Speciallzations',
        //     delegate: SliverChildListDelegate([
        //       Consumer<AllSpeciallzationsProvider>(
        //           builder: (context, value, _) {
        //         return AllSpeciallzationsWidget(value: value);
        //       })
        //     ]))
        );
  }
}
