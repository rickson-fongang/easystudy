import 'package:flutter/material.dart';
import 'views/home_screen.dart'; // Import the HomeScreen
import 'views/study_mode.dart'; // Import the StudyModeScreen
import 'views/community_screen.dart'; // Import the CommunityScreen
import 'views/splash_screen.dart'; // Import the SplashScreen
import 'views/onboard_screen.dart'; // Import the OnboardingScreen
import 'views/signup_screen.dart'; // Import the SignupScreen
import 'routes/route_names.dart'; // Import route names
import 'theme/theme.dart'; // Import the theme file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: RouteNames.splash, // Start with SplashScreen
      routes: {
        RouteNames.splash: (context) => const SplashScreen(),
        RouteNames.onboarding: (context) => const OnboardScreen(),
        RouteNames.signup: (context) => const SignupScreen(),
        RouteNames.home: (context) => HomeScreen(
          isDarkMode: Theme.of(context).brightness == Brightness.dark,
          onThemeChanged: (bool isDark) {
            setState(() {
              isDark ? ThemeMode.dark : ThemeMode.light;
            });
          },
        ),
        RouteNames.studyMode: (context) => const StudyModeScreen(),
        RouteNames.community: (context) => const CommunityScreen(),
      },
    );
  }
}