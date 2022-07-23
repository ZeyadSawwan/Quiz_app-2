import 'dart:ffi';

class ResultBloc {
  String calculateThePercentageOfCorrectAnswers(ListOfQuestions, score) {
    return (score / ListOfQuestions.length * 100).toString();
  }
}
