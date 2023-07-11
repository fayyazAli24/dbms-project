import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:management/model/userDataModel.dart';
import 'package:management/services/userServices.dart';

class UserDataController extends GetxController{
  @override
  void onInit() {
    // TODO: implement onInit
    getAllUser();
    super.onInit();
  }

    var userDataList = <UserDataModel>[].obs;
    var isLoading = false.obs;
    var check = false.obs;
    var email = "".obs;

    Future<List<UserDataModel>> getAllUser() async{
      isLoading.value = true;
      var result = await UserServices.getUser();
      print("the controller result is "+result.toString());
       userDataList.value =  result;
       return userDataList;
}
}