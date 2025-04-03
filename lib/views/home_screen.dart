import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> categories = [
    {'title': 'Mathematics', 'icon': Icons.calculate},
    {'title': 'Science', 'icon': Icons.science},
    {'title': 'History', 'icon': Icons.history_edu},
    {'title': 'Languages', 'icon': Icons.language},
  ];

  final List<Map<String, dynamic>> popularCourses = [
    {
      'title': 'Algebra Basics',
      'image': 'assets/images/course1.jpg',
    },
    {
      'title': 'Physics Fundamentals',
      'image': 'assets/images/course2.jpg',
    },
    {
      'title': 'World History',
      'image': 'assets/images/course3.jpg',
    },
    {
      'title': 'English Grammar',
      'image': 'assets/images/course4.jpg',
    },
    {
      'title': 'Calculus Essentials',
      'image': 'assets/images/course5.jpg',
    },
    {
      'title': 'Chemistry Basics',
      'image': 'assets/images/course6.jpg',
    },
    {
      'title': 'Geography Insights',
      'image': 'assets/images/course7.jpg',
    },
    {
      'title': 'Literature Analysis',
      'image': 'assets/images/course8.jpg',
    },
    {
      'title': 'Programming 101',
      'image': 'assets/images/course9.jpg',
    },
    {
      'title': 'Biology Basics',
      'image': 'assets/images/course10.jpg',
    },
  ];

  List<Map<String, dynamic>> filteredCourses = []; // For filtered search results
  bool isDarkMode = false; // Track dark mode state

  @override
  void initState() {
    super.initState();
    filteredCourses = popularCourses; // Initialize with all courses
  }

  void _filterCourses(String query) {
    final results = popularCourses.where((course) {
      final title = course['title'].toLowerCase();
      final input = query.toLowerCase();
      return title.contains(input); // Check if the title contains the query
    }).toList();

    setState(() {
      filteredCourses = results; // Update the filtered list
    });
  }

  void _toggleDarkMode() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade900,
          elevation: 0,
          title: Text(
            'EasyStudy',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            // Dark Mode Toggle Button
            IconButton(
              icon: Icon(
                isDarkMode ? Icons.light_mode : Icons.dark_mode,
                color: Colors.white,
              ),
              onPressed: _toggleDarkMode,
            ),
            IconButton(
              icon: Icon(Icons.account_circle, size: 30),
              onPressed: () {
                // Navigate to Profile Screen
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Welcome Section
                Text(
                  'Welcome Back, Rickson!',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade900,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'What would you like to learn today?',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade700,
                  ),
                ),
                SizedBox(height: 20),

                // Search Bar
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for exam questions...',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: _filterCourses, // Call the filter function on input change
                ),
                SizedBox(height: 20),

                // Categories Section
                Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade900,
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      return GestureDetector(
                        onTap: () {
                          // Navigate to a filtered list of questions for this category
                        },
                        child: _buildCategoryCard(category['title'], category['icon']),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),

                // Popular Courses Section
                Text(
                  'Recent Pass Questions',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade900,
                  ),
                ),
                SizedBox(height: 10),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 3 / 2,
                  ),
                  itemCount: filteredCourses.length, // Use filtered list
                  itemBuilder: (context, index) {
                    final course = filteredCourses[index];
                    return GestureDetector(
                      onTap: () {
                        // Navigate to course details
                      },
                      child: _buildCourseCard(course['title'], course['image']),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blue.shade900,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Study Mode',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.quiz),
              label: 'Exam Mode',
            ),
          ],
          onTap: (index) {
            // Handle navigation
            if (index == 1) {
              // Navigate to Study Mode
            } else if (index == 2) {
              // Navigate to Exam Mode
            }
          },
        ),
      ),
    );
  }

  // Helper method to build a category card
  Widget _buildCategoryCard(String title, IconData icon) {
    return Container(
      width: 100,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 30, color: Colors.blue.shade900),
          SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade900,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // Helper method to build a course card
  Widget _buildCourseCard(String title, String imagePath) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.asset(
              imagePath,
              height: 80,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}