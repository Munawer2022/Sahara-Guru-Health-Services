import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sahara_guru_health_services/core/utils/resources/components/app_bar.dart';
import 'package:sahara_guru_health_services/core/utils/resources/components/type_text_field_component.dart';
import 'package:sahara_guru_health_services/core/utils/constants/padding.dart';

import '../../../../config/routes/routes_names.dart';
import '../../provider/passwordhide_controller.dart';
import '../../../../core/utils/resources/components/button.dart';

class UserDetail extends StatelessWidget {
  UserDetail({super.key});

  // bool _isVisible = false;

  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('user_details');
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: screen_padding,
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: mediaQuery.height * 0.05,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_rounded)),
                SizedBox(
                  height: mediaQuery.height * 0.01,
                ),
                Text("User Detail", style: theme.textTheme.headline2),
                SizedBox(
                  height: mediaQuery.height * 0.050,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TypeTextFieldComponent(
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                            return 'Enter Name';
                          } else
                            null;
                        },
                        controller: nameController,
                        keyboardType: TextInputType.text,
                        hintText: 'Name*',
                      ),
                      SizedBox(
                        height: mediaQuery.height * 0.02,
                      ),
                      TypeTextFieldComponent(
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                            return 'Enter Last Name';
                          } else
                            null;
                        },
                        controller: nameController,
                        keyboardType: TextInputType.text,
                        hintText: 'Last Name*',
                      ),
                      SizedBox(
                        height: mediaQuery.height * 0.02,
                      ),
                      TypeTextFieldComponent(
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                                  .hasMatch(value)) {
                            return 'Enter Email';
                          } else
                            null;
                        },
                        controller: nameController,
                        keyboardType: TextInputType.emailAddress,
                        hintText: 'Email*',
                      ),
                      SizedBox(
                        height: mediaQuery.height * 0.02,
                      ),
                      Consumer<PasswordHideController>(
                        builder: (context, value, child) {
                          print('hideicon');
                          return TextFormField(
                            style: theme.textTheme.subtitle2,
                            textInputAction: TextInputAction.done,
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^[a-zA-Z0-9]{6,16}')
                                      .hasMatch(value)) {
                                return 'Enter Password';
                              } else
                                null;
                            },
                            controller: passwordController,
                            keyboardType: TextInputType.text,
                            obscureText: value.isVisible,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(10),
                              border: const OutlineInputBorder(),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  value.hideicon();
                                },
                                icon: value.isVisible
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off),
                              ),
                              hintStyle: theme.textTheme.subtitle2!
                                  .copyWith(color: Colors.grey),
                              // enabledBorder: InputBorder.none,
                              // filled: true,
                              hintText: 'Password*',
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: mediaQuery.height * 0.05,
                ),
                Button(
                    title: 'Sign in',
                    onTap: () {
                      Navigator.pushNamed(
                          context, RoutesName.bottomnavdashboard);
                      if (_formKey.currentState!.validate()) {
                        // setState(() {
                        //   loading = true;
                        // });
                      }
                    }),
              ]),
        ),
      ),
    ));
  }
}
