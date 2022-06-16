import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_map/Constant/constant.dart';
import 'package:fit_map/model/inbody_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'plans_state.dart';

class PlansCubit extends Cubit<PlansState> {
  PlansCubit() : super(PlansInitial());

  static PlansCubit get(context) => BlocProvider.of(context);

  InBodyModel bodeyModel;

  void getUserPlan() {
    emit(GetAllPlansLoading());
    FirebaseFirestore.instance
        .collection(Constant.Inbody)
        .where("uId", isEqualTo: FirebaseAuth.instance.currentUser.uid)
        .snapshots().listen((event) {
      bodeyModel = InBodyModel.fromJson(event.docs.first.data());
      emit(GetAllPlansSucess());
    });
  }
}
