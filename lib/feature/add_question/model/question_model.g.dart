// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionModel _$QuestionModelFromJson(Map<String, dynamic> json) =>
    QuestionModel(
      questionOwnerId: json['questionOwnerId'] as String?,
      questionTitle: json['questionTitle'] as String?,
      questionContent: json['questionContent'] as String?,
      questionImage: json['questionImage'] as String?,
      questionCategory: (json['questionCategory'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      questionStars: json['questionStars'] as int?,
      questionDate: json['questionDate'] as String?,
    );

Map<String, dynamic> _$QuestionModelToJson(QuestionModel instance) =>
    <String, dynamic>{
      'questionOwnerId': instance.questionOwnerId,
      'questionTitle': instance.questionTitle,
      'questionContent': instance.questionContent,
      'questionImage': instance.questionImage,
      'questionCategory': instance.questionCategory,
      'questionStars': instance.questionStars,
      'questionDate': instance.questionDate,
    };
