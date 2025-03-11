import 'package:admin_dashboard/models/http/usuario.dart';
import 'package:admin_dashboard/providers/user_form_provider.dart';
import 'package:admin_dashboard/providers/user_provider.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:admin_dashboard/services/notifications_service.dart';
// import 'package:admin_dashboard/providers/user_provider.dart';
import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:email_validator/email_validator.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserView extends StatefulWidget {
  final String uid; // con el id puedo pasas los datos del usuario

  const UserView({super.key, required this.uid});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  Usuario? user;

  @override
  void initState() {
    super.initState();

    final usersProvider = Provider.of<UsersProvider>(context, listen: false);
    final userFormProvider =
        Provider.of<UserFormProvider>(context, listen: false);

    // usersProvider.getUserById(widget.uid)
    // .then((userDB) {   this.user = user; setState(() { this.user = userDB; });});

    usersProvider.getUserById(widget.uid).then((userDB) {
      if (userDB != null) {
        userFormProvider.user = userDB;
        userFormProvider.formKey = new GlobalKey<FormState>();
//TODO: pensar como se hara para actulizar el usuario del provider
        setState(() {
          this.user = userDB;
        });
      } else {
        NavigationService.replaceTo('/dashboar/users');
      }
    });
  }

  @override
  void dispose() {
    this.user = null;
    Provider.of<UserFormProvider>(context, listen: false).user = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            'User - View',
            style: CustomLabels.h1,
          ),
          const SizedBox(
            height: 10,
          ),

          if (user == null)
            WhiteCard(
                child: Container(
              alignment: Alignment.center,
              height: 300,
              child: Center(child: CircularProgressIndicator()),
            )),

          _UserViewBody()

          // WhiteCard(title: 'blank view sales ', child: Text(widget.uid))
        ],
      ),
    );
  }
}

class _UserViewBody extends StatelessWidget {
  const _UserViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Table(
        columnWidths: {
          0: FixedColumnWidth(250),
        },
        children: [
          TableRow(children: [_AvatarContainer(), _UserViewForm()])
        ],
      ),
    );
  }
}

class _UserViewForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userFormProvider = Provider.of<UserFormProvider>(context);
    final user = userFormProvider.user!;

    return WhiteCard(
        title: 'Informacion del usuario',
        child: Form(
            key: userFormProvider.formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: [
                TextFormField(
                  initialValue: user.nombre,

                  decoration: CustomInput.FormInputDecoration(
                      hint: 'Nombre del Usuario',
                      label: 'Nombre',
                      icon: Icons.supervised_user_circle_outlined),
                  onChanged: (value) =>
                      userFormProvider.copyUserWith(nombre: value),
                  // onChanged: (value) {
                  //   user.nombre=value;
                  //   userFormProvider.updateListener();
                  // },
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'ingrese un Nombre 👍🏼';
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue: user.correo,
                  decoration: CustomInput.FormInputDecoration(
                      hint: 'Correo del Usuario',
                      label: 'Correo',
                      icon: Icons.mail_outline_outlined),
                  onChanged: (value) =>
                      userFormProvider.copyUserWith(correo: value),
                  validator: (value) {
                    if (!EmailValidator.validate(value ?? ''))
                      return 'email no valido';

                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 120),
                  child: ElevatedButton(
                      onPressed: () async {
                        //TODO: actualizar el formulario.
                        final saved = await userFormProvider.updateUser();

                        if (saved) {
                          NotificationsService.showSnackbar(
                              'Usuario Actulizado');

                          Provider.of<UsersProvider>(context, listen: false)
                              .refreshUser(user);

                          //TODO: actualizar usuarios
                        } else {
                          NotificationsService.showSnackbarError(
                              'No se pudo Guardar');
                        }
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(Colors.indigo),
                          shadowColor:
                              WidgetStateProperty.all(Colors.transparent)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.save_alt_outlined,
                            color: Colors.white,
                            size: 15,
                          ),
                          Text(' Guardar',
                              style: TextStyle(color: Colors.white))
                        ],
                      )),
                )
              ],
            )));
  }
}

class _AvatarContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userFormProvider = Provider.of<UserFormProvider>(context);
    final user = userFormProvider.user!;
    final image = (user.img == null)
        ? Image(image: AssetImage('no-image.jpg'))
        : FadeInImage.assetNetwork(placeholder: 'loader.gif', image: user.img! ,);

    return WhiteCard(
        width: 250,
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Profile',
                style: CustomLabels.h2,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 140,
                height: 150,
                child: Stack(
                  children: [
                    ClipOval(
                      child: image,
                    ),
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: Colors.white, width: 6)),
                        child: FloatingActionButton(
                            backgroundColor: Colors.indigo,
                            elevation: 0,
                            child: Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.white,
                              size: 20,
                            ),
                            onPressed: () async {
                              FilePickerResult? result =
                                  await FilePicker.platform.pickFiles(
                                      // allowedExtensions: ['jpg'],
                                      // allowMultiple: false,
                                      );

                              if (result != null) {
                                // PlatformFile file = result.files.first;
                                // print(file.name);
                                // // print(file.bytes);
                                // print(file.size);
                                // print(file.extension);
                                // print(file.path);

                                NotificationsService.showBusyIndicator(context);
                                final newUser =
                                    await userFormProvider.uploadImage(
                                        '/uploads/usuarios/${user.uid}',
                                        result.files.first.bytes!);

                                Provider.of<UsersProvider>(context,
                                        listen: false)
                                    .refreshUser(newUser);

                                Navigator.of(context).pop();
                              } else {
                                // User canceled the picker
                                NotificationsService.showSnackbarError(
                                    'proceso cancelado');
                              }
                            }),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                user.nombre,
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ));
  }
}
