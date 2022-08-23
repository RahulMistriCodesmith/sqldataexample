import 'package:flutter/material.dart';

class MyStyle {

  static InputDecoration inputDec1 = InputDecoration(
    contentPadding: EdgeInsets.all(10),
    // hintStyle: MyTextStyle.poppinsStyle15,
    filled: true,
    fillColor: Colors.transparent,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.blue.withOpacity(0.5), width: 1),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.blue.withOpacity(0.5), width: 1),

    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.blue.withOpacity(0.5), width: 1),
    ),
  );

}