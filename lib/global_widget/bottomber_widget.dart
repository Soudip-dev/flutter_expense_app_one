import 'package:expense_monitor_app/pages/add_expense_page/add_expense_page.dart';
import 'package:expense_monitor_app/pages/chart_page/chart_page.dart';
import 'package:expense_monitor_app/pages/home_page/home_page.dart';
import 'package:expense_monitor_app/pages/notification_page/notification_page.dart';
import 'package:expense_monitor_app/pages/profile_page/profile_page.dart';
import 'package:expense_monitor_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarWidget  extends StatefulWidget{
  
 
    BottomNavigationBarWidget({
    super.key,
    
    

    });

  @override
  State<BottomNavigationBarWidget> createState() => _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
    List<Widget> pages = [
      HomePage(),
      ChartPage(),
      AddExpensePage(),
      NotificationPage(),
      ProfilePage(),
    ];

    int currentIndex = 0;

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
      
      currentIndex: currentIndex,
      onTap: (value){
        currentIndex = value;
        setState(() {
          
        });
      },
      elevation: 10,
      type: BottomNavigationBarType.fixed,
      selectedItemColor:currentIndex == 2 ? Colors.white :AppColors.primaryColor,
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
            label: "Home",
            
          
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
    )
    );
  }
}