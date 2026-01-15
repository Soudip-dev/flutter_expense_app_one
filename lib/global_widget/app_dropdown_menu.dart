import 'package:flutter/material.dart';

class AppDropdownMenu {
  static buildDropDownMenu({
    required String hint,
    required List<DropdownMenuItem<Object>>? items,
    required Function(Object?)? onChanged,
    Object? value,
  }) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        hintText: hint,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      value: value,
      items: items,
      onChanged: onChanged,
    );
  }

}