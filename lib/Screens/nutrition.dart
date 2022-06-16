import 'package:fit_map/Constant/constant.dart';
import 'package:fit_map/Screens/gainW.dart';
import 'package:fit_map/Screens/loseW.dart';
import 'package:fit_map/Screens/stayfit.dart';
import 'package:fit_map/Widgets/sideBar.dart';
import 'package:fit_map/bussiens_logic/user_plans_cubit/plans_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tbib_toast/tbib_toast.dart';

class Nutrition extends StatefulWidget {
  @override
  _NutritionState createState() => _NutritionState();
}

class _NutritionState extends State<Nutrition> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<PlansCubit, PlansState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          key: scaffoldKey,
          endDrawer: SideBar(),
          backgroundColor: Constant.color_main,
          body: state is GetAllPlansLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SafeArea(
                  child: Column(
                    children: [
                      Stack(children: [
                        Container(
                          width: double.infinity,
                          height: size.height * 0.38,
                          child: Image.asset(
                            Constant.img_nutrition,
                            fit: BoxFit.cover,
                            color: Constant.color_black.withOpacity(0.6),
                            colorBlendMode: BlendMode.colorBurn,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                icon: Image.asset(
                                  Constant.icon_backAro,
                                  width: size.width * 0.035,
                                  color: Constant.color_main,
                                ),
                                iconSize: 4,
                                onPressed: () => Navigator.pop(context)),
                            IconButton(
                                icon: Icon(
                                  Icons.menu,
                                  color: Constant.color_main,
                                ),
                                iconSize: 25,
                                onPressed: () => scaffoldKey.currentState
                                    ?.openEndDrawer()),
                          ],
                        ),
                        Center(
                          child: Column(
                            children: [
                              SizedBox(height: size.height * 0.06),
                              Image.asset(Constant.img_logo2,
                                  width: size.width * 0.67),
                              Text(
                                'Fit Map',
                                style: TextStyle(
                                    color: Constant.color_main,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        Column(mainAxisSize: MainAxisSize.min, children: [
                          SizedBox(
                            height: size.height * 0.29,
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
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ])
                      ]),
                      SizedBox(height: size.height * 0.05),
                      Center(
                        child: Column(
                          children: [
                            SizedBox(
                              width: size.width * 0.8,
                              height: size.height * 0.1,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (PlansCubit.get(context)
                                      .bodeyModel
                                      .isOkGain) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => GainW()));
                                  } else {
                                    Toast.show("No Plan For You", context,
                                        duration: 3,
                                        backgroundColor: Colors.red);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Constant.color_main,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20)),
                                    ),
                                    side: BorderSide(
                                      width: size.width * 0.007,
                                      color: Constant.color_greybrd,
                                    )),
                                child: Text(
                                  "Gain Weight",
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Constant.color_black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(height: size.height * 0.05),
                            SizedBox(
                              width: size.width * 0.8,
                              height: size.height * 0.1,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (PlansCubit.get(context)
                                      .bodeyModel
                                      .isOkLose) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => GainW()));
                                  } else {
                                    Toast.show("No Plan For You", context,
                                        duration: 3,
                                        backgroundColor: Colors.red);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Constant.color_main,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20)),
                                    ),
                                    side: BorderSide(
                                      width: size.width * 0.007,
                                      color: Constant.color_greybrd,
                                    )),
                                child: Text(
                                  "Lose Wight",
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Constant.color_black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(height: size.height * 0.05),
                            SizedBox(
                              width: size.width * 0.8,
                              height: size.height * 0.1,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (PlansCubit.get(context)
                                      .bodeyModel
                                      .isOkStay) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => GainW()));
                                  } else {
                                    Toast.show("No Plan For You", context,
                                        duration: 3,
                                        backgroundColor: Colors.red);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Constant.color_main,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20)),
                                    ),
                                    side: BorderSide(
                                      width: size.width * 0.007,
                                      color: Constant.color_greybrd,
                                    )),
                                child: Text(
                                  "Stay Fit",
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Constant.color_black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
        );
      },
    );
  }
}
