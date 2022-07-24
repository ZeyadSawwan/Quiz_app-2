class QuizlModel {
  String question;
  List<String> answers;
  // String note;
  bool answerRuslt;
  String correctAnswer;
  QuizlModel(
      {required this.question,
      required this.answers,
      this.answerRuslt = false,
      required this.correctAnswer});
}
