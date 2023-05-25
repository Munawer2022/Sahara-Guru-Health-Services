import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

class Utils {
  void snackBarMessage(String message, BuildContext context) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Success!',
        message: message.toString(),
        contentType: ContentType.success,
        // inMaterialBanner: true,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);

    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     backgroundColor: Colors.green,
    //     content: Text(message.toString()),
    //     action: SnackBarAction(
    //       textColor: Colors.white,
    //       label: 'OK',
    //       onPressed: () {},
    //       // onPressed: scaffold.hideCurrentSnackBar
    //     ),
    //   ),
    // );
  }

  void errorSnackBarMessage(String message, BuildContext context) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Error!',
        message: message.toString(),
        contentType: ContentType.failure,
        // inMaterialBanner: true,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);

    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     backgroundColor: Colors.red,
    //     content: Text(message.toString()),
    //     action: SnackBarAction(
    //       textColor: Colors.white,
    //       label: 'OK',
    //       onPressed: () {},
    //       // onPressed: scaffold.hideCurrentSnackBar
    //     ),
    //   ),
    // );
  }
}
  // final materialBanner = MaterialBanner(
        //   /// need to set following properties for best effect of awesome_snackbar_content
        //   elevation: 0,
        //   backgroundColor: Colors.transparent,
        //   forceActionsBelow: true,
        //   content: AwesomeSnackbarContent(
        //     title: 'Error!!',
        //     message: error.toString(),

        //     /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
        //     contentType: ContentType.failure,
        //     // to configure for material banner
        //     inMaterialBanner: true,
        //   ),
        //   actions: const [SizedBox.shrink()],
        // );

        // ScaffoldMessenger.of(context)
        //   ..hideCurrentMaterialBanner()
        //   ..showMaterialBanner(materialBanner);