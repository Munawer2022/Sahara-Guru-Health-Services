import 'package:flutter/material.dart';

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
            //backgroundColor: MaterialStateProperty.all(Colors.grey.shade300)
            backgroundColor: loading
                ? MaterialStateProperty.all(const Color.fromARGB(255, 3, 43, 104))
                : MaterialStateProperty.all(Colors.blue.shade800)
            // elevation: MaterialStateProperty.all(2)
            ),
        onPressed: loading ? null : onTap,
        child: Center(
            child: loading
                ? const CircularProgressIndicator(
                    strokeWidth: 3,
                    color: Colors.white,
                  )
                : Text(
                    title,
                    style: const TextStyle(color: Colors.white),
                  )),
      ),
    );
  }
}
