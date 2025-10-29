import 'package:expense_monitor_app/all_app_route/all_app_route.dart';
import 'package:expense_monitor_app/pages/home_page/home_page.dart';
import 'package:expense_monitor_app/utils/app_colors.dart';
import 'package:expense_monitor_app/utils/app_fonts.dart';
import 'package:flutter/material.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Text("Easy way to monitor\n your expenses",
             textAlign: TextAlign.center,
             style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
             SizedBox(height: 20,),
             Text("Safe your future by managing your\n expenses right now",
             textAlign: TextAlign.center,
             style: TextStyle(
              fontSize: 15,fontWeight: FontWeight.w400,
              color: Colors.grey,
              ),),

               SizedBox(height: 135,)
        ],),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Monety",style: AppFonts.appBoldFont25(color: Colors.black),),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
        Navigator.pushReplacementNamed(context, AllAppRoute.loginPageRoute);
      }, 
      backgroundColor: AppColors.primaryColor,
      child: Icon(Icons.arrow_forward
      ),),
    );
  }
}