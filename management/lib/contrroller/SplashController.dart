import 'dart:async';


import 'package:get/get.dart';
import 'package:management/view/screens/loginScreen.dart';


class SplashController extends GetxController{

  splashMethod() {
    Timer(Duration(seconds: 4), () {
      Get.to(LoginScreen());
    });
  }
  @override
  void onInit() {
splashMethod();
super.onInit();
  }
}