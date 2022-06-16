import 'package:fit_map/Constant/constant.dart';
import 'package:flutter/cupertino.dart';

class UserModel {
  String id;
  String name;
  String email;
  String password;
  String birthDate;
  bool isMale;
  bool isCoach;

  UserModel(
      {this.id = Constant.DEFULT,
      @required this.name,
      @required this.email,
      @required this.password,
      @required this.birthDate,
      @required this.isMale,
      this.isCoach = false});

  UserModel.fromJson(Map<String , dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    birthDate = json['birthDate'];
    isMale = json['isMale'];
    isCoach = json['isCoach'];
  }

  Map<String ,dynamic > toMap(){
    return {
      "id":id,
      "name":name,
      "email":email,
      "password":password,
      "birthDate":birthDate,
      "isMale":isMale,
      "isCoach":isCoach,
    };
  }

}
