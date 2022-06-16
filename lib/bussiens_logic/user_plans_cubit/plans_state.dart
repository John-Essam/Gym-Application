part of 'plans_cubit.dart';

@immutable
abstract class PlansState {}

class PlansInitial extends PlansState {}
class GetAllPlansLoading extends PlansState {}
class GetAllPlansSucess extends PlansState {}
class GetAllPlansError extends PlansState {}
