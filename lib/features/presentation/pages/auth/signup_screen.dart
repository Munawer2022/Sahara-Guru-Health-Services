import 'package:flutter/material.dart';
import 'package:sahara_guru_health_services/core/utils/resources/components/type_text_field_component.dart';
import 'package:sahara_guru_health_services/core/utils/constants/padding.dart';

import '../../../../config/routes/routes_names.dart';
import '../../../../core/utils/resources/components/button.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

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
              Text("Sign Up", style: theme.textTheme.headline2),
              Row(
                children: [
                  Text(
                    "Already have an account?",
                    style: theme.textTheme.subtitle2,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RoutesName.loginscreen);
                      },
                      child: const Text(
                        'Sign in!',
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
                height: mediaQuery.height * 0.04,
              ),
              Button(
                  title: 'Continue',
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.userdetail);
                    if (_formKey.currentState!.validate()) {}
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
