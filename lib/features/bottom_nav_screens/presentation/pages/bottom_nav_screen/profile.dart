import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sahara_guru_health_services/core/utils/resources/components/button.dart';
import 'package:sahara_guru_health_services/features/bottom_nav_screens/presentation/pages/bottom_nav_screen/appointments/my_appointment.dart';

import '../../../../../core/utils/constants/images.dart';
import '../../../../../core/utils/resources/components/app_bar.dart';

class Profile extends StatelessWidget {
  Profile({super.key});
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const MyAppBarWidget(
        bottom: false,
        arrow_back: false,
        title: 'Profile',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Card(
            elevation: 0,
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(height: mediaQuery.height * 0.05),
                SizedBox(
                  width: 120,
                  height: 120,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.black.withOpacity(.2),
                            blurRadius: 10,
                          )
                        ]),
                    child: box.read('profile') != null
                        ? CircleAvatar(
                            backgroundColor: Colors.white,
                            onBackgroundImageError: (exception, stackTrace) {},
                            backgroundImage: NetworkImage(
                                department_doctors_profiles +
                                    box.read('profile').toString()),
                            radius: 25,
                          )
                        : const CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.white,
                            child: Center(
                                child: Icon(
                              CupertinoIcons.person_alt,
                              size: 100,
                              color: Colors.grey,
                            )),
                          ),
                  ),
                ),
                SizedBox(height: mediaQuery.height * 0.02),
                Text(
                    '${box.read('first_name').toString()} ${box.read('last_name').toString()}',
                    style: Theme.of(context).textTheme.headline4),
                Text(box.read('email') ?? 'N/A',
                    style: Theme.of(context).textTheme.bodyText2),
                SizedBox(height: mediaQuery.height * 0.04),
                ProfileMenuWidget(
                  title: "Phone",
                  leading: CupertinoIcons.phone_circle_fill,
                  trailing: Text(box.read('phone_number') ?? 'N/A'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.leading,
    this.trailing,
  }) : super(key: key);

  final String title;
  final IconData leading;
  final trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () {},
        trailing: trailing,
        leading: Icon(leading),
        title: Text(
          title,
        ));
  }
}
