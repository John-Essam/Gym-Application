part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class RegisterUserLoading extends RegisterState {}
class RegisterUserSucess extends RegisterState {}
class RegisterUserError extends RegisterState {
  String error;

  RegisterUserError(this.error);
}
