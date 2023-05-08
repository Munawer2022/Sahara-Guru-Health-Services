// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class listbuildchoisechip extends StatelessWidget {
//   final onSelected, selected, child;
//   const listbuildchoisechip(
//       {super.key, 
//      required this.onSelected,required this.selected,required this.child});

//   @override
//   Widget build(BuildContext context) {
//     var theme = Theme.of(context);
//     int? _value = 1;
//     return SizedBox(
//       width: double.infinity,
//       height: 80,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: 10,
//         itemBuilder: (context, index) => Padding(
//           padding: EdgeInsets.symmetric(horizontal: 10),
//           child: ChoiceChip(
//             selectedColor: Colors.amber.shade50,
//             backgroundColor: Colors.transparent,
//             label: SizedBox(
//               height: 50,
//               width: 50,
//               child: child,
//               // Text.rich(
//               //   TextSpan(
//               //     children: [
//               //       TextSpan(text: 'Hello\n', style: theme.textTheme.subtitle2),
//               //       TextSpan(text: 'bold', style: theme.textTheme.subtitle2),
//               //     ],
//               //   ),
//               // ),
//             ),
//             selected: selected,
//             onSelected: onSelected,
//           ),
//         ),
//       ),
//     );
//   }
// }
