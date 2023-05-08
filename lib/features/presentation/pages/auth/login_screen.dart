import 'package:flutter/material.dart';

import 'package:sahara_guru_health_services/core/utils/resources/components/type_text_field_component.dart';
import 'package:sahara_guru_health_services/core/utils/constants/padding.dart';

import '../../../../config/routes/routes_names.dart';

import '../../../../core/utils/resources/components/button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
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
                  title: 'Continue',
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.otpscreen);
                    if (_formKey.currentState!.validate()) {}
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
