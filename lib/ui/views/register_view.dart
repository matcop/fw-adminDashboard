import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/register_form_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:email_validator/email_validator.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterFormProvider(),
      child: Builder(builder: (context) {
        final registerFormProvider =
            Provider.of<RegisterFormProvider>(context, listen: false);
        return Container(
          margin: const EdgeInsets.only(top: 50),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          // color: Colors.red,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 370),
              child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: registerFormProvider.formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        onChanged: (value) => registerFormProvider.name = value,
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return 'El Nombre es obligatorio';

                          return null;
                        },
                        style: const TextStyle(color: Colors.white),
                        decoration: CustomInput.loginInputDecoration(
                            hint: 'Ingrese su nombre',
                            label: 'Nombre',
                            icon: Icons.account_circle_rounded),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        onChanged: (value) =>
                            registerFormProvider.email = value,
                        validator: (value) {
                          if (!EmailValidator.validate(value ?? ''))
                            return 'email no valido';
                          return null;
                        },
                        style: const TextStyle(color: Colors.white),
                        decoration: CustomInput.loginInputDecoration(
                            hint: 'Ingrese su correo',
                            label: 'email',
                            icon: Icons.email_outlined),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        onChanged: (value) =>
                            registerFormProvider.password = value,

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'ingrese un password';
                          }
                          if (value.length < 6) {
                            return 'el password debe ser minimo 6 caracteres';
                          }
                          return null; //valido
                        },
                        obscureText: true,
                        // validator: (value),
                        style: const TextStyle(color: Colors.white),
                        decoration: CustomInput.loginInputDecoration(
                            hint: '*****',
                            label: 'Password',
                            icon: Icons.lock_outline_rounded),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomOutlinedButton(
                        onPressed: () {
                          final validForm = registerFormProvider.validateForm();
                          if (!validForm) return;

                          //si el formulario es valido
                          //TODO: PETICION ALL AUTH PROVIDER REGISTER
                          final authprovider =
                              Provider.of<AuthProvider>(context, listen: false);
                          authprovider.register(
                              registerFormProvider.email,
                              registerFormProvider.password,
                              registerFormProvider.name);
                        },
                        text: 'Crear cuenta',
                        // color: Colors.red,
                        // isFilled: true,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      LinkText(
                          text: 'ir al Login',
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, Flurorouter.loginRoute);
                            // Navigator.pushNamed(context, Flurorouter.loginRoute);
                            //TODO: IR AL REGISTRO
                          })
                    ],
                  )),
            ),
          ),
        );
      }),
    );
  }
}
