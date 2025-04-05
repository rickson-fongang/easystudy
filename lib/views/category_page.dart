import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  final String category;
  final List<Map<String, dynamic>> courses;

  const CategoryPage({required this.category, required this.courses, super.key});

  @override
  Widget build(BuildContext context) {
    // Filter courses based on the selected category
    final filteredCourses = courses.where((course) {
      return course['title'].toLowerCase().contains(category.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text('$category Courses'),
      ),
      body: filteredCourses.isEmpty
          ? Center(
              child: Text(
                'No courses found for $category',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade700,
                ),
              ),
            )
          : ListView.builder(
              itemCount: filteredCourses.length,
              itemBuilder: (context, index) {
                final course = filteredCourses[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text(
                      course['title'],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade900,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward, color: Colors.blue.shade900),
                    onTap: () {
                      // Handle navigation to course details if needed
                    },
                  ),
                );
              },
            ),
    );
  }
}