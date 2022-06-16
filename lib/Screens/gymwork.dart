import 'package:fit_map/Screens/GymWork/1Gchest.dart';
import 'package:fit_map/Screens/GymWork/2Gback.dart';
import 'package:fit_map/Screens/GymWork/3Gshoulder.dart';
import 'package:fit_map/Screens/GymWork/4Garms.dart';
import 'package:fit_map/Screens/GymWork/5Gleg.dart';
import 'package:flutter/material.dart';

class Gymwork extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        Gchest(),
        Gback(),
        Gshoulder(),
        GArms(),
        GLeg(),
      ],
    );
  }
}
