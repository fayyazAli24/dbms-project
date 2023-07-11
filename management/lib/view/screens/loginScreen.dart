import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:management/contrroller/userController.dart';
import 'package:management/contrroller/userDataController.dart';
import 'package:management/style.dart';
import 'package:management/view/components/customInputField.dart';
import 'package:management/view/screens/mainScreen.dart';
import 'package:management/view/screens/signupScreen.dart';

import '../components/myButton.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var checkEmail = false;
    var checkPass = false;
    UserController userController = Get.put(UserController());
    UserDataController userDataController = Get.put(UserDataController());

    return GetBuilder(
        init: userController,
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Login Screen"),
              backgroundColor: Colors.deepPurpleAccent,
            ),
            body: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        const Text("Login Screen",
                            style: TextStyle(
                                fontSize: 27, fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 25,
                        ),
                        MyInputField(
                          title: "Email",
                          hint: "Please Enter your email",
                          controller: emailController,
                        ),
                        MyInputField(
                          title: "Password",
                          hint: "Please Enter your password",
                          controller: passwordController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(SignupScreen());
                          },
                          child: RichText(
                            text: const TextSpan(
                              text: 'Dont have an account? ',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.blueGrey),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'click here to Sign up',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.deepPurpleAccent)),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        MyButton(
                          label: "Login",
                          onTap: () {
                            for (int i = 0;
                                i < userDataController.userDataList.length;
                                i++) {
                              if (userDataController.userDataList[i].email ==
                                  emailController.text) {

                                setState(() {
                                  checkEmail = true;
                                });
                              }
                              if(userDataController.userDataList[i].password == passwordController.text){
                                setState(() {
                                  checkPass = true;
                                });
                              }
                            }

                            if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty && checkEmail == true && checkPass == true) {
                              userDataController.email.value = emailController.text;
                              // print("the email is "+userDataController.email.value.toString());
                              Get.snackbar("Successfull", "Login Successfull!",
                                  colorText: Colors.white,
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.green,
                                  icon: const Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  ));
                              Get.to(MainScreen());
                            }
                            else if (passwordController.text.isEmpty ||
                                emailController.text.isEmpty) {
                              Get.snackbar(
                                  "Required", "All fields are required !",
                                  colorText: Colors.white,
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.redAccent,
                                  icon: Icon(Icons.warning_amber_rounded));
                            }else{
                              Get.snackbar(
                                  "Invalid", "Invalid credentials  !",
                                  colorText: Colors.white,
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.redAccent,
                                  icon: Icon(Icons.warning_amber_rounded));

                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  _validate() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      Get.snackbar("Successfully", "Login Successfully!",
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          icon: const Icon(
            Icons.check,
            color: Colors.white,
          ));
    } else if (passwordController.text.isEmpty ||
        emailController.text.isEmpty) {
      Get.snackbar("Required", "All fields are required !",
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          icon: const Icon(Icons.warning_amber_rounded));
    }
  }
}
