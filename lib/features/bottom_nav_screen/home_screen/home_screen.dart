import 'package:flutter/material.dart';

import 'package:get_storage/get_storage.dart';

import '../../../core/utils/resources/components/app_bar.dart';

import '../../../core/utils/constants/padding.dart';
import '../../../core/utils/utils.dart';
import 'all_speciallzations/presentation/pages/home_slide_horizontal_list.dart';

import '../../../config/routes/routes_names.dart';

import '../../../core/utils/resources/components/button.dart';

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
        readOnly: true,
        ontap: () {
          Navigator.pushNamed(context, RoutesName.searchdoctor);
        },
        bottom: true,
        bottomText: 'Find Dectors, Specialities, Disease and Hospital',
        arrow_back: false,
        title: 'Sara Health',
        actions: [
          IconButton(
              onPressed: () {
                box.remove('token').then((value) {
                  box.remove('profile');
                  box.remove('first_name');
                  box.remove('last_name');
                  box.remove('email');
                  box.remove('phone_number');
                  Navigator.pushNamed(context, RoutesName.loginscreen);
                }).onError((error, stackTrace) {
                  Utils().errorSnackBarMessage(error.toString(), context);
                });
              },
              icon: const Icon(
                Icons.power_settings_new_outlined,
                color: Colors.white,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: screen_padding,
          child: Column(
            children: [
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
                        const HomeSlideHorizontalList(),
                        Padding(
                            padding: card_padding,
                            child: Button(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RoutesName.allSpeciallzations);
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
                        const HomeSlideHorizontalList(),
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
                        const HomeSlideHorizontalList(),
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
