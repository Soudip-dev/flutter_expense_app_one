

import 'package:flutter/material.dart';
class AppbarWidget {
  
static AppBar buildAppBar(BuildContext context, {required Function() onTap,required Widget leadingWidget}){
  return AppBar(
    leading: leadingWidget,
        centerTitle: true,
        title: Text("Monety"),
        // leading: Icon(Icons.menu),
        actions: [
          // Icon(Icons.menu)
          
          IconButton(onPressed: onTap, icon: Icon(Icons.logout,size: 25,),
          
          ),

        ],
      ) ;
}
}
