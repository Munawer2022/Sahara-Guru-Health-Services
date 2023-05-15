import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import 'package:sahara_guru_health_services/core/utils/resources/components/type_text_field_component.dart';
import 'package:sahara_guru_health_services/core/utils/constants/padding.dart';

import '../../../../config/routes/routes_names.dart';

import '../../../../core/utils/resources/components/button.dart';
import '../../provider/passwordhide_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final box = GetStorage();

  void login() async {
    try {
      Response response = await post(
          Uri.parse(
              'https://saharadigitalhealth.in/sahara_digital_health/public/api/login'),
          headers: {
            'Accept': 'application/json',
          },
          body: {
            'email': emailController.text,
            'password': passwordController.text,
          });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        box.write('token', data['token']);

        if (kDebugMode) {
          print(data['token']);
        }
        if (kDebugMode) {
          print('Login successfully');
        }
      } else {
        if (kDebugMode) {
          print('failed');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: screen_padding,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: mediaQuery.height * 0.1,
              ),
              Text("Sign In", style: theme.textTheme.headline2),
              Row(
                children: [
                  Text("Don't have an account?",
                      style: theme.textTheme.subtitle2),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RoutesName.signupscreen);
                      },
                      child: const Text(
                        'Sign up!',
                      ))
                ],
              ),
              SizedBox(
                height: mediaQuery.height * 0.050,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TypeTextFieldComponent(
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                                .hasMatch(value)) {
                          return 'Enter email or mobile';
                        } else {
                          null;
                        }
                      },
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      hintText: 'Email or Mobile*',
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
                            if (value!.isEmpty
                                //  ||
                                //     !RegExp(r'^[a-zA-Z0-9]{6,16}')
                                //         .hasMatch(value)
                                ) {
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
                height: mediaQuery.height * 0.01,
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot your password?',
                  )),
              SizedBox(
                height: mediaQuery.height * 0.01,
              ),
              Button(
                  loading: loading,
                  title: 'Continue',
                  onTap: () {
                    // Navigator.pushNamed(context, RoutesName.otpscreen);
                    if (_formKey.currentState!.validate()) {
                      login();
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
