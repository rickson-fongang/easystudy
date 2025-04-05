import 'package:flutter/material.dart';
import 'views/home_screen.dart'; // Import the HomeScreen
import 'views/study_mode.dart'; // Import the StudyModeScreen
import 'views/community_screen.dart'; // Import the CommunityScreen
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
  bool isDarkMode = false; // Track the current theme mode

  void _toggleTheme(bool value) {
    setState(() {
      isDarkMode = value; // Update the theme mode
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme, // Use the light theme
      darkTheme: AppTheme.darkTheme, // Use the dark theme
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light, // Switch theme
      initialRoute: RouteNames.home, // Set the initial route
      routes: {
        RouteNames.home: (context) => HomeScreen(
              isDarkMode: isDarkMode,
              onThemeChanged: _toggleTheme,
            ),
        RouteNames.studyMode: (context) => const StudyModeScreen(),
        RouteNames.community: (context) => const CommunityScreen(),
      },
    );
  }
}