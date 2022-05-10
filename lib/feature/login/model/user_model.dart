import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';
@JsonSerializable()
class UserModel{
  String? userId;
  String? name;
  String? surname;
  String? email;
  String? password;
  String? photoUrl;

  UserModel({this.userId ,this.name, this.surname, this.email, this.password, this.photoUrl});

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserModel fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json); 
}