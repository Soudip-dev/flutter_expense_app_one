import 'package:expense_monitor_app/all_app_route/all_app_route.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData( colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: AllAppRoute.splashPageRoute,
      routes: AllAppRoute.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
