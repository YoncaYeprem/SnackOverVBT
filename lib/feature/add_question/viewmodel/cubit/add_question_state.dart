part of 'add_question_cubit.dart';

@immutable
abstract class AddQuestionState {}

class AddQuestionInitial extends AddQuestionState {}
class SelectImage extends AddQuestionState {}
class ChangeDropdownValue extends AddQuestionState {}
