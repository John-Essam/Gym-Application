import 'package:fit_map/Constant/constant.dart';
import 'package:fit_map/Screens/Motivation.dart';
import 'package:fit_map/Widgets/call_alert.dart';
import 'package:fit_map/Widgets/inbody_alert.dart';
import 'package:fit_map/Widgets/sideBar.dart';
import 'package:fit_map/bussiens_logic/home/home_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Scaffold(
            key: scaffoldKey,
            endDrawer: SideBar(),
            backgroundColor: Constant.color_main,
            body:HomeCubit.get(context).userModel == null ? Center(child: CircularProgressIndicator(),): SafeArea(
              child: Column(
                children: [
                  Stack(children: [
                    Container(
                      width: double.infinity,
                      height: size.height * 0.36,
                      child: Image.asset(
                        Constant.img_homeBG,
                        fit: BoxFit.cover,
                        color: Constant.color_black.withOpacity(0.6),
                        colorBlendMode: BlendMode.colorBurn,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.menu,
                              color: Constant.color_main,
                            ),
                            iconSize: 25,
                            onPressed: () =>
                                scaffoldKey.currentState?.openEndDrawer()),
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
                    )
                  ]),
                  Column(
                    children: [
                      SizedBox(height: size.height * 0.05),
                      Row(
                        children: [
                          SizedBox(width: size.width * 0.009),
                          Image.asset(
                            Constant.icon_inbody,
                            width: size.width * 0.2,
                          ),
                          RichText(
                              text: TextSpan(
                                  text: 'Inbody \n',
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Constant.color_black,
                                      fontWeight: FontWeight.w600),
                                  children: [
                                TextSpan(
                                    text: 'Enter Your Inbody',
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Constant.color_btn,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    recognizer: new TapGestureRecognizer()
                                      ..onTap = () {
                                        return showDialog(
                                            barrierColor: Colors.black26,
                                            context: context,
                                            builder: (context) {
                                              return InBodyAlertDialog(
                                                title: "Inbody",
                                                description:
                                                    "Enter Your Inbody",
                                              );
                                            });
                                      })
                              ]))
                        ],
                      ),
                      SizedBox(height: size.height * 0.05),
                      Row(
                        children: [
                          SizedBox(width: size.width * 0.03),
                          Image.asset(
                            Constant.icon_coach,
                            width: size.width * 0.16,
                          ),
                          SizedBox(width: size.width * 0.03),
                          RichText(
                              text: TextSpan(
                                  text: 'Coaches \n',
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Constant.color_black,
                                      fontWeight: FontWeight.w600),
                                  children: [
                                TextSpan(
                                  text: 'Contact Your Coach',
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Constant.color_btn,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  recognizer: new TapGestureRecognizer()
                                    ..onTap = () => showDialog(
                                        barrierColor: Colors.black26,
                                        context: context,
                                        builder: (context) {
                                          return CustomAlertDialog(
                                            title: "Coaches",
                                            description: "Contact Your Coach",
                                          );
                                        }),
                                )
                              ]))
                        ],
                      ),
                      SizedBox(height: size.height * 0.05),
                      Row(
                        children: [
                          SizedBox(width: size.width * 0.03),
                          Image.asset(
                            Constant.icon_motivation,
                            width: size.width * 0.16,
                          ),
                          SizedBox(width: size.width * 0.03),
                          RichText(
                              text: TextSpan(
                                  text: 'Motivation \n',
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Constant.color_black,
                                      fontWeight: FontWeight.w600),
                                  children: [
                                TextSpan(
                                  text: 'Motivate Yourself',
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Constant.color_btn,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  recognizer: new TapGestureRecognizer()
                                    ..onTap = () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Motivation())),
                                )
                              ]))
                        ],
                      )
                    ],
                  )
                ],
              ),
            ));
      },
    );
  }
}
