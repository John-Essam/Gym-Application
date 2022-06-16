import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_map/model/progress_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/input_border.dart';
import 'package:fit_map/Constant/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../bussiens_logic/progress_cubit/progress_cubit.dart';
import '../model/app_text.dart';
import '../model/custom_progress_design.dart';

class Progress extends StatelessWidget {
  var currentWieghtController = TextEditingController();
  var start = TextEditingController();
  var goal = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => ProgressCubit()..getOldProgress(),
      child: BlocConsumer<ProgressCubit, ProgressState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            body: state is GetProgressLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Your Progress',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Center(
                            child: SizedBox(
                              width: size.width * 0.9,
                              height: size.height * 0.08,
                              child: ElevatedButton(
                                onPressed: () {
                                  showCustomDialog(
                                      context, ProgressCubit.get(context));
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Constant.color_btn,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                    ),
                                    side: BorderSide(
                                      width: size.width * 0.007,
                                      color: Constant.color_btn,
                                    )),
                                child: Text(
                                  'New Goal',
                                  style: TextStyle(
                                      fontSize: 23, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  height: 50,
                                  child: Center(
                                    child: AppText(
                                      text: "All Progress",
                                      color: Colors.purple,
                                      textSize: 25,
                                    ),
                                  ),
                                ),
                                ProgressCubit.get(context).list.length == 0
                                    ? Center(
                                        child: Padding(
                                          padding:  EdgeInsets.only(top: 150),
                                          child: AppText(
                                              text: "No Progress Goals",
                                              textSize: 25,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                        ),
                                      )
                                    : Expanded(
                                        child: Padding(
                                            padding: EdgeInsets.all(15),
                                            child: ListView.separated(
                                                itemBuilder: (context, index) =>
                                                    CustomQuestDesign(
                                                        ProgressCubit.get(context)
                                                            .list[index]),
                                                separatorBuilder:
                                                    (context, index) =>
                                                        SizedBox(height: 10),
                                                itemCount:
                                                    ProgressCubit.get(context)
                                                        .list
                                                        .length)),
                                      ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }

  AwesomeDialog showCustomDialog(context, ProgressCubit cubit) {
    return AwesomeDialog(
      context: context,
      animType: AnimType.SCALE,
      dialogType: DialogType.INFO,
      body: Column(
        children: [
          Center(
            child: Container(
              width: 300,
              child: TextFormField(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                ),
                controller: currentWieghtController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Current Weight',
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Container(
            width: double.infinity,
            child: TextFormField(
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
              ),
              controller: start,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'start',
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Container(
            width: double.infinity,
            child: TextFormField(
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
              ),
              controller: goal,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Goal',
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                ),
              ),
            ),
          ),
        ],
      ),
      title: 'This is Ignored',
      desc: 'This is also Ignored',
      btnOkOnPress: () {

        cubit.sendProgress(weight:currentWieghtController.text, start:  start.text,goal: goal.text, );
      },
    )..show();
  }
}
