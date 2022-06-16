import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_map/Constant/constant.dart';
import 'package:fit_map/model/userModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  void SignInUser({String email, String password, @required bool user}) {
    emit(LoginLoading());
    if (user) {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        emit(LoginSuccess());
      }).catchError((error) {
        emit(LoginError(error.toString()));
      });
    } else {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        FirebaseFirestore.instance.collection(Constant.USERS)
            .doc(value.user.uid)
            .get()
            .then((data) {
          UserModel userModel = UserModel.fromJson(data.data());
          print(userModel.isCoach);
          if(userModel.isCoach ){
            emit(LoginSuccess());
          }else{
            emit(LoginError("You are not allowed "));
          }
        });
      }).catchError((error) {
        emit(LoginError(error.toString()));
      });
    }
  }
}
