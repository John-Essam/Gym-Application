import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:fit_map/model/progress_model.dart';
import 'package:flutter/material.dart';

import 'app_text.dart';

class CustomQuestDesign extends StatelessWidget {

  ProgressModel model;


  CustomQuestDesign(this.model);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 8,
          ),
          AppText(
            text: 'Start : ${model.start}',
            maxLines: 5,
            color: Colors.white,
            textSize: 20.0,
          ),
          SizedBox(
            height: 8,
          ),
          AppText(
            text: 'Current Weight : ${model.weight}',
            color: Colors.white,
            textSize: 23.0,
          ),
          SizedBox(
            height: 8,
          ),
          AppText(
            text: 'Goal: ${model.goal}',
            maxLines: 5,
            color: Colors.white,
            textSize: 20.0,
          ),
          SizedBox(
            height: 8,
          ),
          AppText(
            maxLines: 3,
            text: "Date : ${model.date}",
            color: Colors.white,
            textSize: 20.0,
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
