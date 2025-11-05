import 'package:flutter/material.dart';

class AppTextfildWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
   bool  isPassword ;
   Widget ? suffixIcon;
   Widget ? prefixIcon;

  

   AppTextfildWidget({Key ?key,
    required this.hintText,
     required this.controller,
     required this.keyboardType,
     this.onChanged,
     this.validator,
    required this.isPassword,
     this.suffixIcon,
     this.prefixIcon
    }) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
              controller: controller,
              keyboardType: keyboardType,
              onChanged: onChanged,
              autocorrect: false,
              enableSuggestions: false,
              obscureText: isPassword,
              validator: validator,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                hintText: hintText,
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10))
              )
            );
  }
}