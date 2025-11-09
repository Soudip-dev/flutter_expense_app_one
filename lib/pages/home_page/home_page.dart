
import 'package:expense_monitor_app/all_app_route/all_app_route.dart';
import 'package:expense_monitor_app/global_widget/app_alert_dialog.dart';
import 'package:expense_monitor_app/global_widget/app_drawer.dart';
import 'package:expense_monitor_app/global_widget/appbar_widget.dart';
import 'package:expense_monitor_app/global_widget/bottomber_widget.dart';
import 'package:expense_monitor_app/global_widget/open_drawer.dart';
import 'package:expense_monitor_app/pages/home_page/home_page_widget/exp_total_widget.dart';
import 'package:expense_monitor_app/pages/home_page/home_page_widget/header_widget.dart';
import 'package:expense_monitor_app/pages/home_page/home_page_widget/list_item_widget.dart';


import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SizedBox spacer([double height = 20])=> SizedBox(height: height,) ;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget.buildAppBar(context,
     leadingWidget: Builder(
       builder: (context) {
         return IconButton(onPressed: (){
          Scaffold.of(context).openDrawer();
         }, icon: Icon(Icons.menu));
       }
     ),
      
      
      onTap: ()async {
        
        
        AppAlertDialog.showConfirmationDialog(
          context: context, 
          title: "Logout",
          content: "Are you sure you want to logout?",
          onConfirm: ()async{
            SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.clear();
        
        Navigator.pushNamedAndRemoveUntil(context, AllAppRoute.loginPageRoute, (route) => false);
        

          },
          confirmText: "Yes",
          cancelText: "No",
          
          
          );

      },) ,
      drawer:OpenDrawer.buildDrawer(),
      bottomNavigationBar: BottomNavigationBarWidget(currentIndex: index , onTap: (value){
        setState(() {
          index = value;
        });
      }),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        // color: Colors.amber,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              spacer(8),
            HeaderWidget(),
            spacer(),
            ExpTotalWidget(),
            spacer(),
            Text("Expense List",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            spacer(),
            ListItemWidget(),
            spacer(),
            ListItemWidget(),
            spacer(),
            ListItemWidget(),
            spacer(),
            ],),
          ),
        ),

      ),
    );
  }


}