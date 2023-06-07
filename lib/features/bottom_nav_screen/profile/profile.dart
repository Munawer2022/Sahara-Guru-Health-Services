import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../../core/utils/constants/images.dart';
import '../../../core/utils/constants/padding.dart';
import '../../../core/utils/resources/components/app_bar.dart';

class Profile extends StatelessWidget {
  Profile({
    super.key,
  });
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
          padding: screen_padding,
          child: Card(
            elevation: 0,
            color: Colors.white,
            child: Padding(
              padding: card_padding,
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
                              onBackgroundImageError:
                                  (exception, stackTrace) {},
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
                                size: 80,
                                color: Colors.grey,
                              )),
                            ),
                    ),
                  ),
                  SizedBox(height: mediaQuery.height * 0.02),
                  Text(
                      '${box.read('first_name')} ${box.read('last_name') ?? 'N/A'}',
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
