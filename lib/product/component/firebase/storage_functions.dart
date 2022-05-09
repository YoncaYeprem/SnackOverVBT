import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

import '../../../feature/add_question/model/question_model.dart';

class FirebaseStorageFunctions{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  String? uploadPath;

  Future<String?> saveImageToFirebaseCloud({XFile? imagePath}) async {
    String uploadFileName =
      DateTime.now().microsecondsSinceEpoch.toString() + '.jpg';
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


}