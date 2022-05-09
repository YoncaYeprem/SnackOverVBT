import 'dart:io';
import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
part 'add_question_state.dart';

class AddQuestionCubit extends Cubit<AddQuestionState> {
  AddQuestionCubit() : super(AddQuestionInitial());

  Uint8List? image;
  XFile? imagePath;
  String? imageName;

  TextEditingController questionTitleContoller = TextEditingController();
  TextEditingController questionContentContoller = TextEditingController();

  FocusNode questionTitleNode = FocusNode();
  FocusNode questionContentNode = FocusNode();
  FocusNode questionCategoryNode = FocusNode();

  String? dropdownCategory;

  List<String> categories = [
    "Mobile",
    "Web",
    "Flutter",
    "React",
    "Node",
    "Python",
    "Javascript"
  ];

  void saveNewQuestionToFirebase() {
    //TODO: Make firestore and cloud connections
  }
  

  void selectImage() async {
    final XFile? selectedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
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
