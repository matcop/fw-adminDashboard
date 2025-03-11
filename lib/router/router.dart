import 'package:admin_dashboard/router/admin_handlers.dart';
import 'package:admin_dashboard/router/dashboard_handlers.dart';
import 'package:admin_dashboard/router/no_page_found_handlers.dart';
import 'package:fluro/fluro.dart';

class Flurorouter {
  static final FluroRouter router = new FluroRouter();
// static String loginRoute='/auth/login';

  static String rootRoute = '/';

//Auth Router
  static String loginRoute = '/auth/login';
  static String registerRoute = '/auth/register';

//Dashboard
  static String dashboardRoute = '/dashboard';
  static String blankRoute = '/blank';
  static String iconsRoute = '/dashboard/icons';
  static String categoriesRoute = '/dashboard/categories';
  static String usersRoute = '/dashboard/users';

  static String userRoute = '/dashboard/users/:uid';


  static void configureRoutes() {
//auth Routes
    router.define(rootRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(loginRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(registerRoute,
        handler: AdminHandlers.register, transitionType: TransitionType.none);

// Dashboard Route
//TODO: falta el handler de la
    router.define(dashboardRoute,
        handler: DashboardHandlers.dashboard,
        transitionType: TransitionType.fadeIn);

    //Blank route
    router.define(blankRoute,
        handler: DashboardHandlers.blank,
        transitionType: TransitionType.fadeIn);

    router.define(categoriesRoute,
        handler: DashboardHandlers.categories,
        transitionType: TransitionType.fadeIn);

    //404
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;

    //icons route
    router.define(iconsRoute,
        handler: DashboardHandlers.icons,
        transitionType: TransitionType.fadeIn);

    //users route
    router.define(usersRoute,handler: DashboardHandlers.users,transitionType: TransitionType.fadeIn);
    router.define(userRoute,handler: DashboardHandlers.user,transitionType: TransitionType.fadeIn);

  }
}
