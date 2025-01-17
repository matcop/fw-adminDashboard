import 'package:admin_dashboard/api/CafeApi.dart';
import 'package:admin_dashboard/models/http/auth_response.dart';
import 'package:admin_dashboard/models/http/usuario.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:admin_dashboard/services/notifications_service.dart';
import 'package:flutter/material.dart';

enum AuthStatus { checking, authenticated, noAuthenticated }

class AuthProvider extends ChangeNotifier {
  String? _token;
//la primera vez que ingrese sera de tipo verificando
  AuthStatus authStatus =
      AuthStatus.checking; // EN ESTE PUNTO SE PUEDE MANDAR A UN LOADING
  Usuario? user;

  AuthProvider() {
    this.isAuthenticated();
  }

  login(String email, String password) {
    final data = {'correo': email, 'password': password};

    CafeApi.post('/auth/login', data).then((json) {
      print(json);

      // final authResponse = AuthResponse.fromRawJson(json);
      final authResponse = AuthResponse.fromJson(json);

      this.user = authResponse.usuario;

      authStatus = AuthStatus.authenticated;
      LocalStorage.prefs.setString('token', authResponse.token);
      NavigationService.replaceTo(Flurorouter.dashboardRoute);
      notifyListeners(); // para que se redibuje en los lugares donde tiene que redibujar.
      CafeApi.configureDio();
    }).catchError((e) {
      print('Error capturado: $e');
      if (e is TypeError) {
        NotificationsService.showSnackbarError(
            'Error de tipo inesperado: ${e.toString()}');
      } else if (e is Map) {
        // Si el error es un mapa (por ejemplo, un JSON de error de la API).
        NotificationsService.showSnackbarError(
            e['message'] ?? 'Error desconocido');
      } else {
        NotificationsService.showSnackbarError('Error desconocido: $e');
      }
      // TODO:MOSTRAR ALGUNA NOTIFICACION
    });

    // //peticion HTTP
    // _token =
    //     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c';

    // LocalStorage.prefs.setString('token', this._token!);
    // print('alamacenar JWT: $_token');

    // //navegar al dashboard
    // authStatus = AuthStatus.authenticated;
    // notifyListeners(); // para que se redibuje en los lugares donde tiene que redibujar.

    // // isAuthenticated();

    // NavigationService.replaceTo(Flurorouter.dashboardRoute);
  }

  register(String email, String password, String name) {


    //TODO: VALIDACION POR SEGIP
    //TODO: VALIDACION POR PERSONAL O SERV. ESCALAFON
    //POR FALSO RETURN FALSE MUESTRE EL MENSAJE
    // 


    final data = {'nombre': name, 'correo': email, 'password': password};

    CafeApi.post('/usuarios', data).then((json) {
      print(json);

      //final authResponse = AuthResponse.fromRawJson(json);
      final authResponse = AuthResponse.fromJson(json);

      this.user = authResponse.usuario;

      authStatus = AuthStatus.authenticated;
      LocalStorage.prefs.setString('token', authResponse.token);
      NavigationService.replaceTo(Flurorouter.dashboardRoute);
      CafeApi.configureDio();
      notifyListeners(); // para que se redibuje en los lugares donde tiene que redibujar.

      //print(authResponse);
    }).catchError((e) {
      print('error en $e');
      NotificationsService.showSnackbarError(e + 'hay un error en el registro');
      // TODO:MOSTRAR ALGUNA NOTIFICACION
    });
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');

    // ignore: unnecessary_null_comparison
    if (token == null) {
      authStatus = AuthStatus.noAuthenticated;
      notifyListeners();
      return false;
    }

    try {
      final res = await CafeApi.httpGet('/auth');
      final authResponse=AuthResponse.fromJson(res);
      LocalStorage.prefs.setString('token', authResponse.token);

      this.user=authResponse.usuario;
      authStatus=AuthStatus.authenticated;
      notifyListeners();
      return true;

    } catch (e) {
      print(e);
      authStatus = AuthStatus.noAuthenticated;
      notifyListeners();
      return false;
    }

    //TODO: quitar todo lo comentado  IR AL BACKEN Y VER SI EL TOKEN ES VALIDO
    // await Future.delayed(Duration(milliseconds: 3000));

    // authStatus = AuthStatus.authenticated;
    // notifyListeners();
    // return true;
  }

logout(){
  LocalStorage.prefs.remove('token');
  authStatus=AuthStatus.noAuthenticated;
  notifyListeners();
}

}
