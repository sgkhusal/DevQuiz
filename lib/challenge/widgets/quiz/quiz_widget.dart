import 'package:devquiz/challenge/widgets/answer/answer_widget.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  final QuestionModel question;
  const QuizWidget({Key? key, required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 64,),
          Text(
            question.title,
            style: AppTextStyles.heading,
          ),
          SizedBox(height: 24,),
          ...question.answers.map(
            (e) => AnswerWidget(
              isRight: e.isRight,
              title: e.title,
            ),
          ).toList(),

            //title: "Kit de desenvolvimento de interface de usuário"

            //title: "Possibilita a criação de aplicativos compilados nativamente",
           // isRight: true,
            //
            //title: "Acho que é uma marca de café do Himalaia"
            //title: "Possibilita a criação de desktops que são muito incríveis"
        ],
      ),
    );
  }
}
