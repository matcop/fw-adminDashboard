// import 'dart:convert';

import 'dart:convert';
import 'dart:io';

import 'package:admin_dashboard/api/CafeApi.dart';
import 'package:admin_dashboard/models/http/categories_response.dart';
import 'package:admin_dashboard/models/http/category.dart';
import 'package:flutter/material.dart';

class CategoriesProvider extends ChangeNotifier {
  List<Categoria> categorias = [];
  
  //Obtener las categorias
 getCategories() async {
    final resp = await CafeApi.httpGet('/categorias');
    // print(resp);
    final categoriesResponse = CategoriesResponse.fromJson(resp);

    this.categorias = [...categoriesResponse.categorias];
    notifyListeners();
  }

  //crear nueva categoria
  Future newCategory(String name)async {
    final data = {'nombre': name};

    try {
      final json =await CafeApi.post('/categorias', data);
      final newCategory = Categoria.fromJson(json);
      categorias.add(newCategory);

      notifyListeners();
    } catch (e) {
      if (e is HttpException) {
        final errorResponse = jsonDecode(e.message);
        throw errorResponse['msg'] ?? '1.- Error creando la categoria';
      } else {
        throw '2.- Error creando la categoria';
      }
    }
  }

  updateCategory(String id, String name)  {
    final data = {'nombre': name};

    try {
       CafeApi.put('/categorias/$id', data);

      this.categorias = this.categorias.map((category) {
        if (category.id != id) return category;
        category.nombre = name;
        return category;
      }).toList();

      notifyListeners();
    } catch (e) {
      throw 'Error al crear categoria';
    }
  }

  deleteCategory(String id) async {
    // final data = {'nombre': name};

    try {
      final json = await CafeApi.delete('/categorias/${id}', {});

      this.categorias.removeWhere((categoria) => categoria.id == id);

      notifyListeners();
    } catch (e) {
      print(e);
      print('error al actualizar categoria');
    }
  }
}
