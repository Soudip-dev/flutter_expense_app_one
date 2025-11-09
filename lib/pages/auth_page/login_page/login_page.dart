import 'package:expense_monitor_app/all_app_route/all_app_route.dart';
import 'package:expense_monitor_app/bloc/user/bloc/user_bloc_bloc.dart';
import 'package:expense_monitor_app/global_widget/app_eleveted_button.dart';
import 'package:expense_monitor_app/global_widget/app_textfild_widget.dart';
import 'package:expense_monitor_app/utils/app_colors.dart';
import 'package:expense_monitor_app/utils/app_fonts.dart';
import 'package:expense_monitor_app/utils/app_specer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
   LoginPage({super.key});
 
 TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPassword = true;
  bool isLogin = false;
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Loign Page",style: AppFonts.appBoldFont25(color: Colors.black),),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 15),
        
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              AppTextfildWidget(
                hintText: "Enter Email",
                 controller: emailController, 
                  validator: (value) {
                         if(value == null || value.isEmpty){
                          return "Please Enter Your Name";
                         }else{
                          return null;
                         }
                       }, 
                 isPassword: false,
                 prefixIcon: Icon(Icons.email),
                 keyboardType:   TextInputType.emailAddress, ),
                 AppSpecer.hightSpecer(),
                 StatefulBuilder(
                   builder: (context, ss) {
                     return AppTextfildWidget(
                                   hintText: "Enter Password",
                     controller: passwordController, 
                      validator: (value) {
                         if(value == null || value.isEmpty){
                          return "Please Enter Valid Password";
                         }else{
                          return null;
                         }
                       }, 
                     isPassword: isPassword,
                     suffixIcon: InkWell(
                      onTap: (){
                        isPassword = !isPassword;
                        ss(() {
                          
                        },);
                      },
                      child: isPassword ? Icon(Icons.visibility_off): Icon(Icons.remove_red_eye)),
                     prefixIcon: Icon(Icons.lock),
                     keyboardType:   TextInputType.visiblePassword, );
                   }
                 ),
                 AppSpecer.hightSpecer(),
                 Column(children: [
                  BlocConsumer<UserBlocBloc, UserBlocState>(
                      listenWhen: (prev, curr){
                      return isLogin;
                      },
                      buildWhen: (prev, curr){
                      return isLogin;
                      },
                     listener: (context, state) {
                    if( state is UserLoadingState){
                      isLoading = true;

                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: Colors.black12,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(
                              color: AppColors.primaryColor,
                              strokeWidth: 2,
                            ),
                            AppSpecer.hightSpecer(20),
                            Text("Please Wait...")

                        ],),
                      );

                    }
                    if(state is UserSuccessState){
                       isLoading = false;
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("Logged-in successfully!!"), backgroundColor: Colors.green,));
                    
                     
                        Navigator.pushReplacementNamed(context, AllAppRoute.homePageRoute);

                    }
                    if(state is UserErrorState){
                      isLoading = false;
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.errMessage),
                     backgroundColor: Colors.red,),
                     );
                    

                    }
                  },builder: (context, state) {
                    return  AppElevetedButton(text: "Login", onPressed:isLoading ? null :(){
                    if(_formKey.currentState!.validate()){
                      isLogin = true;
                      context.read<UserBlocBloc>().add(LoginUserEvent(
                        userEmail: emailController.text,
                         userPassword: passwordController.text
                         ));
                      
                  
                    }
                  });
                  },),
                 
                  AppSpecer.hightSpecer(50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
             Text("Don't have an account?",style: AppFonts.appNormalFont25(color: Colors.black,fontSize: 15),),
             AppSpecer.widthSpecer(5),
             InkWell(
              onTap: (){
                isLogin = false;
                Navigator.pushNamed(context, AllAppRoute.signupPageRoute);
              },
              child: Text("Create Account",style: AppFonts.appBoldFont25(color: Colors.blue,fontSize: 15),))
                  ],),
                 
                  // AppElevetedButton(text: "Signup", onPressed: (){
                    
                  // })
                 ],)
          
          ],),
        ),
      ),
    );
  }
}