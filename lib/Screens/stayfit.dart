
import 'package:fit_map/Screens/StayFit/SF_Meal_1.dart';
import 'package:fit_map/Screens/StayFit/SF_Meal_2.dart';
import 'package:fit_map/Screens/StayFit/SF_Meal_3.dart';
import 'package:fit_map/Screens/StayFit/Snacks.dart';
import 'package:flutter/material.dart';

class Stayfit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        SF_Meal_1(),
        SF_Meal_2(),
        SF_Meal_3(),
        Snacks()
      ],
    );
  }
}
