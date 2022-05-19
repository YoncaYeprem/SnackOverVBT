import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:snack_over_vbt/core/init/localStorage/storage.dart';
import '../../../../product/component/firebase/storage_functions.dart';
import '../../../add_question/model/question_model.dart';
import '../../../login/model/user_model.dart';
import '../../model/comment_model.dart';

part 'question_detail_state.dart';

class QuestionDetailCubit extends Cubit<QuestionDetailState> {
  QuestionDetailCubit(
      {required this.question, required this.user, required this.context})
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
        docId: "LY0ezPgrZsu0AhoeXbYJ",
        fieldName: "comments",
        updatedField: CommentModel(
                name: "Beyza",
                surname: "Karadeniz ",
                userId: "",
                commentContent: "This is test comment",
                imageUrl: "")
            .toJson());
    emit(QuestionDetailSaveComment());
  }
}
