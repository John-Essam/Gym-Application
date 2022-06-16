import 'dart:async';
import 'package:animated_widgets/animated_widgets.dart';
import 'package:fit_map/Screens/Coach_List.dart';
import 'package:fit_map/Screens/login_screen/log_user.dart';
import 'package:fit_map/Widgets/bottomNavigatorBar.dart';
import 'package:fit_map/bussiens_logic/splash_cubit/splash_cubit.dart';
import 'package:fit_map/helper/methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fit_map/Constant/constant.dart';
import 'package:fit_map/screens/log_sign.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Splash extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return BlocProvider(
      create: (context) => SplashCubit()..chechUser(),
      child: BlocConsumer<SplashCubit,SplashState>(
        listener: (context, state) {
          if(state is SplashLoginUser){
            navigateToAndFinish(context, Log_user());
          }
          else if(state is SplashCoach){
            navigateToAndFinish(context, Coach_list());

          }
          else if(state is SplashUser){
            navigateToAndFinish(context, BottomNavigatorBar());

          }


        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Constant.color_main,
            body: Container(
              alignment: Alignment.center,
              child: RotationAnimatedWidget.tween(
                child: Image.asset(Constant.img_logo, width: size.width * 0.8),
                rotationDisabled: Rotation.deg(z: 180),
                rotationEnabled: Rotation.deg(z: 0),
                duration: Duration(milliseconds: 500),),
            ),
          );
        },
      ),
    );
  }
}


