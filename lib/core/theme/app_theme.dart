import 'package:flutter/material.dart';
import 'package:rickandmorty/core/theme/app_color.dart';

class AppTheme {
  static BoxDecoration get boxDecoration => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    border: Border.all(color: blackColor),
    boxShadow: [
      BoxShadow(
        color: blackColor,
        offset: const Offset(2.5, 2.5),
      ),
    ],
  );
}
