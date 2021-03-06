import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

import '../../../../core/init/localStorage/storage.dart';
import '../../../../product/component/firebase/storage_functions.dart';
import '../../../../product/utils/date_time_parser.dart';
import '../../model/question_model.dart';

part 'add_question_state.dart';

class AddQuestionCubit extends Cubit<AddQuestionState> {
  AddQuestionCubit(this.context) : super(AddQuestionInitial());

  Uint8List? image;
  XFile? imagePath;
  String? imageName;
  BuildContext context;
  String? uploadedImagePath;

  TextEditingController questionTitleContoller = TextEditingController();
  TextEditingController questionContentContoller = TextEditingController();

  FocusNode questionTitleNode = FocusNode();
  FocusNode questionContentNode = FocusNode();
  FocusNode questionCategoryNode = FocusNode();

  String? dropdownCategory;
  List<String> categoryList = [];

  List<String> categories = ["Mobile", "Web", "Flutter", "React", "Node", "Python", "Javascript"];

  Future<void> saveNewQuestionToFirebase() async {
    uploadedImagePath =
        image != null ? await FirebaseStorageFunctions().saveImageToFirebaseCloud(imagePath: imagePath) : "";
    categoryList.add(dropdownCategory ?? "");

    final questionModel = QuestionModel(
        questionId: FirebaseFirestore.instance.collection('questions').doc().id,
        questionOwnerId: context.read<LocaleManager>().token,
        questionTitle: questionTitleContoller.text,
        questionContent: questionContentContoller.text,
        questionImage: uploadedImagePath,
        questionCategory: categoryList,
        questionDate: DateTimeParser.parseDate(DateTime.now().toString()));

    await FirebaseStorageFunctions().saveQuestionToFirestore(questionModel: questionModel);

    context.pop();
    emit(SaveQuestion());
  }

  void selectImage() async {
    final XFile? selectedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (selectedImage != null) {
      imagePath = selectedImage;
      imageName = selectedImage.name.toString();
    }
    File imageFile = File(selectedImage!.path);
    Uint8List imageRaw = await imageFile.readAsBytes();
    image = imageRaw;
    emit(SelectImage());
  }

  void changeDropdownValue(String newValue) {
    dropdownCategory = newValue;
    emit(ChangeDropdownValue());
  }
}
