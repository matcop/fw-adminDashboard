import 'dart:typed_data';

import 'package:admin_dashboard/api/CafeApi.dart';
import 'package:admin_dashboard/models/http/usuario.dart';
import 'package:flutter/material.dart';

class UserFormProvider extends ChangeNotifier {
  Usuario? user;

  late GlobalKey<FormState> formKey;

  bool _validForm() {
    return formKey.currentState!.validate();
  }

  // void updateListener() {
  //   notifyListeners();
  // }

  copyUserWith({
    String? rol,
    bool? estado,
    bool? google,
    String? nombre,
    String? correo,
    String? uid,
    String? img,
  }) {
    user = new Usuario(
      rol: rol ?? this.user!.rol,
      estado: estado ?? this.user!.estado,
      google: google ?? this.user!.google,
      nombre: nombre ?? this.user!.nombre,
      correo: correo ?? this.user!.correo,
      uid: uid ?? this.user!.uid,
      img: img ?? this.user!.img,
    );
    notifyListeners();
  }

  Future updateUser() async {
    if (!this._validForm()) return;

    final data = {
      'nombre': user!.nombre,
      'correo': user!.correo,
    };
    try {
      final resp = await CafeApi.put('/usuarios/${user!.uid}', data);
     
      return true;
    } catch (e) {
     
      return false;
    }
  }

  //se insertara un nuevo metodo que ayude cuando haga clic en el boton de la imagen.

  Future<Usuario> uploadImage(String path, Uint8List bytes) async {
    try {
      
      final resp = await CafeApi.uploadFile(path, bytes);
      user = Usuario.fromJson(resp);
      notifyListeners();
      return user!;
    } catch (e) {
     
      throw 'error user_form_provider uploadImage';
    }
  }
}
