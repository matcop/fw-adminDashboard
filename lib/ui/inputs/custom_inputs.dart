import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomInput {

  static InputDecoration loginInputDecoration({
    required String hint,
    required String label,
    required IconData icon,
  }) {
    return InputDecoration(
        border: const OutlineInputBorder(
            borderSide: BorderSide(
          color: Color.fromARGB(128, 255, 255, 255),
        )),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
          color: Color.fromARGB(128, 255, 255, 255),
        )),
        hintText: hint,
        labelText: label,
        prefixIcon: Icon(
          icon,
          color: Colors.purple[900],
        ),
        labelStyle: const TextStyle(color: Colors.grey),
        hintStyle: const TextStyle(color: Colors.grey));
  }

  static InputDecoration searchInputDecoration({
    required String hint,
    required IconData icon,
  }) {
    return InputDecoration(
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        hintText: hint,
        prefixIcon: Icon(icon, color: Colors.grey),
        labelStyle: TextStyle(color: Colors.grey),
        hintStyle: TextStyle(color: Colors.grey));
  }


static InputDecoration FormInputDecoration({
    required String hint,
    required String label,
    required IconData icon,
  }) {
    return InputDecoration(
        border: const OutlineInputBorder(
            borderSide: BorderSide(
          color: Color.fromARGB(128, 255, 255, 255),
        )),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
          color: Color.fromARGB(128, 255, 255, 255),
        )),
        hintText: hint,
        labelText: label,
        prefixIcon: Icon(
          icon,
          color: Colors.purple[900],
        ),
        labelStyle: const TextStyle(color: Colors.grey),
        hintStyle: const TextStyle(color: Colors.grey));
  }


}
