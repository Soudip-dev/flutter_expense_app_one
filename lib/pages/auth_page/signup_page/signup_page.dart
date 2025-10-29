import 'package:expense_monitor_app/all_app_route/all_app_route.dart';
import 'package:expense_monitor_app/global_widget/app_eleveted_button.dart';
import 'package:expense_monitor_app/global_widget/app_textfild_widget.dart';
import 'package:expense_monitor_app/utils/app_fonts.dart';
import 'package:expense_monitor_app/utils/app_specer.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Signup Page",style: AppFonts.appBoldFont25(color: Colors.black),),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 15),
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            AppTextfildWidget(
              hintText: "Enter Email",
               controller: emailController, 
               keyboardType:   TextInputType.emailAddress, ),
               AppSpecer.hightSpecer(),
               AppTextfildWidget(
              hintText: "Enter Password",
               controller: passwordController, 
               keyboardType:   TextInputType.visiblePassword, ),
               AppSpecer.hightSpecer(),
               Column(children: [
                AppElevetedButton(text: "Signup", onPressed: (){
                  Navigator.pushReplacementNamed(context, AllAppRoute.loginPageRoute);
                }),
                AppSpecer.hightSpecer(),
                AppElevetedButton(text: "Login", onPressed: (){
                  Navigator.pushReplacementNamed(context, AllAppRoute.loginPageRoute);
                })
               ],)

        ],),
      ),
    );
  }
}