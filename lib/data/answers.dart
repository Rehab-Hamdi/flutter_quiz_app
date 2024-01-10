import 'package:flutter_quiz_app/data/quiz_questions.dart';

class Answers{
  List<String> userAnswers;
  Answers({required this.userAnswers});

  List<Map<String, String>> getAllQuestionsAndAnswers() {
    List<Map<String, String>> result = [];

    for (int i = 0; i < questions.length; i++) {
      String question = questions[i].question;
      String correctAnswer = questions[i].answers[0];
      String userAnswer = userAnswers[i];

      Map<String, String> questionsAndAnswers = {
        'question': question,
        'correctAnswer': correctAnswer,
        'userAnswer': userAnswer,
      };

      result.add(questionsAndAnswers);
    }

    return result;
  }

}