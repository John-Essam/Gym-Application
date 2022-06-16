import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_map/Constant/constant.dart';
import 'package:fit_map/Screens/progress.dart';
import 'package:fit_map/model/progress_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import '../../model/userModel.dart';

part 'progress_state.dart';

class ProgressCubit extends Cubit<ProgressState> {
  ProgressCubit() : super(ProgressInitial());

  static ProgressCubit get(context) => BlocProvider.of(context);

  UserModel userModel;

  List<ProgressModel> list = [];

  void getOldProgress() {
    emit(GetProgressLoading());
    FirebaseFirestore.instance
        .collection(Constant.PROGRESS)
        .where("id", isEqualTo: FirebaseAuth.instance.currentUser.uid)
        .snapshots()
        .listen((event) {
      list.clear();
      event.docs.forEach((element) {
        list.add(ProgressModel.fromJson(element.data()));
      });
      emit(GetProgressSuccess());
    });
  }

  void sendProgress({String weight, String start, String goal}) async {
    await FirebaseFirestore.instance
        .collection(Constant.USERS)
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get()
        .then((value) {
      userModel = UserModel.fromJson(value.data());

      ProgressModel progressModel = ProgressModel(
        goal: goal,
        start: start,
        weight: weight,
        name: userModel.name,
        id: FirebaseAuth.instance.currentUser.uid,
        date: DateFormat.yMMMEd().format(DateTime.now()),
      );
      FirebaseFirestore.instance
          .collection(Constant.PROGRESS)
          .add(progressModel.toMap());
      emit(SendProgressSuccess());
    });
  }
}
