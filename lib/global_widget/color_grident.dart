import 'package:expense_monitor_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ColorGrident {
  static const primaryGradient = LinearGradient(
    colors: [
      Color(0xFF2196F3), // A lighter shade of green
      AppColors.primaryColor, // A shade of green
    ],
    begin: Alignment.center,
    end: Alignment.topRight,
  );


}