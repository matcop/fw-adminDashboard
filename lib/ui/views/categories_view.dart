import 'package:admin_dashboard/datatables/categories_datasources.dart';
import 'package:admin_dashboard/providers/categories_provider.dart';
import 'package:admin_dashboard/ui/buttons/custom_icon_button.dart';
import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:admin_dashboard/ui/modals/categori_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Provider.of<CategoriesProvider>(context, listen: false).getCategories();
  }

  @override
  Widget build(BuildContext context) {
    final categorias = Provider.of<CategoriesProvider>(context, listen: true).categorias;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            'Categories - View',
            style: CustomLabels.h1,
          ),
          const SizedBox(
            height: 10,
          ),
          WhiteCard(
              child: PaginatedDataTable(
            columns: const [
              DataColumn(label: Text('ID'), tooltip: 'Identificador unico'),
              DataColumn(
                  label: Text('CATEGORIA'),
                  tooltip: 'Valor porcentual de su boleta %'),
              DataColumn(label: Text('CREADO POR')),
              DataColumn(label: Text('ACCIONES')),
            ],
            source: CategoriesDTS(categorias, context),
            header: const Text(
              'Esta es la lista de todas las categorias, Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nec vero intermittunt aut admirationem earum rerum, quae sunt ab antiquis repertae, aut investigationem novarum. Equidem etiam Epicurum, in physicis quidem, Democriteum puto. Duo Reges: constructio interrete. A quibus propter discendi cupiditatem videmus ultimas terras esse peragratas. Verum hoc idem saepe faciamus. Alterum significari idem, ut si diceretur, officia media omnia aut pleraque servantem vivere. Cyrenaici quidem non recusant; Quantum Aristoxeni ingenium consumptum videmus in musicis',
              maxLines: 2,
            ),

            onRowsPerPageChanged: (value) {
              setState(() {
                _rowsPerPage = value ?? 10;
              });
            },
            rowsPerPage: _rowsPerPage,
            actions: [
              CustomIconButton(
                  onPressed: () {
                    print('mostrar el modal');
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: ( _ ) => const CategoryModal(categoria: null,) 
                     );
                  }, text: ' CREAR', icon: Icons.add_outlined)
            ],
          ))
        ],
      ),
    );
  }
}
