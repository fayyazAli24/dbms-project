import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:management/contrroller/userController.dart';
import 'package:management/contrroller/userDataController.dart';
import 'package:management/style.dart';
import 'package:management/view/components/customInputField.dart';
import 'package:management/view/mainScreen.dart';

import '../components/myButton.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    UserController userController = Get.put(UserController());
    UserDataController userDataController = Get.put(UserDataController());



    return GetBuilder(
        init:  userController,
        builder: (_){
          return Scaffold(
            appBar: AppBar(
              title: Text("Login Screen"),
              backgroundColor: Colors.deepPurpleAccent,
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 40,),
                      Text("Login Screen",style:TextStyle(fontSize: 27,fontWeight: FontWeight.bold)),
                      SizedBox(height: 25,),
                      MyInputField(title: "Email", hint: "Please Enter your email"),
                      MyInputField(title: "Password", hint: "Please Enter your password"),
                      SizedBox(height: 8,),

                      InkWell(
                        onTap:(){

                        },
                        child:  const Text(
                          "Dont have an account?  click here to Signup ",

                          style: TextStyle(color: Colors.deepPurpleAccent,fontSize: 16),
                        ),
                      ),
                      SizedBox(height: 20,),

                      MyButton(label: "Sign up",onTap: (){
                        Get.to(MainScreen());
                      },)
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}





