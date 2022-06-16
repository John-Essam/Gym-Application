import 'package:flutter/cupertino.dart';

class InBodyModel {
  String uId;
  String inBodyId;
  String userName;
  String image;
  String type;
  bool isOkLose;
  bool isOkGain;
  bool isOkStay;
  bool isReject;

  InBodyModel({
    @required this.uId,
    @required this.inBodyId,
    @required this.userName,
    @required this.image,
    @required this.type,
    this.isReject = false,
    this.isOkLose = false,
    this.isOkGain = false,
    this.isOkStay = false,
  });

  InBodyModel.fromJson(Map<String, dynamic> json) {
    uId = json['uId'];
    inBodyId = json['inBodyId'];
    userName = json['userName'];
    image = json['image'];
    type = json['type'];
    isReject = json['isReject'];
    isOkLose = json['isOkLose'];
    isOkGain = json['isOkGain'];
    isOkStay = json['isOkStay'];
  }

  Map<String, dynamic> toMap() {
    return {
      "uId": uId,
      "inBodyId": inBodyId,
      "userName": userName,
      "image": image,
      "type": type,
      "isReject": isReject,
      "isOkGain": isOkGain,
      "isOkLose": isOkLose,
      "isOkStay": isOkStay,
    };
  }
}
