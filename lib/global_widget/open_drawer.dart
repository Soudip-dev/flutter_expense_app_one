import 'package:expense_monitor_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class OpenDrawer {
  static

  buildDrawer(){
    print("drawer opened");
    return Drawer(
      
        
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.primaryColor
              ),
              accountName: Text("Demo User"), 
              accountEmail: Text("demouser@gmail.com"),
              

              ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
            ),
            ListTile(
              leading: Icon(Icons.category),
              title: Text("Category"),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Setting"),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("About Us"),
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text("Share App"),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text("Rate Us"),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
            ),
          ],
        ),
      
    );
  }


}