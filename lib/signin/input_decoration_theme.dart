import 'package:flutter/material.dart';

class InputDecorationThemeSignin extends InputDecoration {
  @override
  final String hintText;

  const InputDecorationThemeSignin({required this.hintText});

  InputDecoration inputDecoration() {
    return InputDecoration(
        hintText: hintText,
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
              width: 0.4,
            )));
  }
}



