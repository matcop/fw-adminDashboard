// import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:admin_dashboard/models/http/category.dart';

class CategoriesResponse {
    int total;
    List<Categoria> categorias;

    CategoriesResponse({
        required this.total,
        required this.categorias,
    });

    factory CategoriesResponse.fromRawJson(String str) => CategoriesResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CategoriesResponse.fromJson(Map<String, dynamic> json) => CategoriesResponse(
        total: json["total"],
        categorias: List<Categoria>.from(json["categorias"].map((x) => Categoria.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "categorias": List<dynamic>.from(categorias.map((x) => x.toJson())),
    };
}

