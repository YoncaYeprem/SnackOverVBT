import '../../../feature/add_question/model/question_model.dart';
import '../../../feature/login/model/user_model.dart';

class LocaleManager {
  String? token;
  UserModel? user;

  List<QuestionModel>? questionModel;
  bool isLogin = false;

  void saveToken(String data) {
    token = data;
  }

  void saveUser(UserModel data) {
    user = data;
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
