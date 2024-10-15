import 'package:flutter/material.dart';

import 'widgets/background_twitter.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
//desktop
        _DesktopBody(),
//Mobile

//Links bar
      ],
    ));
  }
}

class _DesktopBody extends StatelessWidget {
  const _DesktopBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height,
      color: Colors.red,
      child: Row(
        children: [
          //twiter background
          BackgroundTwitter(),
          //view container
          Container(
            width: 600,
            height: double.infinity, //tomara todo el ancho posible
            color: Colors.black,
            //child://TODO: LA VISTA
          )
        ],
      ),
    );
  }
}
