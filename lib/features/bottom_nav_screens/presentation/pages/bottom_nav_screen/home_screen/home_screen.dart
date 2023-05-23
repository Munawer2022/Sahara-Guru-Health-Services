import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'package:sahara_guru_health_services/core/utils/resources/components/app_bar.dart';

import 'package:sahara_guru_health_services/core/utils/constants/padding.dart';
import 'package:sahara_guru_health_services/core/utils/utils.dart';
import 'package:sahara_guru_health_services/features/bottom_nav_screens/presentation/widgets/slide_horizontal_list.dart';

import '../../../../../../config/routes/routes_names.dart';

import '../../../../../../core/utils/resources/components/button.dart';
import '../../../../../../core/utils/resources/components/search_text_field_component.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    debugPrint('home');
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Scaffold(
      appBar: MyAppBarWidget(
        arrow_back: false,
        title: 'Sara Health',
        actions: [
          IconButton(
              onPressed: () {
                box.remove('token').then((value) {
                  Navigator.pushNamed(context, RoutesName.loginscreen);
                  Utils().snackBarMessage('Logged out successfully', context);
                }).onError((error, stackTrace) {
                  Utils().errorSnackBarMessage(error.toString(), context);
                });
              },
              icon: const Icon(Icons.logout_rounded))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: screen_padding,
          child: Column(
            children: [
              Card(
                elevation: 0,
                child: Padding(
                  padding: card_padding,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Search for Dector',
                        style: theme.textTheme.headline6,
                      ),
                      SizedBox(
                        height: mediaQuery.height * 0.02,
                      ),
                      const SearchTextFieldComponent(
                          text: 'Find Dectors, Specialities, Disease and...'),
                    ],
                  ),
                ),
              ),
              Card(
                  elevation: 0,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: card_padding,
                          child: Text(
                            "I'm Looking For",
                            style: theme.textTheme.headline6,
                          ),
                        ),
                        SlideHorizontalList(),
                        Padding(
                            padding: card_padding,
                            child: Button(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RoutesName.allspeciallzations);
                              },
                              title: 'All Speciallzations',
                            )),
                      ])),
              Card(
                  elevation: 0,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: card_padding,
                          child: Text(
                            "Previous Doctors",
                            style: theme.textTheme.headline6,
                          ),
                        ),
                        SlideHorizontalList(),
                        SizedBox(
                          height: mediaQuery.height * 0.03,
                        ),
                      ])),
              Card(
                  elevation: 0,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: card_padding,
                          child: Text(
                            "Popular Doctors",
                            style: theme.textTheme.headline6,
                          ),
                        ),
                        SlideHorizontalList(),
                        SizedBox(
                          height: mediaQuery.height * 0.03,
                        ),
                      ])),
            ],
          ),
        ),
      ),
    );
  }
}
