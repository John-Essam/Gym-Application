import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fit_map/Screens/call_coach.dart';
import 'package:fit_map/Screens/home.dart';
import 'package:fit_map/Screens/login_screen/cubit/login_cubit.dart';
import 'package:fit_map/Screens/login_screen/log_user.dart';
import 'package:fit_map/Screens/nutrition.dart';
import 'package:fit_map/Screens/plans.dart';
import 'package:fit_map/Screens/progress.dart';
import 'package:fit_map/Screens/splash.dart';
import 'package:fit_map/Screens/workout_gym.dart';
import 'package:fit_map/Screens/workout_home.dart';
import 'package:fit_map/Widgets/bottomNavigatorBar.dart';
import 'package:fit_map/bussiens_logic/home/home_cubit.dart';
import 'package:fit_map/bussiens_logic/user_plans_cubit/plans_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Screens/log_sign.dart';
import 'helper/bloc_observer.dart';

void main() {

  BlocOverrides.runZoned(
        () async{
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
      runApp(MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>LoginCubit()),
        BlocProvider(create: (context)=>PlansCubit()..getUserPlan()),
        BlocProvider(create: (context)=>HomeCubit()..getUserInfo()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:Splash(),
      ),
    );
  }
}
