import 'package:devquiz/home/home_repository.dart';
import 'package:devquiz/home/home_state.dart';
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

  final repository = HomeRepository();

  void getUser() async{
    state = HomeState.loading;
    user = await repository.getUser();
    state = HomeState.success;
  }

  void getQuizes() async{
    state = HomeState.loading;
    quizzes = await repository.getQuizzes();
    state = HomeState.success;
  }
}
