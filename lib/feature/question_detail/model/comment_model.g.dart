// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) => CommentModel(
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      imageUrl: json['imageUrl'] as String?,
      userId: json['userId'] as String?,
      commentContent: json['commentContent'] as String?,
    );

Map<String, dynamic> _$CommentModelToJson(CommentModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'surname': instance.surname,
      'imageUrl': instance.imageUrl,
      'userId': instance.userId,
      'commentContent': instance.commentContent,
    };
