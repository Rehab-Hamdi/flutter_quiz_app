import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/data/answers.dart';
import 'package:flutter_quiz_app/project_screens/start_screen.dart';

class ResultScreen extends StatefulWidget {
  ResultScreen({required this.userAnswers, super.key});
  final List<String> userAnswers;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    var data =
        Answers(userAnswers: widget.userAnswers).getAllQuestionsAndAnswers();
    int i = 1;
    print(widget.userAnswers);
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  'Quiz Completed',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: DataTable(
                    columns: const [
                      DataColumn(
                          label: Text(
                        'Question number',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      DataColumn(
                          label: Text(
                        'Questions',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      DataColumn(
                          label: Text(
                        'Correct Answers',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      DataColumn(
                          label: Text(
                        'Your Answers',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                    ],
                    rows: data.map((e) {
                      return DataRow(cells: [
                        DataCell(Text(
                          (i++).toString(),
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        )),
                        DataCell(Text(e['question']!)),
                        DataCell(Text(e['correctAnswer']!)),
                        DataCell(Text(
                          e['userAnswer']!,
                          style: TextStyle(
                              color: e['correctAnswer']! == e['userAnswer']!
                                  ? Colors.green
                                  : Colors.red),
                        )),
                      ]);
                    }).toList(),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton.icon(
                      // style: ButtonStyle(
                      //   side: MaterialStateProperty.all<BorderSide>(
                      //     BorderSide(
                      //       color: Colors.black,
                      //     ),
                      //   ),
                      // ),
                      icon: Icon(
                        Icons.restart_alt_outlined,
                        color: Colors.green,
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const StartScreen()));
                      },
                      label: const Text(
                        'Restart Quiz',
                        style: TextStyle(color: Colors.green),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        exit(0);
                      },
                      child: const Text(
                        'Exit',
                        style: TextStyle(color: Colors.red),
                      )),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              )
            ],
          ),
        ),
      ),
    );
  }
}
