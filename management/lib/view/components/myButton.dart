import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String label;
   var onTap;
   MyButton({Key? key, required this.label, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.deepPurpleAccent
        ),
        child: Center(child: Text(label,style: TextStyle(color: Colors.white),)),
      ),
    );
  }
}
