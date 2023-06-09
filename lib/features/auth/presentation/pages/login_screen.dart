import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

import '../../../../core/utils/constants/padding.dart';
import '../../../../core/utils/resources/components/app_bar.dart';
import '../../../../core/utils/resources/components/button.dart';
import '../../../../core/utils/resources/components/type_text_field_component.dart';
import '../provider/login_provider.dart';

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
    final loginController = Provider.of<LoginProvider>(context);

    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return WillPopScope(
      onWillPop: () async {
        await SystemNavigator.pop();
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                // showAlert(),
                Padding(
                  padding: screen_padding.copyWith(right: 30, left: 30),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Image.asset(doctor),
                      SizedBox(
                        height: mediaQuery.height * 0.2,
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
                            Consumer<LoginProvider>(
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
                                    border: OutlineInputBorder(
                                        borderRadius: borderRadius),
                                    // border: const OutlineInputBorder(),
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
                      // TextButton(
                      //     onPressed: () {},
                      //     child: const Text(
                      //       'Forgot your password?',
                      //     )),
                      // SizedBox(
                      //   height: mediaQuery.height * 0.01,
                      // ),
                      Button(
                          loading: loginController.loading,
                          title: 'Continue',
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              loginController.loginPostApiResponse(context, {
                                'email': emailController.text,
                                'password': passwordController.text
                              });
                            }
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget showAlert() {
    final loginController = Provider.of<LoginProvider>(context);
    if (loginController.errorShow != null) {
      return Container(
        color: Colors.red.shade400,
        width: double.infinity,
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.error_outline,
              ),
            ),
            Expanded(
              child: Text(
                loginController.errorShow.toString(),
                // style: TextStyle(color: Colors.black87),
                maxLines: 3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  setState(() {
                    loginController.errorShow = null;
                  });
                },
              ),
            )
          ],
        ),
      );
    }
    return const SizedBox(
      height: 0,
    );
  }
}
