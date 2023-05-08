import 'package:flutter/material.dart';
import 'package:sahara_guru_health_services/core/utils/constants/fonts.dart';

class MyAppBarWidget extends StatelessWidget implements PreferredSize {
  final title;
  final bool arrow_back;
  final actions;
  const MyAppBarWidget(
      {super.key, this.title, required this.arrow_back, this.actions});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return AppBar(
      centerTitle: true,
      elevation: 0,
      // backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      title: Text(title,
          style:
              theme.textTheme.subtitle1?.copyWith(fontWeight: FontWeight.bold)),
      leading: arrow_back
          ? IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new_rounded))
          : null,
      actions: actions,
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
