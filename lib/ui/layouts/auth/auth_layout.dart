import 'package:admin_dashboard/ui/layouts/auth/widgets/custom_title.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/links_bar.dart';
import 'package:flutter/material.dart';

import 'widgets/background_twitter.dart';

class AuthLayout extends StatelessWidget {
  final Widget child;
  const AuthLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
//desktop
        _DesktopBody(child: child),
//Mobile

//Links bar
        LinksBar(),
      ],
    ));
  }
}

class _DesktopBody extends StatelessWidget {
  final Widget child;
  const _DesktopBody({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height * 0.95,
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
            child: Column(
              children: [
                CustomTitle(),
                SizedBox(
                  height: 50,
                ),
                Expanded(child: child)
              ],
            ),
            //child://TODO: LA VISTA
          )
        ],
      ),
    );
  }
}
