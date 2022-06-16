import 'package:fit_map/Constant/constant.dart';
import 'package:fit_map/Screens/nutrition.dart';
import 'package:fit_map/Screens/workout_gym.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Plans extends StatefulWidget {
  @override
  _PlansState createState() => _PlansState();
}

class _PlansState extends State<Plans> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(children: [
            Stack(children: [
              Container(
                  width: double.infinity,
                  height: size.height * 0.43,
                  child: Image.asset(
                    Constant.img_nutrition,
                    fit: BoxFit.cover,
                    color: Constant.color_black.withOpacity(0.6),
                    colorBlendMode: BlendMode.colorBurn,
                  )),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: size.height * 0.34,
                  ),
                  Container(
                    width: double.infinity,
                    height: size.height * 0.09,
                    color: Constant.color_black.withOpacity(0.6),
                    child: Center(
                      child: TextButton(
                        child: Text(
                          'Nutrition Plan',
                          style: TextStyle(
                            color: Constant.color_main,
                            fontSize: 22,
                          ),
                        ),
                        onPressed: () => Navigator.push(
                            context,
                            PageTransition(
                                child: Nutrition(),
                                type: PageTransitionType.bottomToTop)),
                      ),
                    ),
                  )
                ],
              )
            ]),
            Stack(children: [
              Container(
                width: double.infinity,
                height: size.height * 0.43,
                child: Image.asset(
                  Constant.img_workout,
                  fit: BoxFit.cover,
                  color: Constant.color_black.withOpacity(0.6),
                  colorBlendMode: BlendMode.colorBurn,
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: size.height * 0.34,
                  ),
                  Container(
                    width: double.infinity,
                    height: size.height * 0.09,
                    color: Constant.color_black.withOpacity(0.6),
                    child: Center(
                      child: TextButton(
                        child: Text(
                          'Workout Plan',
                          style: TextStyle(
                            color: Constant.color_main,
                            fontSize: 22,
                          ),
                        ),
                        onPressed: () => Navigator.push(
                            context,
                            PageTransition(
                                child: Workout_gym(),
                                type: PageTransitionType.bottomToTop)),
                      ),
                    ),
                  )
                ],
              )
            ]),
          ]),
        ),
      ),
    );
  }
}
