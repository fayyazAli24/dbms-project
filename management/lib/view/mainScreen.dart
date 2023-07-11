 import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:management/contrroller/notesController.dart';
import 'package:management/style.dart';
import 'package:management/view/components/myButton.dart';
import 'package:management/view/screens/addTaskBar.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  NotesController notesController = Get.put(NotesController());
  DateTime _selectedDate= DateTime.now();
  var notifyHelper;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: [
          _addTaskBar(),
          _addDateBar(),
          SizedBox(height: 10,),
          _showTask()
        ],
      ),
    );
  }

  _addDateBar(){
    return Container(
      margin: EdgeInsets.only(top: 18,left: 18),
      child:DatePicker(
        DateTime.now(),
        height: 100,
        width: 80,
        initialSelectedDate: DateTime.now(),
        selectedTextColor: Colors.white,
        selectionColor: Colors.deepPurpleAccent,
        dateTextStyle:GoogleFonts.lato(
          textStyle:  TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.grey
          ),
        ),
        dayTextStyle:GoogleFonts.lato(
          textStyle:  TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.grey
          ),
        ),
        monthTextStyle:GoogleFonts.lato(
          textStyle:  TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.grey
          ),
        ),
        onDateChange: (date){
          _selectedDate=date;

        },
      ),
    );
  }

  _addTaskBar(){
    return Container(
      margin: EdgeInsets.only(left: 17,right: 17,top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(DateFormat.yMMMM().format(DateTime.now()),style: subHeadingStyle,),
                Text("Today",style: headingStyle,)
              ],
            ),
          ),
          MyButton(label: "+ Add Task",
              onTap:()async {
            await Get.to(TaskPage());

            // call the getList method
          }
          )
        ],
      ),
    );

  }

  _appBar(){
    return AppBar(
      backgroundColor: Colors.deepPurpleAccent,
      title: Text('MainScreen'),
    );
  }

  _showTask(){
    return Expanded(
      child: Obx((){
        return ListView.builder(
          itemCount:notesController.notesList.length ,
          itemBuilder:(_,context){
            return Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: (notesController.notesList.length % 2 == 0)?Colors.deepPurpleAccent:
                (notesController.notesList.length% 3 == 0)?Colors.pink:
                Colors.orange,
                borderRadius: BorderRadius.circular(15)
              ),

              margin: EdgeInsets.only(bottom: 10,left: 5,right: 5),

            );
          }
        );
      })
    );
  }
}
