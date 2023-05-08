import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:sahara_guru_health_services/core/utils/resources/components/app_bar.dart';
import 'package:sahara_guru_health_services/core/utils/constants/padding.dart';

import '../../../../core/utils/resources/components/button.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('otp');
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: screen_padding,
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
              Text("Code has been send", style: theme.textTheme.headline2),
              SizedBox(
                height: mediaQuery.height * 0.050,
              ),
              OtpTextField(
                textStyle: theme.textTheme.subtitle2,
                numberOfFields: 6,
                borderColor: Colors.grey,
                enabledBorderColor: Colors.grey.shade400,
                borderWidth: 3,
                showFieldAsBox: true,
                focusedBorderColor: Colors.blue.shade800,

                onCodeChanged: (String code) {},
                onSubmit: (String verificationCode) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Verification Code",
                              style: theme.textTheme.subtitle2),
                          content: Text('Code entered is $verificationCode',
                              style: theme.textTheme.subtitle2),
                        );
                      });
                }, // end onSubmit
              ),
              SizedBox(
                height: mediaQuery.height * 0.05,
              ),
              Button(title: 'Verify', onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
