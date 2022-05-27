part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class SaveUser extends LoginState {}
class LoginLoading extends LoginState {}
class LoginError extends LoginState {}
