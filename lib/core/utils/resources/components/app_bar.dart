import 'package:flutter/material.dart';
import 'package:sahara_guru_health_services/core/utils/constants/fonts.dart';
import 'package:sahara_guru_health_services/core/utils/constants/padding.dart';
import 'package:sahara_guru_health_services/core/utils/resources/components/search_text_field_component.dart';

import '../../../../config/routes/routes_names.dart';

class MyAppBarWidget extends StatelessWidget implements PreferredSize {
  final title;
  final bool arrow_back;
  final actions;
  final bottomText;
  final bottom;
  final controller;
  final readOnly;
  final ontap;

  const MyAppBarWidget({
    super.key,
    this.title,
    required this.arrow_back,
    this.actions,
    this.bottomText,
    this.bottom,
    this.controller,
    this.readOnly,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return CustomScrollView(slivers: [
      SliverAppBar(
        snap: true,
        pinned: false,
        floating: true,

        // shape: const RoundedRectangleBorder(
        //   borderRadius: BorderRadius.only(
        //     bottomLeft: Radius.circular(18.0),
        //     bottomRight: Radius.circular(18.0),
        //   ),
        // ),

        backgroundColor: Colors.blue.shade800,

        bottom: bottom
            ? PreferredSize(
                preferredSize: const Size.fromHeight(56),
                child: Padding(
                  padding: card_padding,
                  child: SearchTextFieldComponent(
                    readOnly: readOnly,
                    ontap: ontap,
                    text: bottomText,
                    controller: controller,
                  ),
                ),
              )
            : null,
        centerTitle: false,
        elevation: 0,
        // backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Text(title,
            style: theme.textTheme.subtitle1?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 18)),
        leading: arrow_back
            ? IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                ))
            : null,
        actions: actions,
      ),
    ]);
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>
      Size.fromHeight(bottom ? 120 : AppBar().preferredSize.height);
}

BorderRadius borderRadius = BorderRadius.circular(22.0);
