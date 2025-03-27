import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:lui_fe/core/themes/theme.dart';

class ShowDialog {
  static void showErrorDialog({
    required BuildContext context,
    required String title,
    required String description,
    VoidCallback? onOkPressed,
  }) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      dialogBackgroundColor: Colors.white,
      title: "Email already registered",
      titleTextStyle: TextStyle(
        fontSize: 14,
        color: AppColors.accentColor,
        fontWeight: FontWeight.w700,
      ),
      desc: description,
      btnOkColor: AppColors.red,
      btnOkOnPress: onOkPressed ?? () {},
    ).show();
  }
}