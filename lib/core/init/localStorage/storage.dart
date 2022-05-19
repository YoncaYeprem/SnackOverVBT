import '../../../feature/add_question/viewmodel/cubit/add_question_cubit.dart';

import '../../../feature/add_question/model/question_model.dart';

class LocaleManager {
  String? token;
  List<QuestionModel>? questionModel;
  bool isLogin = false;

  void saveToken(String data) {
    token = data;
  }

  void saveQuestionModel(List<QuestionModel>? data) {
    questionModel = data;
  }

  void clearData() {
    _changeLoginValue(false);
  }

  void _changeLoginValue(bool value) {
    isLogin = value;
  }
}
