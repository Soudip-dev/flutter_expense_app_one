import 'package:expense_monitor_app/all_app_route/all_app_route.dart';
import 'package:expense_monitor_app/bloc/user/bloc/user_bloc_bloc.dart';
import 'package:expense_monitor_app/db/local_db/db_helper.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp( 
    
    MultiBlocProvider(providers: [
      BlocProvider(create: (context) => UserBlocBloc(dbHelper: DbHelper.instance),)

  ], child:  MyApp())
  
  );
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
