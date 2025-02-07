import 'package:admin_dashboard/models/http/category.dart';
import 'package:admin_dashboard/providers/categories_provider.dart';
import 'package:admin_dashboard/services/notifications_service.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryModal extends StatefulWidget {
  final Categoria? categoria;
  const CategoryModal({super.key, this.categoria});

  @override
  State<CategoryModal> createState() => _CategoryModalState();
}

class _CategoryModalState extends State<CategoryModal> {
  String nombre = '';
  String? id;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    id = widget.categoria?.id;
    nombre = widget.categoria?.nombre ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final categoryProvider =
        Provider.of<CategoriesProvider>(context, listen: false);
    return Container(
      padding: const EdgeInsets.all(20),
      height: 900,
      width: 1800,
      // width: double.infinity,
      // width: MediaQuery.of(context).size.width,
      decoration: buildBoxDecoration(),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.categoria?.nombre ?? 'nueva categoria',
                style: CustomLabels.h1
                    .copyWith(color: Colors.white.withValues(alpha: 0.1)),
              ),
              IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(
                    Icons.close_outlined,
                    color: Colors.white,
                  ))
            ],
          ),
          Divider(color: Colors.white.withValues(alpha: 0.2)),
          const Spacer(
            flex: 2,
          ),
          TextFormField(
            initialValue: widget.categoria?.nombre ?? 'no hay nombre',
            onChanged: (value) => nombre = value,
            decoration: CustomInput.loginInputDecoration(
                hint: 'Nombre de la categoria',
                label: 'Categoria',
                icon: Icons.new_releases_outlined),
            style: TextStyle(color: Colors.white),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            alignment: Alignment.center,
            child: CustomOutlinedButton(
              onPressed: () async {

                // if (id == null) {
                //   //crear
                // await  categoryProvider.newCategory(nombre);
                //   NotificationsService.showSnackbar('$nombre creado');
                // } else {
                //   //MODIFICAR
                //   categoryProvider.updateCategory(id!, nombre);
                //   NotificationsService.showSnackbar('$nombre Actualizado');
                // }
                // Navigator.of(context).pop();

                try {
                  if (id == null) {
                    //crear
                    await categoryProvider.newCategory(nombre);
                    NotificationsService.showSnackbar('$nombre creado');
                  } else {
                    //MODIFICAR
                    categoryProvider.updateCategory(id!, nombre);
                    NotificationsService.showSnackbar('$nombre Actualizado');
                  }
                  Navigator.of(context).pop();
                } catch (e) {
                  // print();
                  Navigator.of(context).pop();
                  NotificationsService.showSnackbar(e.toString());
                  // NotificationsService.showSnackbar(
                  //     'No se pudo guardar la categoria');
                }



              },
              color: Colors.white,
              text: 'Guardar',
            ),
          )
        ],
      ),
    );
  }

  buildBoxDecoration() => const BoxDecoration(
      // borderRadius: BorderRadius.circular(20),
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      color: Color(0xff0F2041),
      boxShadow: [BoxShadow(color: Colors.black26)]);
}
