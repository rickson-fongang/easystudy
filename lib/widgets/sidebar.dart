import 'package:flutter/material.dart';
import '../theme/theme.dart'; // Import your theme file
import 'course_card.dart'; // Import the global favoriteCourses list

class Sidebar extends StatefulWidget {
  final bool isDarkMode; // Current theme mode
  final Function(bool) onThemeChanged; // Callback to toggle theme

  const Sidebar({
    Key? key,
    required this.isDarkMode,
    required this.onThemeChanged,
  }) : super(key: key);

  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Access the current theme
    final isDarkMode = widget.isDarkMode;

    return Drawer(
      backgroundColor: isDarkMode ? Colors.black : Colors.white, // Sidebar background
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // User Information Section
          DrawerHeader(
            decoration: BoxDecoration(
              color: isDarkMode ? Colors.grey[900] : theme.primaryColor, // Dynamic background
            ),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: isDarkMode ? Colors.grey[800] : Colors.white,
                      child: Icon(
                        Icons.person,
                        size: 50,
                        color: isDarkMode ? Colors.white : theme.primaryColor,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Rickson Fongang', // Replace with dynamic user name if available
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Colors.white : Colors.white,
                      ),
                    ),
                    Text(
                      'username@example.com', // Replace with dynamic user email if available
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: isDarkMode ? Colors.grey : Colors.white70,
                      ),
                    ),
                  ],
                ),
                // Edit Icon at the top-right corner
                Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                    icon: Icon(Icons.edit, color: isDarkMode ? Colors.white : Colors.white),
                    onPressed: () {
                      // Handle edit action
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Edit user information')),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          // Favorite Courses Section
          ListTile(
            title: Text(
              'Favorite Courses',
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : theme.primaryColor,
              ),
            ),
          ),
          ...favoriteCourses.map((course) {
            return ListTile(
              leading: Icon(Icons.star, color: Colors.yellow),
              title: Text(
                course,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              onTap: () {
                // Handle navigation or actions for the favorite course
              },
            );
          }).toList(),
          Divider(color: isDarkMode ? Colors.grey : Colors.black),

          // Dark Mode Switch
          SwitchListTile(
            title: Text(
              'Dark Mode',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            secondary: Icon(
              widget.isDarkMode ? Icons.dark_mode : Icons.light_mode,
              color: isDarkMode ? Colors.white : theme.primaryColor,
            ),
            value: widget.isDarkMode,
            onChanged: (value) {
              widget.onThemeChanged(value); // Call the callback to toggle theme
            },
          ),
          Divider(color: isDarkMode ? Colors.grey : Colors.black),

          // Additional Options Section
          ListTile(
            leading: Icon(Icons.settings, color: isDarkMode ? Colors.white : theme.primaryColor),
            title: Text(
              'Settings',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            onTap: () {
              // Handle Settings action
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Settings clicked')),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.info, color: isDarkMode ? Colors.white : theme.primaryColor),
            title: Text(
              'About',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            onTap: () {
              // Handle About action
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('About clicked')),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.share, color: isDarkMode ? Colors.white : theme.primaryColor),
            title: Text(
              'Share',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            onTap: () {
              // Handle Share action
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Share clicked')),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.help, color: isDarkMode ? Colors.white : theme.primaryColor),
            title: Text(
              'Help',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            onTap: () {
              // Handle Help action
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Help clicked')),
              );
            },
          ),
        ],
      ),
    );
  }
}