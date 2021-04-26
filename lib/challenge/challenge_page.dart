import 'package:devquiz/challenge/challenge_controller.dart';
import 'package:devquiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:devquiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:devquiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:devquiz/result/result_page.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final String title;
  ChallengePage({
    Key? key,
    required this.questions,
    required this.title,
  }) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();
  @override

  void initState() {
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });
    super.initState();
  }

  void nextPage() {
    if(controller.currentPage < widget.questions.length)
      pageController.nextPage(
      duration: Duration(milliseconds: 50),
      curve: Curves.linear,
      );
  }

  void onSelected(bool value){
    if(value){
      controller.answersRight++;
    }
    nextPage();
  }

  Widget build(BuildContext context) {
    return Scaffold(//Scaffold --> esqueleto da página
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(Icons.close),
                onPressed: (){
                  Navigator.pop(context);
                }
              ),
              //para não ficar rebuidando a página toda vez que
              //muda de questão:
              ValueListenableBuilder<int>(
                valueListenable: controller.currentPageNotifier,
                builder: (context, value, _) => QuestionIndicatorWidget(
                  currentPage: value,
                  lenght: widget.questions.length,
                ),
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children:
          widget.questions.map((e) => QuizWidget(
            question: e,
            onSelected: onSelected,
            )
          ).toList(),
        ),
      //QuizWidget(question: widget.questions[0],
        //title: "O que o Flutter faz em sua totalidade?"
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 10,
            right: 20,
            left: 20
          ),
          child: ValueListenableBuilder<int>(
            valueListenable: controller.currentPageNotifier,
            builder: (context, value, _) =>
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if(value < widget.questions.length)
                      Expanded(child: NextButtonWidget.white(
                        label: "Pular",
                        onTap: nextPage,
                      )),
                    if(value == widget.questions.length)
                      Expanded(child: NextButtonWidget.green(
                        label: "Confirmar",
                        onTap: (){
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultPage(
                                title: widget.title,
                                length: widget.questions.length,
                                result: controller.answersRight,
                              ))
                          );
                        },
                      )),
                    /*if(value != widget.questions.length)
                      Expanded(child: NextButtonWidget.green(
                        label: "Confirmar",
                        onTap: nextPage,
                      )),*/
                  ],
                )
          )
        ),
      ),
    );
  }
}
