class QuizModel {
  final String question;
  final List<String> answers;

  QuizModel({required this.question, required this.answers});

  // i will made a function to change the arrangement of questions each time
  // i use word get to use function name without ()
  List<String> get shuffleTheAnswer {
    List<String> shuffledAnswers = List.of(answers);
    shuffledAnswers.shuffle();
    return shuffledAnswers;
  }
}
