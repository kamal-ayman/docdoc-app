import 'package:docdoc_app/core/routing/routes.dart';
import 'package:flutter/material.dart';

import '../../features/login/ui/login_screen.dart';
import '../../features/onboarding/onboarding_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
        builder: (context) => const OnBoardingScreen(),
      );
      case Routes.loginScreen:
        return MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(body: Text('no screen found..')),
        );
    }
  }
}