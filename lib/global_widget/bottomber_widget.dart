import 'package:expense_monitor_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class BottomberWidget {
  static BottomNavigationBar bottomNavigationBar({
    required int currentIndex,
    required Function(int) onTap,
  }) {
    return

     BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      elevation: 10,
      type: BottomNavigationBarType.shifting,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: Colors.grey.shade700,
     
      items:  [
        BottomNavigationBarItem(
          icon: Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8)
              // ,color: Colors.blue
            ),
            child:  Icon(Icons.home,color: Colors.grey.shade700,size: 28),),
            label: "Home"
          
        ),
        BottomNavigationBarItem(
          icon: Container(
          
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8)
              // ,color: Colors.blue
            ),
            child: Icon(Icons.bar_chart,color: Colors.grey.shade700,size: 28,),),
            label: "Chart"
          
        ),
         BottomNavigationBarItem(
          
          icon: Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8)
              ,color: AppColors.primaryColor
            ),
            child: const Icon(Icons.add),),
            label: "add"
          
        ),
          BottomNavigationBarItem(
          icon: Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8)
              // ,color: Colors.blue
            ),
            child:  Icon(Icons.notification_add,color: Colors.grey.shade700,size: 28),),
            label: "Notification"
          
        ),
        BottomNavigationBarItem(
          icon: Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8)
              // ,color: Colors.blue
            ),
            child:   Icon(Icons.person,color: Colors.grey.shade700,size: 28,),),
            label: "Profile"
          
        ),
      ],
    );
  
  }

}