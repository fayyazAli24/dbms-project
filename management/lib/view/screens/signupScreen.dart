import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:management/contrroller/userController.dart';
import 'package:management/contrroller/userDataController.dart';
import 'package:management/style.dart';
import 'package:management/view/components/customInputField.dart';
import 'package:management/view/mainScreen.dart';

import '../components/myButton.dart';
import 'loginScreen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController idController = TextEditingController();
    UserController userController = Get.put(UserController());
    UserDataController userDataController = Get.put(UserDataController());

    return GetBuilder(
        init: userController,
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Signup Screen"),
              backgroundColor: Colors.deepPurpleAccent,
            ),
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      const Text("SignupScreen",
                          style: TextStyle(
                              fontSize: 27, fontWeight: FontWeight.bold)),
                      const MyInputField(
                          title: "Name", hint: "Please Enter your name"),
                      const MyInputField(
                          title: "Email", hint: "Please Enter your email"),
                      const MyInputField(
                          title: "Password",
                          hint: "Please Enter your password"),
                      const MyInputField(
                          title: "Confirm password",
                          hint: "Please confirm your password"),

                      SizedBox(height: 8,),
                      InkWell(
                        onTap: (){
                          Get.to(LoginScreen());
                        },
                        child: const Text(
                          "Already have an Account click here to Login",

                          style: TextStyle(color: Colors.deepPurpleAccent,fontSize: 16),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MyButton(
                        label: "Sign up",
                        onTap: () {
                          Get.to(const LoginScreen());
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
