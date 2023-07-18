import 'dart:developer';

import 'package:cegid_app/app/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';

import 'package:cegid_app/app/routes/app_routes.dart';

class AppRouteProvider {

  AppRouteProvider() : super();

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static NavigatorState get navigate {
      return navigatorKey.currentState!;
  }

  PageRoute generateRoute(RouteSettings settings) {
   
    dynamic page;
    String name = '';
    final String path = settings.name ?? "";
    

    switch (path){
      case AppRoutes.root:
        name = 'root';
        page = MaterialPageRoute(
          builder: (context) => const SplashPage(),
          settings: settings,
        );

        break;
        
        default:
        page = MaterialPageRoute(builder: (context) => Container());
    }
    
    log(name, name: "route_provider");
    return page;
  }

}