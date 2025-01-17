import 'package:admin_dashboard/models/http/category.dart';
import 'package:admin_dashboard/providers/categories_provider.dart';
import 'package:admin_dashboard/ui/modals/categori_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesDTS extends DataTableSource {
  final List<Categoria> categorias;
  final BuildContext context;

  CategoriesDTS(this.categorias, this.context);
  @override
  DataRow? getRow(int index) {
    final categoria = this.categorias[index];
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(categoria.id)),
      DataCell(Text(categoria.nombre)),
      DataCell(Text(categoria.usuario.nombre)),
      DataCell(Row(
        children: [
          IconButton(
              onPressed: () {
                print('Editando categoria: ' + categoria.nombre);

                showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (_) => CategoryModal(
                          categoria: categoria,
                        ));
              },
              icon: Icon(Icons.edit_outlined)),
          IconButton(
              onPressed: () {
                // print('Borrando categoria: ' + categoria.nombre);
                final dialog = AlertDialog(
                  title: Text('esta seguro de borrarlo ..?'),
                  content: Text('Borrar definitivamente ${categoria.nombre}'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('NO')),
                    TextButton(
                        onPressed: () async {
                          await Provider.of<CategoriesProvider>(context,
                                  listen: false)
                              .deleteCategory(categoria.id);
                          Navigator.of(context).pop();
                        },
                        child: Text('SI BORRAR'))
                  ],
                );

                showDialog(context: context, builder: (_) => dialog);
              },
              icon: Icon(
                Icons.delete_outline,
                color: Colors.red.withValues(alpha: 0.3),
              )),
        ],
      )),
    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => categorias.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
