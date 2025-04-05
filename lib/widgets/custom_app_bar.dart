import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue.shade900,
      elevation: 0,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white, // Ensure the title text is white
        ),
      ),
      actions: actions ??
          [
            IconButton(
              icon: Icon(Icons.account_circle, color: Colors.white), // Profile icon in white
              onPressed: () {
                Scaffold.of(context).openEndDrawer(); // Open the sidebar
              },
            ),
          ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}