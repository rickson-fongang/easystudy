import 'package:flutter/material.dart';
import 'category_page.dart'; // Import the category page
import '../widgets/sidebar.dart'; // Import the Sidebar widget
import '../widgets/category_card.dart'; // Import the CategoryCard widget
import '../widgets/course_card.dart'; // Import the CourseCard widget
import '../widgets/bottom_nav_bar.dart'; // Import the BottomNavBar widget
import '../widgets/search.dart' as custom; // Alias the SearchBar widget
import '../routes/route_names.dart'; // Import route names

class HomeScreen extends StatefulWidget {
  final bool isDarkMode; // Current theme mode
  final Function(bool) onThemeChanged; // Callback to toggle theme

  const HomeScreen({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // Track the selected tab in the bottom navigation bar
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> filteredCourses = [];

  final List<Map<String, dynamic>> categories = [
    {'title': 'Technical Education', 'icon': Icons.engineering},
    {'title': 'Science', 'icon': Icons.science},
    {'title': 'Commercial', 'icon': Icons.business},
    {'title': 'General', 'icon': Icons.public},
    {'title': 'Arts', 'icon': Icons.palette},
  ];

  final List<Map<String, dynamic>> popularCourses = [
    {'title': 'OL Mathematics'},
    {'title': 'Computer Science'},
    {'title': 'Soils and Survey'},
    {'title': 'Engineering Science'},
    {'title': 'Technical Drawing'},
    {'title': 'Professional English'},
    {'title': 'OL Economics'},
    {'title': 'Pure Mathematics'},
    {'title': 'OL English'},
    {'title': 'Applied Mechanics'},
  ];

  @override
  void initState() {
    super.initState();
    filteredCourses = popularCourses; // Initialize with all courses
  }

  void _onSearch(String query) {
    setState(() {
      filteredCourses = popularCourses
          .where((course) =>
              course['title'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Navigate to the appropriate screen based on the selected tab
    if (index == 1) {
      Navigator.pushNamed(context, RouteNames.studyMode); // Navigate to Study Mode
    } else if (index == 2) {
      Navigator.pushNamed(context, RouteNames.community); // Navigate to Community
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.account_circle, size: 30),
              onPressed: () {
                Scaffold.of(context).openEndDrawer(); // Open the Sidebar
              },
            ),
          ),
        ],
      ),
      endDrawer: Sidebar(
        isDarkMode: widget.isDarkMode, // Pass the current theme mode
        onThemeChanged: widget.onThemeChanged, // Pass the callback to toggle theme
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              custom.SearchBar(
                controller: _searchController,
                onSearch: _onSearch,
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
                    return CategoryCard(
                      title: category['title'],
                      icon: category['icon'],
                      onTap: () {
                        // Navigate to Category Page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategoryPage(
                              category: category['title'],
                              courses: popularCourses,
                            ),
                          ),
                        );
                      },
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
                itemCount: filteredCourses.length,
                itemBuilder: (context, index) {
                  final course = filteredCourses[index];
                  return CourseCard(title: course['title']);
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}