import 'package:expense_monitor_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ListItemWidget extends StatelessWidget {
  const ListItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return 
          Container(
            width: double.infinity,
            // height: 235,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade500,width: 0.5),
              // color: Colors.white,
              borderRadius: BorderRadius.circular(10),

            ),
            child: Column(
              children: [
                Container(height: 50,width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Tuesday, 14",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                    Text("-₹1380",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),

                  ],
                ),
                ),
                Divider(color: Colors.grey.shade500,thickness: 0.5,),
                subList_section(),
                SizedBox(height: 10,),
                subList_section(),
                SizedBox(height: 10,),
                subList_section(),
                SizedBox(height: 10,),
                subList_section(),
                

              ],
            ),
          )
         
;
  }
  
  Container subList_section() {
    return Container(height: 75,width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 Container(child: Row(
                  children: [
                    Container(
                      height: 55,
                      width: 55,
                     decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8)
                     ),
                    child: Center(child: Icon(Icons.shopping_cart_checkout),),
                    ),
                    SizedBox(width: 5,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Shop",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                      Text("Buy new clothes",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),)
                    ],
                  )
                  ],
                 ),),
                 Text("-₹90",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: AppColors.primaryColor),)
                ],
              ),
              );
  }

}