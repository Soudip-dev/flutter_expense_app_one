import 'package:expense_monitor_app/all_app_route/all_app_route.dart';
import 'package:expense_monitor_app/utils/app_colors.dart';
import 'package:expense_monitor_app/utils/app_constant.dart';
import 'package:expense_monitor_app/utils/app_fonts.dart';
import 'package:expense_monitor_app/utils/app_specer.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  int appOpenCount = 0;

  @override
  void initState() {

    Future.delayed(Duration(seconds: 3)).then((value) async {
      SharedPreferences pref  = await SharedPreferences.getInstance();
      
      int saveCount =  pref.getInt("app_open_count") ?? 0;
     saveCount++;
     print("saveCount : $saveCount");
    if(saveCount == 20){
      saveCount = 0;
      await pref.setInt("app_open_count", saveCount );
    }

     await pref.setInt("app_open_count", saveCount );
      int isLogin =  pref.getInt(AppConstant.prefUserId) ?? 0;
      print("isLogin : $isLogin");
       if( isLogin != 0  ){
        if(saveCount % 3 == 0){

Navigator.pushReplacementNamed(context, AllAppRoute.initialPageRoute);
        }else{
        Navigator.pushReplacementNamed(context, AllAppRoute.navPageRoute);

        }
       
      }else{
        if(saveCount % 3 == 0){
          Navigator.pushReplacementNamed(context, AllAppRoute.initialPageRoute);
        }else{

        Navigator.pushReplacementNamed(context, AllAppRoute.loginPageRoute);
        }

      }
      
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