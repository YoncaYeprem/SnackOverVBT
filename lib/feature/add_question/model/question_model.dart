import 'package:json_annotation/json_annotation.dart';
part 'question_model.g.dart';

@JsonSerializable()
class QuestionModel {
    QuestionModel({
        this.questionOwnerId,
        this.questionTitle,
        this.questionContent,
        this.questionImage,
        this.questionCategory,
        this.questionStars,
        this.questionDate,
    });

    String? questionOwnerId;
    String? questionTitle;
    String? questionContent;
    String? questionImage;
    List<String>? questionCategory;
    int? questionStars;
    String? questionDate;

  Map<String, dynamic> toJson() => _$QuestionModelToJson(this);

  QuestionModel fromJson(Map<String, dynamic> json) => _$QuestionModelFromJson(json); 
}