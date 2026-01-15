
import 'package:expense_monitor_app/global_widget/bottomber_widget.dart';
import 'package:expense_monitor_app/pages/add_expense_page/add_expense_page.dart';
import 'package:expense_monitor_app/pages/auth_page/login_page/login_page.dart';
import 'package:expense_monitor_app/pages/auth_page/signup_page/signup_page.dart';
import 'package:expense_monitor_app/pages/chart_page/chart_page.dart';
import 'package:expense_monitor_app/pages/home_page/home_page.dart';
import 'package:expense_monitor_app/pages/initial_page/initial_page.dart';
import 'package:expense_monitor_app/pages/notification_page/notification_page.dart';
import 'package:expense_monitor_app/pages/profile_page/profile_page.dart';
import 'package:expense_monitor_app/pages/splash_page/splash_page.dart';
import 'package:flutter/material.dart';

class AllAppRoute {
  static const String splashPageRoute = '/';
  static const String initialPageRoute = '/initialPage';
  static const String homePageRoute = '/homePage';
  static const String loginPageRoute = '/loginPage';
  static const String signupPageRoute = '/signupPage';
  static const String addExpensePageRoute = '/addExpensePage';
  static const String chartPageRoute = '/chartPage';
  static const String notificationPageRoute = '/notificationPage';
  static const String profilePageRoute = '/profilePage';
  static const String navPageRoute = '/navPage';
  
  
  

  
  
  static Map<String, WidgetBuilder> routes = {
    splashPageRoute: (context) => const SplashPage(),
    initialPageRoute: (context) => const InitialPage(),
    homePageRoute: (context) => const HomePage(),
    loginPageRoute: (context) =>  LoginPage(),
    signupPageRoute: (context) => const SignupPage(),
    addExpensePageRoute: (context) =>  AddExpensePage(),
    chartPageRoute: (context) => const ChartPage(),
    notificationPageRoute: (context) => const NotificationPage(),
    profilePageRoute: (context) => const ProfilePage(),
    navPageRoute: (context) =>  BottomNavigationBarWidget(),
    
    
  };



}