import 'package:json_annotation/json_annotation.dart';
part 'comment_model.g.dart';

@JsonSerializable()
class CommentModel {
    CommentModel({
        this.name,
        this.surname,
        this.imageUrl,
        this.userId,
        this.commentContent,
    });

    String? name;
    String? surname;
    String? imageUrl;
    String? userId;
    String? commentContent;

    factory CommentModel.fromJson(Map<String, dynamic> json) => _$CommentModelFromJson(json);

    Map<String, dynamic> toJson() => _$CommentModelToJson(this);
}