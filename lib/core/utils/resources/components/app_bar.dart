import 'package:flutter/material.dart';
import 'package:sahara_guru_health_services/core/utils/constants/colors.dart';

import '../../constants/padding.dart';
import 'search_text_field_component.dart';

class MyAppBarWidget extends StatelessWidget {
  final title;
  final bool arrow_back;
  final actions;
  final bottomText;

  final controller;
  final readOnly;
  final ontap;
  final suffixIcon;
  final delegate;

  const MyAppBarWidget(
      {super.key,
      this.title,
      required this.arrow_back,
      this.actions,
      this.bottomText,
      this.controller,
      this.readOnly,
      this.ontap,
      this.suffixIcon,
      this.delegate});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    return CustomScrollView(slivers: [
      SliverAppBar(
        snap: true,
        pinned: true,
        floating: true,

        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(18.0),
            bottomRight: Radius.circular(18.0),
          ),
        ),
        title: text(context, title),
        backgroundColor: AppColor.textButtonColor,
        expandedHeight: mediaQuery.height * 0.2,
        flexibleSpace: FlexibleSpaceBar(
          background: Padding(
            padding: card_padding,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: mediaQuery.height * 0.11,
                  ),
                  SearchTextFieldComponent(
                    suffixIcon: suffixIcon,
                    readOnly: readOnly,
                    ontap: ontap,
                    text: bottomText,
                    controller: controller,
                  ),
                ],
              ),
            ),
          ),
        ),
        centerTitle: false,
        elevation: 0,
        // backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,

        leading: arrow_back ? arrow(context) : null,
        actions: actions,
      ),
      SliverList(delegate: delegate)
    ]);
  }
}

BorderRadius borderRadius = BorderRadius.circular(22.0);
