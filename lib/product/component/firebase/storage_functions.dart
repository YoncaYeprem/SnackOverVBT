import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../../../feature/add_question/model/question_model.dart';
import '../../../feature/login/model/user_model.dart';
import '../../../feature/question_detail/model/comment_model.dart';

class FirebaseStorageFunctions {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  String? uploadPath;

  Future<String?> saveImageToFirebaseCloud({XFile? imagePath}) async {
    String uploadFileName = DateTime.now().microsecondsSinceEpoch.toString() + '.jpg';
    Reference reference = storage.ref().child("questionImages").child(uploadFileName);
    UploadTask uploadTask = reference.putFile(File(imagePath!.path));

    await uploadTask.whenComplete(() async {
      uploadPath = await uploadTask.snapshot.ref.getDownloadURL();
      return uploadPath;
    });
    return uploadPath;
  }

  Future saveQuestionToFirestore({required QuestionModel questionModel}) async {
    await firestore.collection("questions").doc(questionModel.questionId).set(questionModel.toJson());
  }

  Future saveUserToFirestore({required UserModel userModel}) async {
    await firestore.collection("profile").doc(userModel.userId).set(userModel.toJson());
  }

  Future addComment({required CommentModel commentModel}) async {
    await firestore.collection("comments").doc(commentModel.commentId).set(commentModel.toJson());
  }

  Future getQuestionComments({required String questionId}) async {
    List<CommentModel> comments = [];
    CollectionReference<Map<String, dynamic>> _collectionRef = FirebaseFirestore.instance.collection('comments');
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await _collectionRef.where('questionId', isEqualTo: questionId).get();
    querySnapshot.docs.forEach((element) {
      comments.add(CommentModel.fromJson(element.data()));
    });
    return comments;
  }

  Future getUserDatas({String? userId}) async {
    var profile = await firestore.collection("profile").doc(userId).get();

    return UserModel().fromJson(profile.data() ?? {});
  }

  Future getAllQuestionsFromFirebase() async {
    List<QuestionModel> allData = [];
    CollectionReference<Map<String, dynamic>> _collectionRef = FirebaseFirestore.instance.collection('questions');
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await _collectionRef.get();
    querySnapshot.docs.forEach((element) {
      allData.add(QuestionModel().fromJson(element.data()));
    });
    return allData;
  }

  Future getUserOwnQuestions({String? userId}) async {
    List<QueryDocumentSnapshot<Map<String, dynamic>>>? docs;
    List<QuestionModel> allMyQuestions = [];
    await firestore.collection('questions').where("questionOwnerId", isEqualTo: userId).get().then((query) {
      docs = query.docs;
    });
    docs?.forEach((element) {
      allMyQuestions.add(QuestionModel().fromJson(element.data()));
    });
    return allMyQuestions;
  }

  Future getUserOwnAnswers({String? userId}) async {
    List<QueryDocumentSnapshot<Map<String, dynamic>>>? docs;
    List<CommentModel> allMyAnswers = [];
    await firestore.collection('comments').where("ownerId", isEqualTo: userId).get().then((query) {
      docs = query.docs;
    });
    docs?.forEach((element) {
      allMyAnswers.add(CommentModel.fromJson(element.data()));
    });
    return allMyAnswers;
  }

  Future getAnswersForQuestion({String? questionId}) async {
    List<QueryDocumentSnapshot<Map<String, dynamic>>>? docs;
    List<CommentModel> allAnswers = [];
    await firestore.collection('comments').where("questionId", isEqualTo: questionId).get().then((query) {
      docs = query.docs;
    });
    docs?.forEach((element) {
      allAnswers.add(CommentModel.fromJson(element.data()));
    });
    return allAnswers;
  }


}
