import 'package:flutter/material.dart';

class LinksBar extends StatelessWidget {
  const LinksBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.black54,
      height: size.height * 0.05,
      child: Container(
        width: double.infinity,
        height: 50,
      ),
    );
  }
}
