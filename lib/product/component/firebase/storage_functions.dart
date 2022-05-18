import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../../../feature/add_question/model/question_model.dart';
import '../../../feature/login/model/user_model.dart';

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
    await firestore.collection("questions").doc().set(questionModel.toJson());
  }

  Future saveUserToFirestore({required UserModel userModel}) async {
    await firestore.collection("profile").doc(userModel.userId).set(userModel.toJson());
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
}
