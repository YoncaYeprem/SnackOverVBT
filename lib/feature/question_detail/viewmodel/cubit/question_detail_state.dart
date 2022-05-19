part of 'question_detail_cubit.dart';

@immutable
abstract class QuestionDetailState {}

class QuestionDetailInitial extends QuestionDetailState {}
class QuestionDetailChangeStar extends QuestionDetailState {}
class QuestionDetailSaveComment extends QuestionDetailState {}
