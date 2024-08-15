

import 'package:flutter/material.dart';

class AppInputDecorationTheme{

  InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
        //hintText: hintText,
        filled: true,
        fillColor: Colors.transparent,
        contentPadding: const EdgeInsets.all(20),
        hintStyle: const TextStyle(
          color: Colors.black,
        ),
        //labelText: hintText,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Colors.black,
              width: 0.4,
            )),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Colors.black,
              width: 1,
            )));
}