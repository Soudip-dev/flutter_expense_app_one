import 'package:expense_monitor_app/global_widget/color_grident.dart';
import 'package:flutter/material.dart';

class ExpTotalWidget extends StatelessWidget {
  const ExpTotalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return 
          Container(
            width: double.infinity,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 25),
            decoration: BoxDecoration(
              // color: ColorGrident.primaryGradient,
              gradient: ColorGrident.primaryGradient,
              borderRadius: BorderRadius.circular(10),
            
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text('Expense Total'),
              Text('₹3,734',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Row(children: [
                Container(
                  width: 60,
                  height: 25,
                  
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(5),
                    
                  
                  ),
                  child: Center(
                    child: Text("+₹240 ",style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.w500),),
                  ),
                )
                ,SizedBox(width: 10,),
                Text("than last month",style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.w400))
              
              ],)
              
            ],),
          )
         
;
  }
}