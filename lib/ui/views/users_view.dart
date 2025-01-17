import 'package:admin_dashboard/datatables/users_datasources.dart';
import 'package:admin_dashboard/providers/user_provider.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UsersView extends StatelessWidget {

  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {

    final usersProvider=Provider.of<UserProvider>(context);
    
    final usersDataSource= new UsersDataSource(usersProvider.users);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            'Users - View',
            style: CustomLabels.h1,
          ),
          const SizedBox(
            height: 10,
          ),


          PaginatedDataTable(
            columns: [
              DataColumn(label: Text('Avatar')), 
              DataColumn(label: Text('Nombre'),onSort: (colIndex, _){
                usersProvider.sort<String>((user) => user.nombre);
               
              }), 
              DataColumn(label: Text('Email'),onSort: (colIndex, _){
                usersProvider.sort<String>((user) => user.correo);}), 
              DataColumn(label: Text('UUID')), 
              DataColumn(label: Text('Acciones')), 
            ],
            source: usersDataSource
            )

        ],
      ),
    );
  }
}
