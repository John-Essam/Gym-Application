part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class GetUserInfoLoading extends HomeState {}
class GetUserInfoSuccess extends HomeState {}

class choosePlanState extends HomeState {}
class ChooseImageSucess extends HomeState {}
class UploadImageLoading extends HomeState {}
class UploadImageSuccess extends HomeState {}
class SetErrorsaas extends HomeState {}
class UploadImageError extends HomeState {
  String error;

  UploadImageError(this.error);
}
