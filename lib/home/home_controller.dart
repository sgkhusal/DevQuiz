import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/home/home_state.dart';
import 'package:devquiz/shared/models/answer_model.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:devquiz/shared/models/quiz_model.dart';
import 'package:devquiz/shared/models/user_model.dart';
import 'package:flutter/foundation.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty); // quando estiver em determinado estado pode acessar o quiz
  //ValueNotifier -> estado que já tem dentro do flutter. Precisa importar o package do foundation
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  //USER
  //QUIZES
  UserModel? user; // a ? inicia o user como null
  List<QuizModel>? quizzes;

  void getUser() async{
    state = HomeState.loading;
    await Future.delayed(Duration(seconds: 2));
    user = UserModel(
      name: "Sheela",
      photoUrl: "https://www.bonsfluidos.com.br/images/large/2020/07/06/o-fotografo-shaaz-jung-fez-fotos-incriveis-do-leopardo-negro-1102024.jpg",
    );
    state = HomeState.success;
  }

  void getQuizes() async{
    state = HomeState.loading;
    await Future.delayed(Duration(seconds: 2));
    quizzes = [
      QuizModel(
        imagem: AppImages.blocks,
        title: "NLW 5 Flutter",
        level: Level.facil,
        questionsAnswered: 1,
        questions: [
          QuestionModel(
            title: "Você está curtindo o Flutter?",
            answers: [
              AnswerModel(title: "Estou curtindo"),
              AnswerModel(title: "Estou amando"),
              AnswerModel(title: "Muito top"),
              AnswerModel(title: "Show de bola",
              isRight: true),
            ],
          ),
          QuestionModel(
            title: "Você está curtindo o Flutter?",
            answers: [
              AnswerModel(title: "Estou curtindo"),
              AnswerModel(title: "Estou amando"),
              AnswerModel(title: "Muito top"),
              AnswerModel(title: "Show de bola",
              isRight: true),
            ],
          )
        ]
      )
    ];
    state = HomeState.success;
  }
}
