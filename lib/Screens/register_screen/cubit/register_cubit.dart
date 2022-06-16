import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_map/Constant/constant.dart';
import 'package:fit_map/model/userModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

  void registerUser({@required UserModel userModel}) {
    emit(RegisterUserLoading());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: userModel.email, password: userModel.password)
        .then((value) {
      FirebaseFirestore.instance
          .collection(Constant.USERS)
          .doc(value.user.uid)
          .set(userModel.toMap())
          .then((value1) {
        FirebaseFirestore.instance
            .collection(Constant.USERS)
            .doc(value.user.uid)
            .update({"id": value.user.uid});

        emit(RegisterUserSucess());
      });
    }).catchError((error) {
      print(error.toString());
      emit(RegisterUserError(error.toString()));
    });
  }
}
