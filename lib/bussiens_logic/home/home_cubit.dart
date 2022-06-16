import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_map/Constant/constant.dart';
import 'package:fit_map/model/inbody_model.dart';
import 'package:fit_map/model/userModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  UserModel userModel;

  void getUserInfo() {
    emit(GetUserInfoLoading());
    FirebaseFirestore.instance
        .collection(Constant.USERS)
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get()
        .then((value) {
      userModel = UserModel.fromJson(value.data());
      emit(GetUserInfoSuccess());
    });
  }

  void sendMyInbodyToCoach() {
    emit(UploadImageLoading());
    //FirebaseFirestore.instance.collection(Constant.Inbody).add()
  }

  final ImagePicker _picker = ImagePicker();
  File image;

  void _uploadPdf(type) async {
    emit(UploadImageLoading());
    firebase_storage.FirebaseStorage.instance
        .ref("photos")
        .child("${Uri.file(image.path).pathSegments.last}")
        .putFile(image)
        .then((pdf) {
      pdf.ref.getDownloadURL().then((value1) async {
        InBodyModel model = InBodyModel(
            uId: FirebaseAuth.instance.currentUser.uid,
            inBodyId: Constant.DEFULT,
            userName: userModel.name,
            type: setUpType(),
            image: value1);
        FirebaseFirestore.instance
            .collection(Constant.Inbody)
            .add(model.toMap())
            .then((w) {
          FirebaseFirestore.instance
              .collection(Constant.Inbody)
              .doc(w.id)
              .update({"inBodyId": w.id});
        });
      });
      emit(UploadImageSuccess());
    });
  }

  void pickImage(type) async {
    image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      emit(ChooseImageSucess());
      _uploadPdf(type);
    }
  }

  String planType;
  List<String> planList = ["Gain", "Lose", "Stay Fit"];

  void choosePlanType(String cat) {
    this.planType = cat;
    emit(choosePlanState());
  }

  setUpType() {
    if (planType == null) {
      return Constant.GAIN;
    } else {
      if (planType == "Gain") {
        return Constant.GAIN;
      } else if (planType == "Lose") {
        return Constant.LOSE;
      } else {
        return Constant.Stay;
      }
    }
  }
}
