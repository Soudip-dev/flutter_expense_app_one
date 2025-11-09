import 'package:expense_monitor_app/all_app_route/all_app_route.dart';
import 'package:expense_monitor_app/bloc/user/bloc/user_bloc_bloc.dart';
import 'package:expense_monitor_app/global_widget/app_eleveted_button.dart';
import 'package:expense_monitor_app/global_widget/app_textfild_widget.dart';
import 'package:expense_monitor_app/model/user_model.dart';
import 'package:expense_monitor_app/utils/app_colors.dart';

import 'package:expense_monitor_app/utils/app_fonts.dart';
import 'package:expense_monitor_app/utils/app_specer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isPassword = true;
  bool isConfirmPassword = true;
  bool isCreatingAccount = false;

  String ontapPasswordValue = "";
  String ontapConfirmPasswordValue = "";
  final _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Account Create Page",style: AppFonts.appBoldFont25(color: Colors.black),),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 15),
        
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey ,
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 160,
                        width: 160,
                        // color: Colors.red,
                        child: UnconstrainedBox(
                          child: Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                              // color: Colors.red,
                              shape: BoxShape.circle,
                              border: Border.all(color: AppColors.grayFontColor,width: 1,
                              ),
                              image: DecorationImage(image: NetworkImage("https://i.postimg.cc/mZnKpVgj/no-profile-icon.png"),fit: BoxFit.cover)
                              ),
                          
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 22,
                        right: 22,
                        child: InkWell(
                          onTap: () {

                          },
                          child: Icon(Icons.image,color: AppColors.primaryColor,size: 30,)),),
                    
                     Positioned(
                        bottom: 22,
                        left: 22,
                        child: InkWell(
                          onTap: () {
                            
                            
                          },
                          
                          child: Icon(Icons.camera_alt,color: AppColors.primaryColor,size: 30,)),)
                    
                    ],
                  ),
                  AppTextfildWidget(
                    hintText: "Enter Your Name",
                     controller: nameController,
                     validator: (value) {
                       if(value == null || value.isEmpty){
                        return "Please Enter Your Name";
                       }else{
                        return null;
                       }
                     }, 
                     isPassword: false,
                     prefixIcon: Icon(Icons.person),
                     keyboardType:   TextInputType.name, ),
                     AppSpecer.hightSpecer(),
                     AppTextfildWidget(
                    hintText: "Enter Valid Email",
                     controller: emailController, 
                     validator: (value){
                       final bool emailValid = RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                  ).hasMatch(value ?? "");

                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  } else if (!emailValid) {
                    return "Please enter a valid email";
                  } else {
                    return null;
                  }
                     },
                     isPassword: false,
                     prefixIcon: Icon(Icons.email),
                     keyboardType:   TextInputType.emailAddress, ),
                     AppSpecer.hightSpecer(),
                     AppTextfildWidget(
                    hintText: "Enter Mobile Number",
                     controller: phoneController,
                     validator: (value){
                        if (value == null || value.isEmpty) {
                    return "Please enter your mobile no";
                  }
                  if (value.length != 10) {
                    return "Please enter a valid mobile no";
                  }
                  return null;
                     }, 
                     isPassword: false,
                     prefixIcon: Icon(Icons.phone),
                     keyboardType:   TextInputType.number, ),
                     AppSpecer.hightSpecer(),
                     StatefulBuilder(
                       builder: (ctx, ss) {
                         return Column(children: [
                           AppTextfildWidget(
                                       hintText: "Enter New Password",
                         controller: passwordController, 
                         validator: (value){
                           final bool passValid = RegExp(
                        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
                      ).hasMatch(value ?? "");

                      if (value == null || value.isEmpty) {
                        return "Please enter your password";
                      } else if (!passValid) {
                        return "Please enter a valid password";
                      } else {
                        return null;
                      }
                         },
                        
                         isPassword: isPassword,
                         prefixIcon: Icon(Icons.lock),
                         onChanged: (value) {
                          
                           ontapPasswordValue = value;
                           ss(() {
                             
                           },);
                         },
                         suffixIcon: InkWell(
                          onTap: (){
                            isPassword = !isPassword;
                            ss(() {
                              
                            },);
                          },
                          child: isPassword ? Icon(Icons.visibility_off) :Icon(Icons.remove_red_eye)),
                         keyboardType:   TextInputType.visiblePassword, ),
                          ontapPasswordValue.isNotEmpty ? Row(
                       children: [
                        
                        
                         Text("Password should be minuim 8 character.\nOne capital letter, One small letter,\nOne number and One special character(eg. ! @ #)"),
                       ],
                     ): SizedBox(),
                         AppSpecer.hightSpecer(),
                        
                         AppTextfildWidget(
                                       hintText: "Enter Confirm Password",
                         controller: confirmPasswordController, 
                          validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please retype your password";
                      } else if (passwordController.text != value) {
                        return "Password does not match";
                      } else {
                        return null;
                      }
                    },
                         isPassword: isConfirmPassword,
                         prefixIcon: Icon(Icons.lock),
                         onChanged: (value) {
                          
                           ontapConfirmPasswordValue = value;
                           ss(() {
                             
                           },);
                         },
                         suffixIcon: InkWell(
                          onTap: (){
                            isConfirmPassword = !isConfirmPassword;
                            ss(() {
                              
                            },);
                          },
                          child: isConfirmPassword ? Icon(Icons.visibility_off) :Icon(Icons.remove_red_eye)),
                         keyboardType:   TextInputType.visiblePassword, ),
                          ontapPasswordValue == ontapConfirmPasswordValue && ontapConfirmPasswordValue.isNotEmpty ? Row(
                       children: [
                        
                         
                         Text("Password Matched Successfully...",style: TextStyle(color: Colors.green),),
                       ],
                     ): SizedBox(),
                        
                        
                        
                        
                     
                         ],);
                       }
                     ),
                    
                   
                     AppSpecer.hightSpecer(),
                     Column(children: [
                      BlocConsumer< UserBlocBloc, UserBlocState>(
                        
                       listener: (context, state) {
                         if(state is UserLoadingState){
                          isCreatingAccount = true;
                  
                    Container(height: double.infinity,
                    width: double.infinity,
                    color: Colors.black12,
                    child: Column(children: [
                      CircularProgressIndicator(
                      color: AppColors.primaryColor,
                      strokeWidth: 2,
                      
                    ),
                    AppSpecer.hightSpecer(20),
                    Text("Please Wait...")
                    ],),
                    
                    );
                  }
                  if(state is UserSuccessState ){
                    isCreatingAccount = false;
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.green,
                        content: Text("Account Created Successfully..."))
                    );
                    

                  }
                  if(state is UserErrorState){
                    isCreatingAccount = false;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Text("Something went wrong..."))
                    );
                    
                      
                    }
                      },
                      builder: (context, state) {
                        return  AppElevetedButton(text: isCreatingAccount ? "Creating Account...": "Sign Up",
                        onPressed: 
                       isCreatingAccount ? null :   (){
                        if(_formKey.currentState!.validate()){
                          context.read<UserBlocBloc>().add(
                           AddUserEvent(mUser: UserModel(
                            name: nameController.text,
                            email: emailController.text,
                            mobileNo: phoneController.text,
                            password: passwordController.text,
                            createdAt: DateTime.now().millisecondsSinceEpoch.toString(),
                            imageUrl: "https://i.postimg.cc/mZnKpVgj/no-profile-icon.png"
                           ))
                          );
                          
                        }
                        // Navigator.pushReplacementNamed(context, AllAppRoute.loginPageRoute);
                        
                      }
                      );
                      },
                      
                      ),
                     
                      AppSpecer.hightSpecer(50),
                      // /////////////////////////////////////////////////////////////////////////
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
               Text("Already have an account?",style: AppFonts.appNormalFont25(color: Colors.black,fontSize: 15),),
               AppSpecer.widthSpecer(5),
               InkWell(
                onTap: (){
                  
                  Navigator.pushNamed(context, AllAppRoute.loginPageRoute);
                },
                child: Text("Login",style: AppFonts.appBoldFont25(color: Colors.blue,fontSize: 15),))
                    ],),
                   
                     ],)
              
              ],),
           
           
            ),
          ),
        ),
      ),
    );
  }
}