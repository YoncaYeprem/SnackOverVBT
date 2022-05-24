// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) => CommentModel(
      commentId: json['commentId'] as String?,
      questionId: json['questionId'] as String?,
      ownerId: json['ownerId'] as String?,
      ownerFullName: json['ownerFullName'] as String?,
      ownerImageUrl: json['ownerImageUrl'] as String?,
      commentContent: json['commentContent'] as String?,
    );

Map<String, dynamic> _$CommentModelToJson(CommentModel instance) =>
    <String, dynamic>{
      'commentId': instance.commentId,
      'questionId': instance.questionId,
      'ownerId': instance.ownerId,
      'ownerFullName': instance.ownerFullName,
      'ownerImageUrl': instance.ownerImageUrl,
      'commentContent': instance.commentContent,
    };
