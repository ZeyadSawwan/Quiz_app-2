import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:questions_app/screens/quiz1/quiz1_bloc.dart';
import 'package:questions_app/screens/result/result_screen.dart';

class Quiz1Screen extends StatefulWidget {
  Quiz1Screen({Key? key}) : super(key: key);
  static const screenRoute = 'quiz1';

  @override
  State<Quiz1Screen> createState() => _Quiz2ScreenState();
}

var bloc = Quiz1Bloc();

class _Quiz2ScreenState extends State<Quiz1Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: bloc.pageController,
            onPageChanged: (page) {},
            itemCount: bloc.questionList().length,
            itemBuilder: (context, index) {
              return Column(children: [
                const SizedBox(
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    color: Colors.orangeAccent,
                    width: MediaQuery.of(context).size.width,
                    height: 90,
                    child: Center(
                      child: Text(
                        bloc.questionList()[bloc.index2].question,
                        style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                answersList(),
                const SizedBox(
                  height: 30,
                ),
                nextQuestionButton()
              ]);
            })
        // body:
        );
  }

  answersList() {
    return Expanded(
      child: ListView.builder(
          itemCount: bloc.questionList()[bloc.index2].answers.length,
          itemBuilder: (context, index) {
            return optionsButton(
                bloc.questionList()[bloc.index2].answers[index]);
          }),
    );
  }

  optionsButton(String answer) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(15),
      height: 55,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: bloc.answered
                  ? bloc.questionList()[bloc.index2].correctAnswer ==
                          bloc.selectedAnswer
                      ? Colors.green
                      : Colors.red
                  : Colors.blueGrey),
          onPressed: () {
            if (bloc.selectedAnswer == answer) {
              bloc.answered = false;
              bloc.selectedAnswer = "";
            } else {
              bloc.answered = true;
              bloc.selectedAnswer = answer;
            }
            bloc.scoreMethod(bloc.index2);
            bloc.questionList()[bloc.index2].answerRuslt =
                answer == bloc.questionList()[bloc.index2].correctAnswer;
            setState(() {});
          },
          child: Text(answer)),
    );
  }

  nextQuestionButton() {
    bool lastQuestion = false;
    if (bloc.index2 == bloc.questionList().length - 1) {
      lastQuestion = true;
    }
    return ElevatedButton(
        onPressed: bloc.answered
            ? () {
                bloc.selectedAnswer = "";
                if (lastQuestion) {
                  Get.off(() => ResultScreen(bloc.score, bloc.questionList()));
                } else {
                  setState(() {
                    bloc.index2++;
                    bloc.pageController!.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.linear);
                    setState(() {
                      bloc.selectedAnswer = "";
                      bloc.answered = false;
                    });
                  });
                }
              }
            : null,
        child: Text(lastQuestion ? "See result" : "Next Question"));
  }
}
