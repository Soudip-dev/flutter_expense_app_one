import 'package:flutter/material.dart';
class AppbarWidget {
  
static AppBar buildAppBar(BuildContext context){
  return AppBar(
        title: Text("Monety"),
        // leading: Icon(Icons.menu),
        actions: [
          // Icon(Icons.menu)
          
          IconButton(onPressed: (){}, icon: Icon(Icons.search,size: 35,)),

        ],
      ) ;
}
}
