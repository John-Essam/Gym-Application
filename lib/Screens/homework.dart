
import 'package:fit_map/Screens/HomeWork/1Hchest.dart';
import 'package:fit_map/Screens/HomeWork/2Hback.dart';
import 'package:fit_map/Screens/HomeWork/3Hshoulder.dart';
import 'package:fit_map/Screens/HomeWork/4Harms.dart';
import 'package:fit_map/Screens/HomeWork/5Hleg.dart';
import 'package:flutter/material.dart';

class Homework extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        Hchest(),
        Hback(),
        Hshoulder(),
        HArms(),
        HLeg()
      ],
    );
  }
}
