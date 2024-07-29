import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget getTxt(
  String text, {
  double fontSize = 0,
  Color fontColor = Colors.black,
  int maxLine = 1,
  TextOverflow overflow = TextOverflow.ellipsis,
  TextDecoration decoration = TextDecoration.none,
  FontWeight fontWeight = FontWeight.normal,
  TextAlign textAlign = TextAlign.start,
  FontStyle fontStyle = FontStyle.normal,
  txtHeight,
  bool useMaxline = true,
}) {
  return Text(
    text,
    overflow: useMaxline ? overflow : null,
    style: TextStyle(
        decoration: decoration,
        fontSize: (fontSize == 0) ? 14.sp : fontSize,
        fontStyle: fontStyle,
        color: fontColor,
        height: txtHeight,
        fontWeight: fontWeight),
    maxLines: useMaxline ? maxLine : null,
    softWrap: true,
    textAlign: textAlign,
  );
}
