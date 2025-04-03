import 'package:flutter/material.dart';
import 'routes/app_routes.dart';
import 'routes/navigation_service.dart';
import 'theme/theme.dart';

void main() {
  runApp(const MyApp()); // Added 'const' here
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EasyStudy',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      navigatorKey: NavigationService.navigatorKey, // Use the global navigator key
      onGenerateRoute: AppRoutes.generateRoute, // Use the route generator
      initialRoute: '/splash', // Set the initial route
    );
  }
}