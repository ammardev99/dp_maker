import 'package:dp_maker/config/config_io.dart';
import 'package:dp_maker/widgets/widget_io.dart';
import 'package:flutter/material.dart';

class ExitConfirmationDialog {
  static Future<bool> show(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          barrierDismissible: false,
          builder:
              (context) => AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                title: textHeading24('Exit App', color: MyColors.primary),
                content: buttonLabel(
                  'Do you really want to exit the app?',
                  color: MyColors.textDark,
                ),
                actionsPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                actions: <Widget>[
                  CustomButton(
                    label: "No",
                    onPressed: () => Navigator.of(context).pop(false),
                    widthSize: 80,
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: const Text(
                      'Yes',
                      style: TextStyle(color: MyColors.textDark),
                    ),
                  ),
                ],
              ),
        ) ??
        false;
  }
}
