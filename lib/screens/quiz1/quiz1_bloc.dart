import 'package:flutter/material.dart';
import 'package:questions_app/model/model.dart';

class Quiz1Bloc {
  PageController? pageController = PageController(initialPage: 0);
  bool isPressed = false;
  Color isTrue = Colors.green;
  Color isWrong = Colors.red;
  Color btncolor = const Color.fromARGB(255, 77, 77, 77);
  bool isCorrect = true;
  bool isDisplayingAnswer = true;

  int score = 0;

  List<QuizlModel> ListOfQuestions = [
    QuizlModel(
        question: "15 + 5 = ?",
        answers: {
          "1": false,
          "2": false,
          "20": true,
          "51": false,
        },
        note: ""),
    QuizlModel(
        question: "40 + 21 = ?",
        answers: {
          "61": true,
          "42": false,
          "763": false,
          "16512": false,
        },
        note: ""),
    QuizlModel(
        question: "0 + 0 = ?",
        answers: {
          "51231": false,
          "52141244421": false,
          "21": false,
          "0": true,
        },
        note: ""),
    QuizlModel(
        question: "411 + 200 = ?",
        answers: {
          "92": false,
          "31": false,
          "611": true,
          "1421": false,
        },
        note: "")
  ];
  void scoreMethod(index, i) {
    if (ListOfQuestions[index].answers!.entries.toList()[i].value) {
      score += 1;
    }
  }
}
