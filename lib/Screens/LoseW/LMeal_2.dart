import 'dart:async';
import 'dart:ffi';
import 'package:fit_map/Constant/constant.dart';
import 'package:fit_map/screens/log_sign.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LMeal2 extends StatefulWidget {


  @override
  State<LMeal2> createState() => _LMeal2State();
}

class _LMeal2State extends State<LMeal2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
                      color: Constant.color_btn,
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 30,),
                        Text('Meal 2',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Constant.color_black,
                          ),
                        ),
                      ],
                    ),
                  )
                ]
            ),
          ),
          SizedBox(
            height: 80,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '150gm Basmatic',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text('rice',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                '150gm Grillrd',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text('chicken',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                'Green salad',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
