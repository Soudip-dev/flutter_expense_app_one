import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return 
            SizedBox(
              width: double.infinity,
              height: 65,
              // color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                left_section(),
                right_section()
              ],),
              )
;
  }
  
  Container right_section() {
    return Container(
                width: 150,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(8)
                ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                Text("This Month",style: TextStyle(fontSize: 15,),),
                Icon(Icons.keyboard_arrow_down,size: 30,)
              ],),
              );
  }

  Container left_section() {
    return Container(
                child: Row(children: [
                  CircleAvatar(
                    // backgroundColor: Colors.red,
                    radius: 30,
                  
                  backgroundImage: AssetImage('assets/images/my_pic.jpg',),
                  
                  ),
                  
                  SizedBox(width: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Morning",style: TextStyle(fontSize: 15,color: Colors.grey.shade600)),
                    Text("Blaszczykowski",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                  ],)
                ],),
              );
  }

}