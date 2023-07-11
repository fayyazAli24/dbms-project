import 'dart:convert';
import 'package:flutter/foundation.dart';
import '../model/userDataModel.dart';
import '../model/userModel.dart';
import 'package:http/http.dart' as http;

class UserServices {
   Future<UserModel> postUser(String name, email, password) async {
    String url = "http://192.168.0.106:5000/api/v1/auth";

    var data = jsonEncode({
      "name": name,
      "email": email,
      "password":password
    });

    var response = await http.post(
        headers: {
          'Content-Type': 'application/json',
        },
        Uri.parse(url), body: data
        );
    // debug mode
    if (kDebugMode) {
      print("Called API: $url");
      print("Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      // print("HEADERS: $header");
    }
    if (response.statusCode == 200) {
      return userModelFromJson(response.body);
    }
    if (response.statusCode == 401) {
      throw Exception('Not Authorized');
    }
    if (response.statusCode == 500) {
      throw Exception('Server Not Responding');
    } else {
      throw Exception('Something Went Wrong');
    }
  }


  static Future<List<UserDataModel>> getUser () async{
     var response = await http.get(Uri.parse("http://192.168.0.106:5000/api/v1/auth"));
     if(response.statusCode == 200){
       var jsonString = response.body;
       print("the response body is "+jsonString.toString());
       return userDataModelFromJson(jsonString);

     }else{
       throw Exception("error occured data not fetched");
     }
   }
}
