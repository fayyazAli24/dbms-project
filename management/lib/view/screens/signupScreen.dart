import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:management/contrroller/userController.dart';
import 'package:management/contrroller/userDataController.dart';
import 'package:management/style.dart';
import 'package:management/view/components/customInputField.dart';
import 'package:management/view/screens/mainScreen.dart';

import '../components/myButton.dart';
import 'loginScreen.dart';

class SignupScreen extends StatefulWidget {
   SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {


    UserController userController = Get.put(UserController());
    UserDataController userDataController = Get.put(UserDataController());
    var check = false;

    return GetBuilder(
        init: userController,
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Signup Screen"),
              backgroundColor: Colors.deepPurpleAccent,
            ),
            body: SingleChildScrollView(
              child: SafeArea(
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
                         MyInputField(
                            title: "Name", hint: "Please Enter your name",controller: nameController,),
                         MyInputField(
                            title: "Email", hint: "Please Enter your email",controller: emailController,),
                         MyInputField(
                            title: "Password",
                            hint: "Please Enter your password",controller: passwordController,),
                         MyInputField(
                            title: "Confirm password",
                            hint: "Please confirm your password",controller: confirmpasswordController,),

                        SizedBox(height: 10,),
                        InkWell(
                          onTap: (){
                            Get.to(LoginScreen());
                          },
                          child: RichText(
                            text: const TextSpan(
                              text: 'Already have an account? ',
                              style:TextStyle(fontSize: 16,color: Colors.blueGrey),
                              children: <TextSpan>[
                                TextSpan(text: 'click here to Login', style: TextStyle(fontSize: 16,color: Colors.deepPurpleAccent)),

                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                           MyButton(
                            label: "Sign up",
                            onTap: () {
                              userDataController.getAllUser();
                              for(int i=0;i<userDataController.userDataList.length;i++){
                                if(userDataController.userDataList[i].email == emailController.text){
                                  setState(() {
                                    check = true;
                                  });
                                  Get.snackbar("No Duplicate", "please enter another!",
                                      colorText: Colors.white,
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor: Colors.redAccent,
                                      icon: Icon(Icons.warning_amber_rounded)
                                  );
                                }
                              }
                              if(check == false){
                                _validate();
                                userController.postUser(nameController.text, emailController.text, passwordController.text);
                              }
                              // print("the user data list is "+userDataController.userDataList.length.toString());
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

  _validate(){
    if(nameController.text.isNotEmpty && emailController.text.isNotEmpty && passwordController.text.isNotEmpty && confirmpasswordController.text.isNotEmpty
    && passwordController.text == confirmpasswordController.text
    ) {
      Get.snackbar("Successfull", "Sign up successfully now you can login !",
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          icon: Icon(Icons.check, color: Colors.white,)
      );
    }
      if(passwordController.text != confirmpasswordController.text &&
          nameController.text.isNotEmpty && emailController.text.isNotEmpty && passwordController.text.isNotEmpty && confirmpasswordController.text.isNotEmpty
      ){
        Get.snackbar("Not Equal", "please enter same password !",
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent,
            icon: Icon(Icons.warning_amber_rounded)
        );
      }
    else if(nameController.text.isEmpty || emailController.text.isEmpty || passwordController.text.isEmpty || confirmpasswordController.text.isEmpty){
      Get.snackbar("Required", "All fields are required !",
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          icon: Icon(Icons.warning_amber_rounded)
      );

    }
  }
}
