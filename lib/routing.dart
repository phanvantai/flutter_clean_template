import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import 'features/authentication/presentation/login_view.dart';
import 'features/common/presentation/splash_view.dart';

class Routing {
  static const String splash = "/";
  static const String login = "/login";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    return fadeThrough(settings, (context) {
      switch (settings.name) {
        case Routing.splash:
          return const SplashView();
        case Routing.login:
          return const LoginView();
        default:
          return const SplashView();
      }
    });
  }

  static Route<T> fadeThrough<T>(RouteSettings settings, WidgetBuilder page,
      {int duration = 200}) {
    return PageRouteBuilder<T>(
      settings: settings,
      transitionDuration: Duration(milliseconds: duration),
      pageBuilder: (context, animation, secondaryAnimation) => page(context),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeScaleTransition(animation: animation, child: child);
      },
    );
  }
}
