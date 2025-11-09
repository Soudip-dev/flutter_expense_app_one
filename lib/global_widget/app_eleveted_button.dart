import 'package:expense_monitor_app/utils/app_colors.dart';
import 'package:expense_monitor_app/utils/app_fonts.dart';
import 'package:flutter/material.dart';

class AppElevetedButton extends StatelessWidget {
  final String text;
  final VoidCallback ? onPressed;
  const AppElevetedButton({super.key, required this.text,  this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: const Size(double.infinity, 50),
      ),
      child: Text(
        text,
        style: AppFonts.appNormalFont25(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
