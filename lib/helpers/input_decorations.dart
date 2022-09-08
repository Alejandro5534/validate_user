import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration validateInputDecoration(
      {required String hintText,
      required String labelText,
      IconData? prefixIcon}) {
    return InputDecoration(
        counterText: '',
        // focusColor: Color(0xfff9665c),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xff00ffffff)),
        ),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xff00ffffff), width: 2)),
        hintText: hintText,
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.black54),
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: Colors.black54,
              )
            : null);
  }
}
