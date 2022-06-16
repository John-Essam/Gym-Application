import 'package:fit_map/Screens/GainW/GMeal_1.dart';
import 'package:fit_map/Screens/GainW/GMeal_2.dart';
import 'package:fit_map/Screens/GainW/GMeal_3.dart';
import 'package:fit_map/Screens/GainW/GMeal_4.dart';
import 'package:fit_map/Screens/GainW/GMeal_5.dart';
import 'package:flutter/material.dart';

class GainW extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        GMeal1(),
        GMeal2(),
        GMeal3(),
        GMeal4(),
        GMeal5(),
      ],
    );
  }
}
