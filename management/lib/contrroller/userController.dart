import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:management/model/userModel.dart';
import 'package:management/services/userServices.dart';


class UserController extends GetxController {

  var isLoading = true.obs;

  Future<UserModel?> postUser(String name,email,password) async {
    // try {
      isLoading.value = true;
      var result = await UserServices().postUser(name,email,password);
      if (kDebugMode) {
        print("~~~~~~~~~~~~~~~Result~~~~~~~~~~~~~~~~~~~~");
        print("Result: ${result.toJson()}");
      }
      isLoading.value = false;
      return result;
    // } on SocketException {
    //   isLoading.value = false;
    //
    // } on Exception {
    //   isLoading.value = false;
    //
    // } catch (e) {
    //   isLoading.value = false;
    // }
    // return null;
  }

}