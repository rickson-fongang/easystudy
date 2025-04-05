import 'package:flutter/material.dart';
import 'dart:async'; // For the countdown timer
import '../widgets/category_card.dart'; // Import the CategoryCard widget
import '../widgets/search.dart' as custom; // Alias the SearchBar widget
import '../widgets/course_card.dart'; // Import the global favoriteCourses list

class StudyModeScreen extends StatefulWidget {
  const StudyModeScreen({super.key});

  @override
  _StudyModeScreenState createState() => _StudyModeScreenState();
}

class _StudyModeScreenState extends State<StudyModeScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> filteredCategories = [];
  int _countdown = 10; // Countdown timer value
  Timer? _timer; // Timer instance

  final List<Map<String, dynamic>> categories = [
    {'title': 'Technical Education', 'icon': Icons.engineering},
    {'title': 'Science', 'icon': Icons.science},
    {'title': 'Commercial', 'icon': Icons.business},
    {'title': 'General', 'icon': Icons.public},
    {'title': 'Arts', 'icon': Icons.palette},
  ];

  final List<String> recentStudies = [
    'OL Mathematics',
    'Computer Science',
    'Engineering Science',
  ];

  @override
  void initState() {
    super.initState();
    filteredCategories = categories; // Initialize with all categories
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showPopupMessage(); // Show the popup message after the screen is built
    });
  }

  void _onSearch(String query) {
    setState(() {
      filteredCategories = categories
          .where((category) =>
              category['title'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _takeTest() {
    _showDialog(context, 'Take a Test', 'This feature is coming soon!');
  }

  void _showDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showPopupMessage() {
    // Start the countdown timer
    _startCountdown();

    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing by tapping outside
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Get Set USER!!'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Breathe in and out. Relax your mind, drink a glass of water, and let\'s begin.',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Starting in $_countdown seconds...',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    _timer?.cancel(); // Cancel the timer
                    Navigator.pop(context); // Close the dialog
                  },
                  child: const Text('Skip'),
                ),
              ],
            );
          },
        );
      },
    ).then((_) {
      // Ensure the timer is canceled when the dialog is dismissed
      _timer?.cancel();
    });
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdown > 1) {
        setState(() {
          _countdown--;
        });
      } else {
        timer.cancel();
        if (mounted) {
          Navigator.pop(context); // Close the dialog automatically after countdown
        }
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Text('Study Mode'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Greeting Text
                  Text(
                    'What do you want to study, Rickson?',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade900,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Search Bar
                  custom.SearchBar(
                    controller: _searchController,
                    onSearch: _onSearch,
                  ),
                  const SizedBox(height: 20),

                  // Categories Section
                  Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade900,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: filteredCategories.length,
                      itemBuilder: (context, index) {
                        final category = filteredCategories[index];
                        return CategoryCard(
                          title: category['title'],
                          icon: category['icon'],
                          onTap: () {
                            // Handle category tap
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Recent Study Section
                  Text(
                    'Recent Study',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade900,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: recentStudies.length,
                      itemBuilder: (context, index) {
                        final course = recentStudies[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: CourseCard(
                            title: course,
                            backgroundColor: Colors.green.shade100,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Favorite Courses Section
                  if (favoriteCourses.isNotEmpty) ...[
                    Text(
                      'Favorite Courses',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade900,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: favoriteCourses.length,
                        itemBuilder: (context, index) {
                          final course = favoriteCourses[index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: CourseCard(
                              title: course,
                              backgroundColor: Colors.blue.shade100,
                            ),
                          );
                        },
                      ),
                    ),
                  ] else ...[
                    const Text(
                      'No favorite courses yet.',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ],
              ),
            ),
          ),

          // Button to Take a Test
          Positioned(
            bottom: 16,
            right: 16, // Move to the bottom-right corner
            child: ElevatedButton.icon(
              onPressed: _takeTest,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 12.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              icon: const Icon(
                Icons.emoji_emotions, // Smiling icon
                color: Colors.white,
              ),
              label: const Text(
                'Take a Test',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}