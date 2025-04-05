import 'package:flutter/material.dart';

// Global list to store favorite courses
List<String> favoriteCourses = [];

class CourseCard extends StatefulWidget {
  final String title;
  final Color backgroundColor; // Add a background color property

  const CourseCard({
    super.key,
    required this.title,
    this.backgroundColor = Colors.blue, // Default background color
  });

  @override
  _CourseCardState createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {
  bool isFavorite = false; // Track whether the course is marked as favorite

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite; // Toggle the favorite state
      if (isFavorite) {
        favoriteCourses.add(widget.title); // Add to favorites
      } else {
        favoriteCourses.remove(widget.title); // Remove from favorites
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20), // Rounded edges
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Background with the first letter of the title
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: widget.backgroundColor.withOpacity(0.2), // Use the provided background color
                borderRadius: BorderRadius.circular(20), // Match rounded edges
              ),
              child: Center(
                child: Text(
                  widget.title[0], // First letter of the title
                  style: TextStyle(
                    fontSize: 80, // Bigger font size for the letter
                    fontWeight: FontWeight.bold,
                    color: widget.backgroundColor.withOpacity(0.6), // Subtle color
                  ),
                ),
              ),
            ),
          ),
          // Star Icon at the top-right corner
          Positioned(
            top: 8,
            right: 8,
            child: GestureDetector(
              onTap: _toggleFavorite, // Toggle favorite state on tap
              child: Icon(
                isFavorite ? Icons.star : Icons.star_border, // Filled or outlined star
                color: isFavorite ? Colors.yellow : Colors.grey, // Yellow for favorite
                size: 24,
              ),
            ),
          ),
          // Title overlay
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20), // Match rounded edges
                ),
              ),
              padding: EdgeInsets.all(8.0),
              child: Text(
                widget.title,
                style: TextStyle(
                  fontSize: 16, // Slightly larger font for the title
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}