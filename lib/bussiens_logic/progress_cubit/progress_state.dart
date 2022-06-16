part of 'progress_cubit.dart';

@immutable
abstract class ProgressState {}

class ProgressInitial extends ProgressState {}
class SendProgressSuccess extends ProgressState {}
class GetProgressLoading extends ProgressState {}
class GetProgressSuccess extends ProgressState {}
class GetProgressError extends ProgressState {}
class GetUserInfoLoading extends ProgressState {}
class GetUserInfoSuccess extends ProgressState {}
