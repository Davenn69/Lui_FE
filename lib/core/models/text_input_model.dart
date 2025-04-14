import 'package:flutter/material.dart';

class TextInputModel {
    final controller = TextEditingController();
    String? Function(String)? validator;

    String get text => controller.text.trim();
    String get untrimmedText => controller.text;
    set text(String value) => controller.text = value;

    TextInputModel({this.validator});
}
