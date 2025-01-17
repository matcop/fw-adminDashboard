import 'package:admin_dashboard/ui/layouts/auth/widgets/custom_title.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/links_bar.dart';
import 'package:flutter/material.dart';

import 'widgets/background_twitter.dart';

class AuthLayout extends StatelessWidget {
  final Widget child;
  const AuthLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Scrollbar(
      thumbVisibility: true,
      trackVisibility: true,
      thickness: 18.0,
      radius: const Radius.circular(0.5),

      interactive: true,
      // isAlwaysShown:true,
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          (size.width > 1000)
              ? _DesktopBody(child: child)
              : _MobileBody(child: child),

          //Links bar
          const LinksBar(),
        ],
      ),
    ));
  }
}

class _MobileBody extends StatelessWidget {
  final Widget child;
  const _MobileBody({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const CustomTitle(),
          Container(
            width: double.infinity,
            height: 420,
            child: child,
          ),
          Container(
            width: double.infinity,
            height: 400,
            child: const BackgroundTwitter(),
          )
        ],
      ),
    );
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
      color: Colors.black,
      child: Row(
        children: [

          //twiter background
          const Expanded(child: BackgroundTwitter()),

          //view container
          Container(
            width: 600,
            height: double.infinity, //tomara todo el ancho posible
            color: Colors.black,
            child: Column(
              children: [
                const CustomTitle(),
                const SizedBox(
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
