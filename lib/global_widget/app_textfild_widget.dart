import 'package:flutter/material.dart';

class AppTextfildWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Function(String)? onChanged;
  
  final Function()? onTap;
  final String? Function(String?)? validator;
   bool  isPassword ;
   Widget ? suffixIcon;
   Widget ? prefixIcon;
   bool isReadOnly ;

  

   AppTextfildWidget({Key ?key,
    required this.hintText,
     required this.controller,
     required this.keyboardType,
     this.onChanged,
     this.onTap,
     this.validator,
    required this.isPassword,
     this.suffixIcon,
     this.prefixIcon
     ,this.isReadOnly = false
    }) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
              readOnly: isReadOnly,
              controller: controller,
              keyboardType: keyboardType,
              onChanged: onChanged,
              onTap: onTap,
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