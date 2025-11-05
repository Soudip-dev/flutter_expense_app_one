
import 'package:expense_monitor_app/global_widget/open_drawer.dart';
import 'package:flutter/material.dart';
class AppbarWidget {
  
static AppBar buildAppBar(BuildContext context){
  return AppBar(
    leading: IconButton(onPressed: (){
      Scaffold.of(context).openDrawer();
        
    }, icon: Icon(Icons.menu)),
        centerTitle: true,
        title: Text("Monety"),
        // leading: Icon(Icons.menu),
        actions: [
          // Icon(Icons.menu)
          
          IconButton(onPressed: (){

          }, icon: Icon(Icons.search,size: 35,),
          
          ),

        ],
      ) ;
}
}
