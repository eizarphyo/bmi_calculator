import 'package:flutter/material.dart';

// brand color
Color lightPrimaryColor = Colors.amberAccent.shade400;
Color darkPrimaryColor = Colors.amberAccent.shade400;
Color btnDisabled = Colors.amberAccent.shade200;

// Dark mode colors
Color darkBgColor = Colors.white24;
Color darkWhite70 = Colors.white70;
Color darkPrimartText = Colors.white;
Color darkSubText = Colors.white60;
Color darkSliderActive = Colors.white;
Color darkBtnBg = Colors.grey.shade400;

// Light mode colors
Color lightSliderActive = Colors.black12;
Color lightBtnBg = Colors.grey.shade200;

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
