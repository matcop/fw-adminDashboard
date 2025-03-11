// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class LoginFormProvider extends ChangeNotifier {

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();



  String email = '';
  String password = '';
  
  


  bool validateForm() {
    if(formKey.currentState!.validate()){
     
      return true;
      //aqui podriamos importar la importacion del authprovider pasandole email y pasword.
    }else{

      return false;
    }
    
  }
}
