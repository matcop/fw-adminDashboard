import 'package:admin_dashboard/models/http/usuario.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:admin_dashboard/ui/views/user_view.dart';
import 'package:flutter/material.dart';

class UsersDataSource extends DataTableSource {
  final List<Usuario> users;

  UsersDataSource(this.users);

  @override
  DataRow? getRow(int index) {
    final Usuario user = users[index];
    // final image =Image(image: AssetImage('no-image.jpg'), width: 35, height: 35);


    final image= (user.img==null)? Image(image: AssetImage('no-image.jpg'),width: 35,height: 35,):FadeInImage.assetNetwork(placeholder:'loader.gif', image:user.img!,width: 35,height: 35,);


    return DataRow.byIndex(index: index, cells: [
      DataCell(ClipOval(child: image)),
      DataCell(Text(user.nombre)),
      DataCell(Text(user.correo)),
      DataCell(Text(user.uid)),
      DataCell(IconButton(onPressed: () {
        NavigationService.replaceTo('/dashboard/users/${user.uid}');
        // UserView(uid: user.uid);
      }, icon: Icon(Icons.edit_outlined))),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => users.length;

  @override
  int get selectedRowCount => 0;
}
