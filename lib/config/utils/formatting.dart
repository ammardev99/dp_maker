import 'package:dp_maker/config/utils/my_colors.dart';
import 'package:flutter/material.dart';

Widget textHeading24(String txt, {Color? color, bool alignC = false}) {
  return Text(
    txt,
    textAlign: alignC ? TextAlign.center : TextAlign.start,
    style: TextStyle(
      fontFamily: 'SansitaSwashed',
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: color ?? MyColors.textDark,
    ),
  );
}

Widget heading14(String txt, {Color? color}) {
  return Text(
    txt,
    style: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: color ?? MyColors.textDark,
    ),
  );
}

Widget buttonLabel(String txt, {Color? color}) {
  return Text(
    txt,
    style: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: color ?? MyColors.foreground,
    ),
  );
}

Widget infoText(
  String txt, {
  Color? labelcolor = MyColors.textLight,
  bool? alignC,
}) {
  return Text(
    txt,
    textAlign: alignC == true ? TextAlign.center : null,
    style: TextStyle(fontSize: 14, color: labelcolor),
  );
}

Widget gapBox(double w, {double? h}) {
  return SizedBox(width: w, height: h ?? w);
}
