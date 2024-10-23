import 'package:flutter/material.dart';

class CustomInput{


  static  InputDecoration loginInputDecoration({
    required String hint,
    required String label,
    required IconData icon,
  }) {
    return InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Color.fromARGB(128, 255, 255, 255),
        )),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Color.fromARGB(128, 255, 255, 255),
        )),
        hintText: hint,
        labelText: label,
        prefixIcon: Icon(
          icon,
          color: Colors.purple[900],
        ),
        labelStyle: TextStyle(color: Colors.grey),
        hintStyle: TextStyle(color: Colors.grey));
  }

}