import 'package:flutter/material.dart';

class SlideHorizontalList extends StatelessWidget {
  final text;
  final ontap;
  const SlideHorizontalList({super.key, this.text, this.ontap});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return SizedBox(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: InkWell(
            onTap: ontap,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(50)),
                ),
                SizedBox(
                  height: mediaQuery.height * 0.01,
                ),
                Text(text, style: theme.textTheme.subtitle2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
