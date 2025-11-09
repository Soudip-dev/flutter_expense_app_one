import 'package:flutter/material.dart';

class AppDrawer {
  static Widget buildDrawer(BuildContext context) {
    return 
    Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            accountName: Text("Demo User"),
            accountEmail: Text("demouser@gmail.com"),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              // Navigate to home page
            },
          ),
          ListTile(
            leading: Icon(Icons.category),
            title: Text("Category"),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              // Navigate to category page
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Setting"),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              // Navigate to settings page
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text("About Us"),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              // Navigate to about us page
            },
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text("Share App"),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              // Share app functionality
            },
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text("Rate Us"),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              // Rate us functionality
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              // Implement logout logic here
            },
          ),
        ],
      ),
    );
  }

}