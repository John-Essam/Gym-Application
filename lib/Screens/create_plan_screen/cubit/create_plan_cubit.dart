import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'create_plan_state.dart';

class CreatePlanCubit extends Cubit<CreatePlanState> {
  CreatePlanCubit() : super(CreatePlanInitial());

  static CreatePlanCubit get(context)=>BlocProvider.of(context);
}
