import 'package:json_annotation/json_annotation.dart';

part 'comment_model.g.dart';
@JsonSerializable()
class CommentModel {
    CommentModel({
        this.commentId,
        this.questionId,
        this.ownerId,
        this.ownerFullName,
        this.ownerImageUrl,
        this.commentContent,
    });

    String? commentId;
    String? questionId;
    String? ownerId;
    String? ownerFullName;
    String? ownerImageUrl;
    String? commentContent;

    factory CommentModel.fromJson(Map<String, dynamic> json) => _$CommentModelFromJson(json);

    Map<String, dynamic> toJson() => _$CommentModelToJson(this);
}