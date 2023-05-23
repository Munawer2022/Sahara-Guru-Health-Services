import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../../core/utils/constants/padding.dart';
import '../../../../core/utils/resources/components/button.dart';
import '../../../../core/utils/resources/components/type_text_field_component.dart';
import '../provider/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('login');
    final loginController = Provider.of<LoginController>(context);

    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: screen_padding,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: mediaQuery.height * 0.1,
                ),
                Text("Sign In", style: theme.textTheme.headline2),
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
                      Consumer<LoginController>(
                        builder: (context, value, child) {
                          return TextFormField(
                            style: theme.textTheme.subtitle2,
                            textInputAction: TextInputAction.done,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Password';
                              } else {
                                return null;
                              }
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
                    loading: loginController.loading,
                    title: 'Continue',
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        // login(context);
                        loginController.login(
                            context, emailController, passwordController);
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
 // bool loading = false;
  // TextEditingController emailController = TextEditingController();

  // TextEditingController passwordController = TextEditingController();

  // final box = GetStorage();

  // void login(BuildContext context) async {
  //   setState(() {
  //     loading = true;
  //   });
  //   try {
  //     Response response = await post(
  //         Uri.parse(
  //             'https://saharadigitalhealth.in/sahara_digital_health/public/api/login'),
  //         headers: {
  //           'Accept': 'application/json',
  //         },
  //         body: {
  //           'email': emailController.text,
  //           'password': passwordController.text,
  //         });

  //     if (response.statusCode == 200) {
  //       var data = jsonDecode(response.body.toString());
  //       setState(() {
  //         loading = true;
  //       });

  //       Navigator.pushNamed(context, RoutesName.bottomnavdashboard);
  //       box.write('token', data['token']);
  //       box.write('id', data['user']['id']);
  //       box.write('first_name', data['user']['first_name']);
  //       box.write('last_name', data['user']['last_name']);
  //     } else {
  //       setState(() {
  //         loading = false;
  //       });
  //       if (kDebugMode) {
  //         print('failed');
  //       }
  //     }
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print(e.toString());
  //     }
  //   }
  // }