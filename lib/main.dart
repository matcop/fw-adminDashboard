import 'package:admin_dashboard/api/CafeApi.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/layouts/auth/auth_layout.dart';
import 'package:admin_dashboard/ui/layouts/dashboard/dashboard_layout.dart';
import 'package:admin_dashboard/ui/layouts/splash/splash_layout.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'providers/provider.dart';
import 'services/services.dart';

void main() async {
  await LocalStorage.configurePrefs();
  CafeApi.configureDio();
  Flurorouter.configureRoutes();

  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //solo se hara bajo demanda
        ChangeNotifierProvider(lazy: false, create: (_) => AuthProvider()),
        ChangeNotifierProvider(lazy: false,create: (_)=>SideMenuProvider()),
        ChangeNotifierProvider(lazy: false,create: (_)=>UsersProvider()),
        ChangeNotifierProvider(lazy: true,create: (_)=>CategoriesProvider()),
        ChangeNotifierProvider(lazy: true,create: (_)=>UserFormProvider()),

        //se inicializara bajo demanda cuando el lazy esta en true

      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Dashboards',
      initialRoute: '/',
      onGenerateRoute: Flurorouter.router.generator,
      navigatorKey: NavigationService.navigatorKey,
      scaffoldMessengerKey: NotificationsService.messengerKey,
      builder: (_, child) {
        final authProvider = Provider.of<AuthProvider>(context);
        
        if (authProvider.authStatus == AuthStatus.checking) {
          return const SplashLayout();
          // return const Center(child: Text('checking'));
        }
        

        if (authProvider.authStatus == AuthStatus.authenticated) {
          return DashboardLayout(child: child!);
        } else {
          return AuthLayout(child: child!);
        }
      },
      theme: ThemeData.light().copyWith(
          scrollbarTheme: ScrollbarThemeData(
              thumbColor: WidgetStateProperty.all(Colors.amber))),
    );
  }
}
