import 'package:admin_dashboard/providers/sidemenu_provider.dart';
import 'package:admin_dashboard/ui/shared/widgets/navbar_avatar.dart';
import 'package:admin_dashboard/ui/shared/widgets/notification_indicator.dart';
import 'package:admin_dashboard/ui/shared/widgets/search_text.dart';
import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: 50,
      decoration: buildBoxDecoration(),
      child: Row(
        children: [
          //icono de la hamburguesa
          if (size.width <= 700)
           const IconButton(onPressed: SideMenuProvider.openMenu, icon: Icon(Icons.menu_outlined)),

        const  SizedBox(width: 5),

          //search box container
          if(size.width >397)
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 250),
            child: const SearchText(),
          ),
          const Spacer(),
      const    NotificationIndicator(),
        const  SizedBox(
            width: 10,
          ),
         const NavbarAvatar(),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() =>const BoxDecoration(
      color: Colors.white,
      boxShadow: [BoxShadow(color: Colors.black, blurRadius: 15)]);
}
