import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 100),
      padding: EdgeInsets.symmetric(horizontal: 20),
      // color: Colors.red,
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 370),
          child: Form(
              child: Column(
            children: [
              TextFormField(
                // validator: (value),
                style: TextStyle(color: Colors.white),
                decoration: buildInputDecoration(
                    hint: 'Ingrese su correo',
                    label: 'email',
                    icon: Icons.email_outlined),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: true,
                // validator: (value),
                style: TextStyle(color: Colors.white),
                decoration: buildInputDecoration(
                    hint: '*****',
                    label: 'Password',
                    icon: Icons.lock_outline_rounded),
              ),
              SizedBox(
                height: 20,
              ),
              LinkText(
                  text: 'Nueva cuenta',
                  onPressed: () {
                    //TODO: IR AL REGISTRO
                  })
            ],
          )),
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration({
    required String hint,
    required String label,
    required IconData icon,
  }) {
    return InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Color.fromARGB(128, 255, 255, 255),
        )),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Color.fromARGB(128, 255, 255, 255),
        )),
        hintText: hint,
        labelText: label,
        prefixIcon: Icon(
          icon,
          color: Colors.purple[900],
        ),
        labelStyle: TextStyle(color: Colors.grey),
        hintStyle: TextStyle(color: Colors.grey));
  }
}
