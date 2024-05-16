import 'package:flutter/material.dart';
import 'package:zanzeeapp/widgets/custom_textbox.dart';
import 'package:zanzeeapp/theme/color.dart';

buildSearch(String hintText, prefix, suffix) {
  return Padding(
    padding: const EdgeInsets.only(left: 15, right: 15),
    child: CustomTextBox(
      hint: hintText,
      prefix: Icon(prefix, color: darker),
      suffix: Icon(
        suffix,
        color: primary,
      ),
    ),
  );
}
