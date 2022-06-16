import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit_map/Constant/constant.dart';
import 'package:fit_map/model/inbody_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'coach_state.dart';

class CoachCubit extends Cubit<CoachState> {
  CoachCubit() : super(CoachInitial());

  static CoachCubit get(context) => BlocProvider.of(context);

  List<InBodyModel> inBodyList = [];

  void getInBody() {
    emit(GetAllInBodyLoading());

    FirebaseFirestore.instance
        .collection(Constant.Inbody)
        .snapshots()
        .listen((event) {
      inBodyList.clear();
      event.docs.forEach((element) {
        inBodyList.add(InBodyModel.fromJson(element.data()));
      });
      emit(GetAllInBodySuccess());
    });
  }

  void acceptInbody(String id, String type) {
    FirebaseFirestore.instance
        .collection(Constant.Inbody)
        .doc(id)
        .update(updateNo(type));
  }

  void rejectInbody(String id) {
    FirebaseFirestore.instance
        .collection(Constant.Inbody)
        .doc(id)
        .update({"isReject": true});
  }

  Map<String, dynamic> updateNo(type) {
    if (type == Constant.GAIN) {
      return {"isOkGain": true};
    } else if (type == Constant.LOSE) {
      return {"isOkLose": true};
    } else {
      return {"isOkStay": true};
    }
  }
}
