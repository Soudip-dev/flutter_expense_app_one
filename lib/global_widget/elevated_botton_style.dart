import 'package:flutter/material.dart';

class ElevatedBottonStyle {
  static ButtonStyle elevatedButton({
    Color? bgColor,
    Color? forgroundColor,
    BorderSide? side,
    double? radius,
    EdgeInsetsGeometry? padding,
  }) {
    return ElevatedButton.styleFrom(
      backgroundColor: bgColor,
      foregroundColor: forgroundColor,
      side: side,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius ?? 0),
      ),
      padding: padding,
    );
  }

}