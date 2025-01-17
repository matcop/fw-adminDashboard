import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:flutter/material.dart';

class SearchText extends StatelessWidget {
  const SearchText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: builBoxDecoration(),
      child: TextField(
        decoration: CustomInput.searchInputDecoration(hint: 'buscar', icon: Icons.search_outlined),
      ),
    );
  }

  BoxDecoration builBoxDecoration() => BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.grey.withOpacity(0.2)
  );
}
