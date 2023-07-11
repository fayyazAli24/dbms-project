
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../contrroller/SplashController.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    SplashController splashController = Get.put(SplashController());
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(color: Colors.white),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10,),
                Text("DBMS project ",
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 24)
                ),

                SizedBox(height: 5),
                Container(
                    height: 300,
                    width: 300,
                    child: Lottie.asset("assets/images/data.json")),

              ],
            ),
          ),
        ));
  }
}
