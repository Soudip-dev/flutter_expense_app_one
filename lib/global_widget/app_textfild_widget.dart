import 'package:flutter/material.dart';

class AppTextfildWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Function(String)? onChanged;
  

   AppTextfildWidget({Key ?key,
    required this.hintText,
     required this.controller,
     required this.keyboardType,
     this.onChanged
    }) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
              controller: controller,
              keyboardType: keyboardType,
              onChanged: onChanged,
              autocorrect: false,
              enableSuggestions: false,
              decoration: InputDecoration(
                hintText: hintText,
                prefixIcon: Icon(Icons.email),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10))
              )
            );
  }
}