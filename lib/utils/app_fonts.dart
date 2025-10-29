import 'package:expense_monitor_app/utils/app_colors.dart';
import 'package:flutter/widgets.dart';

class AppFonts {
  static  TextStyle appBoldFont25({
     Color color = AppColors.backgroundColor,
     double fontSize = 25,
     FontWeight fontWeight = FontWeight.bold,

    
    }) => TextStyle(fontSize: fontSize,fontWeight: fontWeight,color: color);

      static  TextStyle appNormalFont25({
     Color color = AppColors.backgroundColor,
     double fontSize = 25,
     FontWeight fontWeight = FontWeight.normal,

    
    }) => TextStyle(fontSize: fontSize,fontWeight: fontWeight,color: color);

}