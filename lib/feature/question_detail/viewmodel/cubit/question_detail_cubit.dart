import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snack_over_vbt/core/init/localStorage/storage.dart';
import 'package:snack_over_vbt/feature/question_detail/model/comment_model.dart';

import '../../../../product/component/firebase/storage_functions.dart';
import '../../../add_question/model/question_model.dart';
import '../../../login/model/user_model.dart';

part 'question_detail_state.dart';

class QuestionDetailCubit extends Cubit<QuestionDetailState> {
  QuestionDetailCubit({required this.question, required this.context, required this.questionOwner})
      : super(QuestionDetailInitial()) {
    init();
  }

  QuestionModel question;
  UserModel questionOwner;
  BuildContext context;

  List<CommentModel>? commentsList;

  bool isStared = false;
  bool isLoading = false;

  changeLoading() {
    isLoading = !isLoading;
  }

  TextEditingController commentEditingController = TextEditingController();

  Future init() async {
    changeLoading();
    await getQuestionAnswersFromFirebase();
    changeLoading();
  }

  Future<void> getQuestionAnswersFromFirebase() async {
    commentsList = await FirebaseStorageFunctions().getAnswersForQuestion(questionId: question.questionId ?? "");
    emit(QuestionDetailGetAllComments());
    print(commentsList);
  }

  sendComment() async {
    final comment = CommentModel(
        commentId: FirebaseFirestore.instance.collection('comments').doc().id,
        ownerId: context.read<LocaleManager>().token,
        questionId: question.questionId,
        ownerFullName: "${questionOwner.name} ${questionOwner.surname}",
        ownerImageUrl: "",
        commentContent: commentEditingController.text);

    await FirebaseStorageFunctions().addComment(commentModel: comment);
  }
}
