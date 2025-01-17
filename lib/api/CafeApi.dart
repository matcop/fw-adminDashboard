import 'package:admin_dashboard/services/local_storage.dart';
import 'package:dio/dio.dart';

class CafeApi {
  static Dio _dio = new Dio();

  static void configureDio() {
    //creamos la base url
    _dio.options.baseUrl = 'http://localhost:8080/api';
    // _dio.options.baseUrl = 'http://192.168.137.232:8080/api';


    //configure headers
    _dio.options.headers = {
      'x-token': LocalStorage.prefs.getString('token') ?? '',
    };
  }

//configuraciones para peticiones GET ejem /usuario, /iconos
  static httpGet(String path) async {
    try {
      final resp = await _dio.get(path);

      return resp.data;
    } catch (e) {
      print(e);
      throw ('ERROR EN EL GET');
    }
  }

  //configuraciones para peticiones POST ejem /CREAR, /iconos
  static  post(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);

    try {
      final resp = await _dio.post(path, data: formData);

      print(resp.data);
      return resp.data;

    } catch (e) {
      // print(resp);
      print(e);
      throw ('ERROR EN EL post ');
    }
  }




static  put(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);
print(formData);
    try {
      final resp = await _dio.put(path, data: formData);

      print(resp.data);
      return resp.data;

    } catch (e) {
      // print(resp);
      print(e);
      throw ('ERROR ACTUALIZAR ');
    }
  }


  static  delete(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);

    try {
      final resp = await _dio.delete(path, data: formData);

      print(resp.data);
      return resp.data;

    } catch (e) {
      
      print(e);
      throw ('ERROR borrar delete ');
    }
  }
  


}
