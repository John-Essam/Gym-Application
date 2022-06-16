import 'package:fit_map/Constant/constant.dart';
import 'package:fit_map/Screens/GymWork/1Gchest.dart';
import 'package:fit_map/Screens/gymadv.dart';
import 'package:fit_map/Screens/gymwork.dart';
import 'package:fit_map/Screens/workout_home.dart';
import 'package:fit_map/Widgets/sideBar.dart';
import 'package:flutter/material.dart';

class Workout_gym extends StatefulWidget {
  @override
  _Workout_gymState createState() => _Workout_gymState();
}

class _Workout_gymState extends State<Workout_gym> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      endDrawer: SideBar(),
      backgroundColor: Constant.color_main,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: size.height*0.38,
                    child: Image.asset(Constant.img_workout,fit: BoxFit.cover,
                      color:Constant.color_black.withOpacity(0.6),
                      colorBlendMode: BlendMode.colorBurn,),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          icon: Image.asset(Constant.icon_backAro, width:size.width*0.035,color: Constant.color_main,),
                          iconSize: 4,
                          onPressed: () => Navigator.pop(context)
                      ),
                      IconButton(
                          icon: Icon(Icons.menu, color: Constant.color_main,),
                          iconSize: 25,
                          onPressed: () => scaffoldKey.currentState?.openEndDrawer()
                      ),
                    ],
                  ),
                  Center(
                    child: Column(
                      children: [
                        SizedBox(height: size.height*0.06),
                        Image.asset (Constant.img_logo2, width: size.width*0.67),
                        Text('Fit Map', style: TextStyle(
                            color: Constant.color_main,
                            fontSize: 19,
                            fontWeight: FontWeight.bold
                        ),)
                      ],
                    ),
                  ),
                  Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: size.height*0.29,),
                        Container(
                          width: double.infinity,
                          height: size.height*0.09,
                          color:Constant.color_black.withOpacity(0.6),
                          child: Center(
                            child: TextButton(
                              child: Text('Workout Plan', style: TextStyle(
                                color: Constant.color_main,
                                fontSize: 20,
                              ),),
                            ),
                          ),
                        ),
                      ]
                  )
                ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Gym', style: TextStyle(
                      color: Constant.color_btn, fontSize: 32, fontWeight: FontWeight.w400
                  ),),

                TextButton(
                  child: Text('Home', style: TextStyle(
                    color: Constant.color_black, fontSize: 32, fontWeight: FontWeight.w400
                ),),
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> Workout_home())),
                )

              ],
            ),
            SizedBox(height: size.height*0.005,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: size.height*0.004,
                  width: size.width*0.5,
                  color: Constant.color_btn,
                ),
                Container(
                  height: size.height*0.004,
                  width: size.width*0.5,
                  color: Constant.color_black,
                ),
              ],
            ),
            SizedBox(height: size.height*0.1),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    width: size.width*0.8,
                    height: size.height*0.1,
                    child: ElevatedButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> Gymwork())
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Constant.color_main,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          side: BorderSide(width: size.width*0.007,color: Constant.color_greybrd,)
                      ),
                      child: Text("Beginner",style: TextStyle(fontSize:23, color: Constant.color_black),),
                    ),
                  ),
                  SizedBox(height: size.height*0.07),
                  SizedBox(
                    width: size.width*0.8,
                    height: size.height*0.1,
                    child: ElevatedButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> gymadv())
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Constant.color_main,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          side: BorderSide(width: size.width*0.007,color: Constant.color_greybrd,)
                      ),
                      child: Text("Advanced",style: TextStyle(fontSize:23, color: Constant.color_black),),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
