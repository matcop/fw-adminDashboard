import 'dart:convert';

import 'package:admin_dashboard/api/CafeApi.dart';
import 'package:admin_dashboard/models/http/users_response.dart';
import 'package:admin_dashboard/models/http/usuario.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  List<Usuario> users = [];
  bool isLoading = true;
  bool ascending=true;

  UserProvider() {
    this.getPaginatedUser();
  }

//Funcion para obtener los usuarios
  getPaginatedUser() async {
    final resp = await CafeApi.httpGet('/usuarios?limite=10&desde=0');
    final usersResponse = UsersResponse.fromJson(resp);

    this.users = [...usersResponse.usuarios];

    isLoading = false;
    print(resp);

    notifyListeners();
  }

  void sort<T>(Comparable<T> Function(Usuario user) getfield) {
    users.sort((a, b) {
      final aValue = getfield(a);
      final bValue = getfield(b);

      return ascending? Comparable.compare(aValue, bValue):Comparable.compare(bValue, aValue);
    });

    ascending = !ascending;
    notifyListeners();
  }
}
