import 'package:flutter/material.dart';

class NotificationsService {
  static GlobalKey<ScaffoldMessengerState> messengerKey =
      new GlobalKey<ScaffoldMessengerState>();

  static showSnackbarError1(String messge) {
    final snackBar = new SnackBar(
        backgroundColor: Colors.red.withOpacity(0.9),
        content: Text(
          messge,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ));
    messengerKey.currentState!.showSnackBar(snackBar);
  }

  static showSnackbarError(String message) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating, // Hace que el SnackBar flote
      backgroundColor: Colors.redAccent.withOpacity(0.9),
      shape: RoundedRectangleBorder(
        // Borde redondeado
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(20), // Espaciado alrededor del SnackBar
      content: Row(
        children: [
          const Icon(
            Icons.error_outline, // Icono para representar el error
            color: Colors.white,
            size: 30,
          ),
          const SizedBox(width: 16), // Espacio entre el icono y el texto
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      duration:
          Duration(seconds: 5), // Controla cuánto tiempo aparece el SnackBar
      action: SnackBarAction(
        // Botón de acción opcional
        label: 'Cerrar',
        textColor: Colors.white,
        onPressed: () {
          // Acción opcional al presionar el botón
        },
      ),
    );
    messengerKey.currentState!.showSnackBar(snackBar);
  }

  static showSnackbar(String messge) {
    final snackBar = new SnackBar(
        backgroundColor: Colors.blueGrey.withValues(alpha: 0.3),
        content: Text(
          messge,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ));
    messengerKey.currentState!.showSnackBar(snackBar);
  }

  static showBusyIndicator(BuildContext context) {
    final AlertDialog dialog = AlertDialog(
      content: Container(
        width: 50,
        height: 50,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );

    showDialog(context: context, builder: (_) => dialog);
  }
}
