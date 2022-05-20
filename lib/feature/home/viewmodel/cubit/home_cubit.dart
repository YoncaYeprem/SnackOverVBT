import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../../core/init/localStorage/storage.dart';
import '../../../../core/init/locale_storage_manager.dart';
import '../../../login/model/user_model.dart';
import 'package:provider/provider.dart';

import '../../../../product/component/firebase/storage_functions.dart';
import '../../../add_question/model/question_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.context) : super(HomeInitial()) {
    init();
  }
  bool isLoading = false;

  List<QuestionModel>? questionsList;
  UserModel? userImage;
  UserModel? questionImage;
  BuildContext context;

  Future<void> init() async {
    changeLoading();
    await getAllQuestions();
    await getUserHomeImage();
    changeLoading();
  }

  Future<List<QuestionModel>?> getAllQuestions() async {
    questionsList = await FirebaseStorageFunctions().getAllQuestionsFromFirebase();
    LocaleManager().saveQuestionModel(questionsList);

    emit(HomeGetDatas());

    return questionsList;
  }

  Future<UserModel?>? getUserHomeImage() async {
    userImage = await FirebaseStorageFunctions().getUserDatas(userId: context.read<LocaleManager>().token ?? '');
    emit(HomeGetUser());
    return userImage;
  }

  /*  Future<UserModel?>? getUserQuestionImage({String? userId}) async {
    questionImage =
        await FirebaseStorageFunctions().getUserDatas(userId: userId);
    emit(HomeGetImage());
    return questionImage;
  } */

  void changeLoading() {
    isLoading = !isLoading;
  }
}
