import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import '../../../../product/component/firebase/storage_functions.dart';
import '../../../add_question/model/question_model.dart';
import '../../../login/model/user_model.dart';
import '../../model/comment_model.dart';

part 'question_detail_state.dart';

class QuestionDetailCubit extends Cubit<QuestionDetailState> {
  QuestionDetailCubit({required this.question, required this.user, required this.context})
      : super(QuestionDetailInitial());
  QuestionModel question;
  UserModel user;
  BuildContext context;

  bool isStared = false;

  TextEditingController commentEditingController = TextEditingController();

  void changeStared() {
    isStared != isStared;
    emit(QuestionDetailChangeStar());
  }

  sendComment() async {
    await FirebaseStorageFunctions().updateOneFieldFromStore(
        collectionName: 'questions',
        docId: "J1vLCAKdooTijpu9xRsC",
        fieldName: "comments",
        updatedField: CommentModel(
                name: "Yonca",
                surname: "Yeprem ",
                userId: "",
                commentContent: "This is test comment YONCAAA",
                imageUrl: "")
            .toJson());
    emit(QuestionDetailSaveComment());
  }
}
