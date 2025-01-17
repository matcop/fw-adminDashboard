import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class RegisterFormProvider extends ChangeNotifier{
GlobalKey<FormState> formkey = new GlobalKey<FormState>();

  String email = '';
  String password = '';
  String name='';

  validateForm(){
    if (formkey.currentState!.validate()) {
      print('registro valido');
      print('$email  $password  $name');
      return true;
    } else {
      print('el formulario NO VALIDO');
      return false;
    }

  }


}