import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:questions_app/shared/shared_widget.dart';
import '../result/result_screen.dart';
import 'quiz1_bloc.dart';
import 'widgets/questions_container.dart';

class Quiz1Screen extends StatefulWidget {
  static const screenRoute = 'screen2';

  const Quiz1Screen({Key? key}) : super(key: key);

  @override
  State<Quiz1Screen> createState() => _Quiz1ScreenState();
}

class _Quiz1ScreenState extends State<Quiz1Screen> {
  var bloc = Quiz1Bloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: bloc.pageController,
        onPageChanged: (page) {
          setState(() {
            bloc.isPressed = false;
          });
        },
        itemBuilder: (context, index) {
          return SafeArea(
            child: Stack(children: [
              Container(
                color: CustomWidgets().backgroundColor,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
              Column(
                children: [
                  QuestionsContainer(
                    index: index,
                    questionText: bloc.ListOfQuestions[index].question,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //TODO:
                  const SizedBox(
                    height: 5,
                  ),
                  for (int i = 0;
                      i < bloc.ListOfQuestions[index].answers!.length;
                      i++)
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: ElevatedButton(
                          onPressed: bloc.isPressed
                              ? () {}
                              : () {
                                  setState(() {
                                    bloc.isPressed = true;
                                  });
                                  bloc.scoreMethod(index, i);

                                  if (bloc
                                      .ListOfQuestions[index].answers!.entries
                                      .toList()[i]
                                      .value) {}
                                },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                                side: BorderSide(
                                    width: 4,
                                    color: bloc.isPressed == false
                                        ? Colors.white
                                        : Colors.transparent)),
                            elevation: 5,
                            primary: bloc.isPressed
                                ? bloc.ListOfQuestions[index].answers!.entries
                                        .toList()[i]
                                        .value
                                    ? bloc.isTrue
                                    : bloc.isWrong
                                : bloc.btncolor,
                          ),
                          child: Text(bloc.ListOfQuestions[index].answers!.keys
                              .toList()[i]),
                        ),
                      ),
                    ),
                  const SizedBox(
                    height: 30,
                  ),
                  bloc.isPressed == true
                      ? Text(bloc.ListOfQuestions[index].note)
                      : const Text(""),
                  const SizedBox(
                    height: 20,
                  ),
                  bloc.isPressed
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              elevation: 0,
                              side: const BorderSide(
                                  width: 3, color: Colors.blue),
                              primary: Colors.transparent),
                          onPressed: bloc.isPressed
                              ? index + 1 == bloc.ListOfQuestions.length
                                  ? () {
                                      Get.off(() => ResultScreen(
                                          bloc.score, bloc.ListOfQuestions));
                                    }
                                  : () {
                                      bloc.pageController!.nextPage(
                                          duration:
                                              const Duration(milliseconds: 500),
                                          curve: Curves.linear);
                                      setState(() {
                                        bloc.isPressed = false;
                                      });
                                    }
                              : null,
                          child: Text(
                            index + 1 == bloc.ListOfQuestions.length
                                ? "See result"
                                : "Next Question",
                            style: const TextStyle(color: Colors.black87),
                          ),
                        )
                      : Container(),
                ],
              ),
            ]),
          );
        },
      ),
    );
  }
}
