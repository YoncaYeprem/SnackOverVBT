import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:snack_over_vbt/core/init/localStorage/storage.dart';
import 'package:snack_over_vbt/feature/login/model/user_model.dart';
import 'package:provider/provider.dart';

import '../../../../product/component/firebase/storage_functions.dart';
import '../../../add_question/model/question_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.context) : super(HomeInitial()) {
    init();
  }
  bool isLoading = true;
  bool isLoadingImage = true;

  List<QuestionModel>? questionsList;
  UserModel? userImage;
  UserModel? questionImage;
  BuildContext context;

  Future<void> init() async {
    await getAllQuestions();
    await getUserHomeImage();
  }

  Future<List<QuestionModel>?> getAllQuestions() async {
    questionsList = await FirebaseStorageFunctions().getAllQuestionsFromFirebase();
    LocaleManager().saveQuestionModel(questionsList);
    changeLoading();
    emit(HomeGetDatas());

    return questionsList;
  }

  Future<UserModel?>? getUserHomeImage() async {
    print("token:${context.read<LocaleManager>().token}");
    userImage = await FirebaseStorageFunctions().getUserDatas(userId: context.read<LocaleManager>().token ?? '');
    emit(HomeGetImage());
    return userImage;
  }

  Future<UserModel?>? getUserQuestionImage({String? userId}) async {
    questionImage = await FirebaseStorageFunctions().getUserDatas(userId: userId);
    emit(HomeGetImage());
    return questionImage;
  }

  void changeLoading() {
    isLoading = !isLoading;
  }

  void changeLoadingImage() {
    isLoadingImage = !isLoadingImage;
  }
}
