part of 'coach_cubit.dart';

@immutable
abstract class CoachState {}

class CoachInitial extends CoachState {}
class GetAllInBodyLoading extends CoachState {}
class GetAllInBodySuccess extends CoachState {}
class GetAllInBodyError extends CoachState {}
