import 'package:flutter/material.dart';
import 'package:sahara_guru_health_services/core/utils/resources/components/app_bar.dart';

class Button extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool loading;
  const Button(
      {Key? key,
      required this.title,
      required this.onTap,
      this.loading = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            )),
            backgroundColor: loading
                ? MaterialStateProperty.all(
                    const Color.fromARGB(255, 3, 43, 104))
                : MaterialStateProperty.all(Colors.blue.shade800)
            // elevation: MaterialStateProperty.all(2)
            ),
        onPressed: loading ? null : onTap,
        child: Center(
            child: loading
                ? Center(
                    child: Text('Loading...',
                        style: theme.textTheme.subtitle2?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                        )))
                // const CircularProgressIndicator(
                //     strokeWidth: 3,
                //     color: Colors.white,
                //   )
                : Text(title,
                    style: theme.textTheme.subtitle2?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ))),
      ),
    );
  }
}
