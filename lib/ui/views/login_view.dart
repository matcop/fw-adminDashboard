import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
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
                decoration:CustomInput.loginInputDecoration(
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
                decoration: CustomInput.loginInputDecoration(
                    hint: '*****',
                    label: 'Password',
                    icon: Icons.lock_outline_rounded),
              ),
              SizedBox(
                height: 20,
              ),
              CustomOutlinedButton(
                onPressed: () {},
                text: 'Ingresar aqui',
                // color: Colors.red,
                // isFilled: true,
              ),
              SizedBox(
                height: 20,
              ),
              LinkText(
                  text: 'Nueva cuenta',
                  onPressed: () {
                    // print("ir al registro");
                    Navigator.pushNamed(context, Flurorouter.registerRoute);
                    //TODO: IR AL REGISTRO
                  })
            ],
          )),
        ),
      ),
    );
  }

  
}
