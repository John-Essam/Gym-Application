import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_map/Constant/constant.dart';
import 'package:fit_map/model/userModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  static SplashCubit get(context) => BlocProvider.of(context);

  void chechUser() {
    Future.delayed(Duration(seconds: 3), () {
      FirebaseAuth.instance.authStateChanges().listen((event) {
        if (event != null) {
          FirebaseFirestore.instance
              .collection(Constant.USERS)
              .doc(event.uid)
              .get()
              .then((value) {
            UserModel userModel = UserModel.fromJson(value.data());
            if (userModel.isCoach) {
              emit(SplashCoach());
            } else {
              emit(SplashUser());
            }
          });
        } else {
          emit(SplashLoginUser());
        }
      });
    });
  }
}
