import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/custom%20widgets/answer_button.dart';
import 'package:flutter_quiz_app/data/quiz_questions.dart';
import 'package:flutter_quiz_app/project_screens/result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int current_question_index=0;
  List<String> userAnswers=[];
  @override
  Widget build(BuildContext context) {
    final current_quiz_question = questions[current_question_index];
    return SafeArea(
        child: Scaffold(
            body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            current_quiz_question.question,
            style: TextStyle(
                color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.035,
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...current_quiz_question.shuffleTheAnswer.map((e) {
                  return AnswerButton(txt: e, onPressedFfunction: (){
                    userAnswers.add(e);
                    if(userAnswers.length== questions.length)
                      {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ResultScreen(userAnswers: userAnswers,)));
                      }
                    else {
                      setState(() {
                      current_question_index++;
                    });
                    }
                  });
                })
              ],
            ),
          ),
        ],
      ),
    )));
  }
}
