import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoPageFoundView extends StatelessWidget {
  const NoPageFoundView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
        '404 NO page Found',
        //SI HICIERAMOS CORRER LA APP PARA ESCRITORIO MOSTRARIA UN ERROR EN EL USO DE FUENTES GOOGLE
        style: GoogleFonts.montserratAlternates(
            fontSize: 50, fontWeight: FontWeight.bold),
      )),
    );
  }
}
