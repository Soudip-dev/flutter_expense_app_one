import 'package:expense_monitor_app/all_app_route/all_app_route.dart';
import 'package:expense_monitor_app/utils/app_colors.dart';
import 'package:expense_monitor_app/utils/app_fonts.dart';
import 'package:expense_monitor_app/utils/app_specer.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.pushReplacementNamed(context, AllAppRoute.initialPageRoute);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: AppColors.primaryColor,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/icons/ic_app_logo.png",height: 180,width: 180,),
            AppSpecer.hightSpecer(),
          Text("Welcome To Expenso",style: AppFonts.appBoldFont25(color: Colors.white,fontSize: 35),),
        ],)
      ),
    );
  }
}