import 'package:flutter/material.dart';

class MyColors {
  static const Color primary = Color(0xFFBA97F3);
  static const Color primaryDark = Color(0xFF9F7DD4);
  static const Color secondary = Color(0xFF829EF6);
  static const Color accent = Color(0xFFDCCBF9);
  // Extended
  static const Color background = Color(0xFFF7F7FF);
  static const Color foreground = Color(0xFFFFFFFF);
  static const Color border = Color(0xFFE7E7E7);
  // Text Color
  static const Color textDark = Color(0xFF525252);
  static const Color textLight = Color(0xFFB4B4B4);
  // Gradient Color
  static const Gradient gradientTD = LinearGradient(
    colors: [secondary, primary],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
