import 'package:flutter/foundation.dart';
import 'package:get/get.dart%20';
import 'package:management/model/notesDataModel.dart';
import 'package:management/model/notesDeleteModel.dart';
import 'package:management/model/notesPostModel.dart';

import '../services/userServices.dart';

class NotesController extends GetxController{
  @override
  void onInit() {
    // TODO: implement onInit
    getNotesData();
    super.onInit();
  }
  var notesList = [1,3,4,5,6,7].obs;
  var isLoading = true.obs;
  var error= true.obs;
  var notesDataList =<NotesDataModel> [].obs;
  var deleteNotesError = true.obs;

  //post notes to the database
  Future<NotesModel?> postNotes(String email,notes,start,end,date,reminder,repeat) async {
    // try {
    isLoading.value = true;
    var result = await UserServices().postNotes( email,notes,start,end,date,reminder,repeat);
    if (kDebugMode) {
      print("~~~~~~~~~~~~~~~Result~~~~~~~~~~~~~~~~~~~~");
      print("Result: ${result.toJson()}");

    }
    error.value = result.error;
    isLoading.value = false;
    return result;
  }


  // delete notes from the database
  Future<NotesDeleteDataModel?> deleteNote(int id) async {
    isLoading.value = true;
    var result = await UserServices().deleteNote(id);
    if (kDebugMode) {
      print("~~~~~~~~~~~~~~~Result~~~~~~~~~~~~~~~~~~~~");
      print("Result: ${result.toJson()}");
    }
    deleteNotesError.value = result.error;
    isLoading.value = false;
    return result;
  }

  //get notes from database
  Future<List<NotesDataModel>> getNotesData() async{
    isLoading.value = true;
    var result = await UserServices.getNotesData();
    notesDataList.value = result;
    isLoading.value = false;
    return notesDataList;
  }



}