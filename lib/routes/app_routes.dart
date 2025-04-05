import 'package:flutter/material.dart';
import '../views/splash_screen.dart';
import '../views/login_screen.dart';
import '../views/signup_screen.dart';
import '../views/home_screen.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case signup:
        return MaterialPageRoute(builder: (_) => SignupScreen());
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen(
          isDarkMode: false, // Replace with the appropriate value
          onThemeChanged: (bool value) {
            // Implement the theme change logic here
          },
        ));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}