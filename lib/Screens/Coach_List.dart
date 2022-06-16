import 'package:fit_map/Constant/constant.dart';
import 'package:fit_map/bussiens_logic/coach_cubit/coach_cubit.dart';
import 'package:fit_map/model/app_text.dart';
import 'package:fit_map/model/custom_design_coach.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Coach_list extends StatefulWidget {
  @override
  State<Coach_list> createState() => _Coach_listState();
}

class _Coach_listState extends State<Coach_list> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => CoachCubit()..getInBody(),
      child: BlocConsumer<CoachCubit, CoachState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: state is GetAllInBodyLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      Stack(children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30)),
                            color: Constant.color_btn,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 35,
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 30),
                                Image.asset(
                                  Constant.img_profile,
                                  width: 80,
                                ),
                                Text(
                                  'Hi! Coach',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Constant.color_black),
                                )
                              ],
                            ),
                          ),
                        )
                      ]),
                      Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: CustomCoachDesign(
                                  CoachCubit.get(context).inBodyList[index],CoachCubit.get(context)),
                            ),
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 10),
                            itemCount:
                            CoachCubit.get(context).inBodyList.length),
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
