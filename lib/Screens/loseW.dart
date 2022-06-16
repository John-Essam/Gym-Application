import 'package:fit_map/Screens/LoseW/LMeal_1.dart';
import 'package:fit_map/Screens/LoseW/LMeal_2.dart';
import 'package:fit_map/Screens/LoseW/LMeal_3.dart';
import 'package:fit_map/Screens/LoseW/Snack.dart';
import 'package:flutter/material.dart';

class LoseW extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        LMeal1(),
        LMeal2(),
        LMeal3(),
        Snack()
      ],
    );
  }
}
