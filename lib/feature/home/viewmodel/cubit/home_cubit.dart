import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:snack_over_vbt/feature/add_question/model/question_model.dart';

import '../../../../product/component/firebase/storage_functions.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()){init();}

  List<QuestionModel>? questionsList;

  Future<void> init() async {
    await getAllQuestions();
  }

  Future<List<QuestionModel>?> getAllQuestions() async {
   questionsList = await FirebaseStorageFunctions().getAllQuestionsFromFirebase();
   return questionsList;
  }
}