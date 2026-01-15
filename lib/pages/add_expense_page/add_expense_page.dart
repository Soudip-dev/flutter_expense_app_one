import 'dart:math';

import 'package:expense_monitor_app/all_app_route/all_app_route.dart';
import 'package:expense_monitor_app/global_widget/app_dropdown_menu.dart';
import 'package:expense_monitor_app/global_widget/app_eleveted_button.dart';
import 'package:expense_monitor_app/global_widget/app_textfild_widget.dart';
import 'package:expense_monitor_app/model/expense_model.dart';
import 'package:expense_monitor_app/pages/add_expense_page/bloc/bloc/expanse_bloc.dart';
import 'package:expense_monitor_app/utils/app_colors.dart';
import 'package:expense_monitor_app/utils/app_constant.dart';
import 'package:expense_monitor_app/utils/app_specer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AddExpensePage extends StatefulWidget {
   AddExpensePage({super.key});

  @override
  State<AddExpensePage> createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
  TextEditingController titleController = TextEditingController();

  TextEditingController discriptionController = TextEditingController();

  TextEditingController amountController = TextEditingController();

  TextEditingController categoryController = TextEditingController();

  List filteredCategoryList = [];
  String selectedCategory = AppConstant.imgAppLogoSolid;
  int selectedCategoryId = 0;

  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  DateTime? selectedDateTime;
  DateFormat df = DateFormat();
  dynamic selectedExpenseType = AppConstant.dbCr[0];


 GlobalKey<FormState> _fromKey = GlobalKey<FormState>();


  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Expense'),
        centerTitle: true,
      ),
      body:Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Form(
            key: _fromKey,
            child: Column(children: [
              AppSpecer.hightSpecer(),
              AppTextfildWidget(
                hintText: "Enter Title",
                controller: titleController,
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return "Please Enter Valid Title";
                  }else{
                    return null;
                  }
                },
                isPassword: false,
                prefixIcon: Icon(Icons.title),
                keyboardType: TextInputType.text,
              ),
              AppSpecer.hightSpecer(),
              AppTextfildWidget(
                hintText: "Enter Discription",
                controller: discriptionController,
                validator: (value) {
                   if(value == null || value.isEmpty){
                    return "Please Enter Discription";
                  }else{
                    return null;
                  }
            
                },
                isPassword: false,
                prefixIcon: Icon(Icons.description),
                keyboardType: TextInputType.text,
              ),
              AppSpecer.hightSpecer(),
              AppTextfildWidget(
                hintText: "Enter Amount",
                controller: amountController,
                validator: (value) {
                   if(value == null || value.isEmpty){
                    return "Please Enter Amount";
                  }else{
                    return null;
                  }
            
                },
                isPassword: false,
                prefixIcon: Icon(Icons.money),
                keyboardType: TextInputType.number,
              ),
              AppSpecer.hightSpecer(),
              Row(children: [
                Container(
                  width: MediaQuery.of(context).size.width *0.4,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38),
                  borderRadius: BorderRadius.circular(10)
                ),
                child:  AppDropdownMenu.buildDropDownMenu(hint: "Expense Type", items: AppConstant.dbCr.map((ele){
                return DropdownMenuItem(child: Text(ele),value: ele,);
              }).toList(), onChanged: (value){
                selectedExpenseType = value!;
                print(value);
              }),
              ),
              AppSpecer.widthSpecer(10),
                 Expanded(
                   child: StatefulBuilder(
                                 builder: (context, ss) {
                    return OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        minimumSize: Size(double.infinity, 55),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () async{
                        selectedDate = await showDatePicker(
                            context: context,
                            firstDate: DateTime.now().subtract(Duration(days: 365)),
                            lastDate: DateTime.now());
                   
                        selectedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute)
                        );
                   
                        DateTime userDate = selectedDate ?? DateTime.now();
                        TimeOfDay userTime = selectedTime ?? TimeOfDay.now();
                        selectedDateTime = DateTime(userDate.year, userDate.month, userDate.day, userTime.hour, userTime.minute);
                   
                   
                        ss((){});
                      },
                      child: Text(df.format(selectedDateTime ?? DateTime.now())),
                    );
                                 }
                               ),
                 ),
              ]),
              
             
              AppSpecer.hightSpecer(),
              Row(children: [
                 Expanded(
                   child: AppTextfildWidget(
                               isReadOnly: true,
                               hintText: "Select Category",
                               controller: categoryController,
                               validator: (value) {
                     if(value == null || value.isEmpty){
                      return "Please Enter Category";
                    }else{
                      return null;
                    }
                   
                               },
                                          
                               onTap: () {
                    showBottomSheet(context: context, builder: (context) {
                      return Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)
                          )
                        ),
                        child: ListWheelScrollView(itemExtent: 70, children: [
                          
                          
                          ...AppConstant.categoryList.map((e) {
                            
                            
                           
                            return InkWell(
                              onTap: () {
                                categoryController.text = e.categoryName!;
                                selectedCategory = e.categoryImage!;
                                selectedCategoryId = e.categoryId!;
                                filteredCategoryList.add(selectedCategoryId);
                                print(filteredCategoryList);
                                Navigator.pop(context);
                              // filteredCategoryList.contains(e) ? null : filteredCategoryList.add(e);
                             
                                
                                setState(() {
                                  
                                });
                              },
                              child: Container(
                              
                              width: 180,
                              // color: Colors.red,
                              child: Row(children: [
                                Container(
                                  height: 55,
                                  width: 55,
                               decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage(e.categoryImage!))
                               
                               ),
                                ),
                                AppSpecer.widthSpecer(),
                                Text(e.categoryName!)
                                               
                              ],),
                                                      ),
                            );
                          },),
                   
                        ]),
                        
                      );
                    });
                               },
                               isPassword: false,
                               prefixIcon: Icon(Icons.category),
                               keyboardType: TextInputType.text,
                             ),
                 ),
              AppSpecer.widthSpecer(10),
              Container(height: 65,width: 65, decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.primaryColor,
                image: DecorationImage(image: AssetImage(selectedCategory) ) 
              ),)
              ],),
             
              // AppTextfildWidget(),
              AppSpecer.hightSpecer(),
              // Wrap(children: [
                
              // ...filteredCategoryList.map((ele){
              // //  var duplicate =filteredCategoryList.contains(ele);
              //   return Stack(
              //     children: [
              //       Container(
              //         padding: EdgeInsets.all(10),
              //         margin: EdgeInsets.only(right: 10),
              //         decoration: BoxDecoration(
              //           border: Border.all(
              //             color: AppColors.primaryColor
              //           ),
              //           borderRadius: BorderRadius.circular(3
              //           )
              //         ),
              //         child:  Text(ele.categoryName) ),
              //         Positioned(child: InkWell
                      
              //         (
              //           onTap: (){
              //             filteredCategoryList.remove(ele);
              //              filteredCategoryList.isEmpty ? categoryController.text = "Select Category" : null;
              //              selectedCategory = AppConstant.imgAppLogoSolid;
              //             setState(() {
                            
              //             });
              //           },
                        
              //           child: Icon(Icons.close,color: AppColors.primaryColor,size: 15,))),
              //     ],
              //   );
              // })
              // ],),
              
              AppSpecer.hightSpecer(),
              BlocListener<ExpanseBloc, ExpanseState>(
                  listener: (context, state) {
                if(state is ExpanseError){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.errorMessage),
                      backgroundColor: Colors.red,
                    ),
                  );
                }

                if(state is ExpanseLoaded){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Expense added successfully!!"),
                      backgroundColor: Colors.green,
                    ),
                  );
                  // Navigator.pop(context);
                  Navigator.pushNamed(context, AllAppRoute.navPageRoute);
                }
              },

                
                
              child:  AppElevetedButton(
                text: "Add Expense",
                onPressed: (){
                 
                  if(_fromKey.currentState!.validate()){
                
                   BlocProvider.of<ExpanseBloc>(context).add(AddExpanseEvent(expenseModel: ExpenseModel(
                      title: titleController.text,
                      desc: discriptionController.text,
                      amt: double.parse(amountController.text),
                      bal: 0.0,
                      expType: selectedExpenseType == AppConstant.dbCr[0] ? 1 : 2,
                      catId: selectedCategoryId,
                      createdAt: (selectedDateTime ?? DateTime.now()).millisecondsSinceEpoch,
                    )));

                    
                    
                  }
                   
                },
              ),)
             
              
            ],),
          ),
        ),
      ),
      ),
    );
  }
}