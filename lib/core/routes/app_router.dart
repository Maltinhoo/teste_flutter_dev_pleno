import 'package:flutter/material.dart';
import 'package:teste_dev_pleno/modules/home/presenter/pages/home_page.dart';
import 'package:teste_dev_pleno/modules/login/presenter/pages/login_page.dart';

import 'app_routes.dart';

mixin AppRouter {
  static MaterialPageRoute<dynamic> generateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments as Map<String, dynamic>?;
    String route = (routeSettings.name ?? '/');

    final data = route.split('/?');
    final query = <String, String>{};

    if (data.length > 1) {
      final params = data[1].split('&');
      for (final param in params) {
        final obj = param.split('=');
        if (obj.length > 1) query[obj[0]] = obj[1];
      }
      route = route.split('/?').first;
    }

    late final Widget page;

    page = switch (route) {
      Routes.login => const LoginPage(),
      Routes.home => const HomePage(),
      _ => const LoginPage(),
    };
    return MaterialPageRoute(
      builder: (_) => page,
      settings: routeSettings,
    );
  }
}
