import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/login_form_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return ChangeNotifierProvider(
        create: (_) => LoginFormProvider(),
        child: Builder(builder: (context) {
          final loginFormProvider =
              Provider.of<LoginFormProvider>(context, listen: false);

          return Container(
            margin: const EdgeInsets.only(top: 100),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            // color: Colors.red,
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 370),
                child: Form(
                    autovalidateMode: AutovalidateMode.always,
                    key: loginFormProvider.formKey,
                    child: Column(
                      children: [
                        //EMAIL
                        TextFormField(
                          onFieldSubmitted: (_) =>
                              onFormSubmit(loginFormProvider, authProvider),
                          onChanged: (value) => loginFormProvider.email = value,
                          validator: (value) {
                            if (!EmailValidator.validate(value ?? ''))
                              return 'correo no valido  ';
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
                        //PASSWORD
                        TextFormField(
                          onFieldSubmitted: (_) =>
                              onFormSubmit(loginFormProvider, authProvider),
                          onChanged: (value) =>
                              loginFormProvider.password = value,

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
                          onPressed: () =>
                              onFormSubmit(loginFormProvider, authProvider),
                          text: 'Ingresar aqui',
                          // color: Colors.red,
                          // isFilled: true,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        LinkText(
                            text: 'Nueva cuenta',
                            onPressed: () {
                              // print("ir al registro");
                              Navigator.pushReplacementNamed(
                                  context, Flurorouter.registerRoute);
                              //TODO: IR AL REGISTRO
                            })
                      ],
                    )),
              ),
            ),
          );
        }));
  }

  void onFormSubmit(
      LoginFormProvider loginFormProvider, AuthProvider authProvider) {
    final isValid = loginFormProvider.validateForm();
    if (isValid) {
      authProvider.login(loginFormProvider.email, loginFormProvider.password);
    }
  }
}
