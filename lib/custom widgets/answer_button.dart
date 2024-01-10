import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
   AnswerButton({required this.txt,required this.onPressedFfunction , super.key});
  final String txt;
  dynamic onPressedFfunction;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0) ,
      padding: const EdgeInsets.all(6.0),
      child: ElevatedButton(
          onPressed:onPressedFfunction,
          style: ElevatedButton.styleFrom(foregroundColor: Colors.blueAccent),
          child: Text(
            txt,
            style: const TextStyle(color: Colors.black,fontSize: 15),
          )),
    );
  }
}
