import 'package:admin_dashboard/providers/sidemenu_provider.dart';
import 'package:admin_dashboard/ui/shared/navbar.dart';
import 'package:admin_dashboard/ui/shared/sidebar.dart';
import 'package:flutter/material.dart';

class DashboardLayout extends StatefulWidget {
  final Widget child;
  const DashboardLayout({super.key, required this.child});

  @override
  State<DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SideMenuProvider.menuController = new AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color(0xffEDF1F2),
        body: Stack(
          children: [
            Row(
              children: [
                //depende si es mas de 700px
                if (size.width >= 700) const Sidebar(),

                Expanded(
                  child: Column(
                    children: [
                      //NAVBAR
                      const Navbar(),

                      Expanded(
                          child: Container(
                        // padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        child: widget.child,
                      ))
                    ],
                  ),
                ),
                // este es el contenedor del view o vistas
              ],
            ),
            if (size.width < 700)
              AnimatedBuilder(
                  animation: SideMenuProvider.menuController,
                  child: widget.child,
                  builder: (BuildContext context, _) => Stack(
                        children: [
                          //TODO: BACGROUND DEL SIDEBAR
                          if (SideMenuProvider.isOpen)
                            Opacity(
                              opacity: SideMenuProvider.opacity.value,
                              child: GestureDetector(
                                onTap: () => SideMenuProvider.CloseMenu(),
                                child: Container(
                                  width: size.width,
                                  height: size.height,
                                  color: Colors.black45,
                                ),
                              ),
                            ),
                          //  duration: Duration(milliseconds: 200))

                          Transform.translate(
                            offset: Offset(SideMenuProvider.movement.value, 0),
                            child: const Sidebar(),
                          )
                        ],
                      )),

            //Sidebar(),
          ],
        ));
  }
}
