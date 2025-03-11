import 'dart:typed_data';

import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/notifications_service.dart';
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
    }on DioException catch (e) {
      NotificationsService.showSnackbarError(e.response?.data['errors'][0]['msg'] );

      
      // print(e.response?.data['errors'][0]['msg']);
      
      throw ('ERROR EN EL GET');
    }
  }

  //configuraciones para peticiones POST ejem /CREAR, /iconos
  static  post(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);

    try {
      final resp = await _dio.post(path, data: formData);

    
      return resp.data;

    }on DioException catch (e) {
     
     
      throw ('ERROR EN EL post ${e}');
    }
  }


static  put(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);

    try {
      final resp = await _dio.put(path, data: formData);

     
      return resp.data;

    } on DioException catch (e) {
    
     
      throw ('ERROR ACTUALIZAR $e');
    }
  }


  static  delete(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);

    try {
      final resp = await _dio.delete(path, data: formData);

     
      return resp.data;

    }on DioException catch (e) {
      
   
      throw ('ERROR borrar delete ');
    }
  }
  
static  uploadFile(String path, Uint8List bytes) async {

    final formData = FormData.fromMap({
      'archivo':MultipartFile.fromBytes(bytes)
    });


    try {
      final resp = await _dio.put(path, data: formData);

     
      return resp.data;

    } on DioException catch (e) {
      
      throw ('ERROR SUBIR EL ARCHIVO $e');
    }
  }


}
