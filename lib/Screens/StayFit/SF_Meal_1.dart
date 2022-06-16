import 'dart:async';
import 'dart:ffi';
import 'package:fit_map/Constant/constant.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SF_Meal_1 extends StatefulWidget {


  @override
  State<SF_Meal_1> createState() => _SF_Meal_1State();
}

class _SF_Meal_1State extends State<SF_Meal_1> {
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
                          Text('Meal 1',
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
                  '4 Scoops of oats',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  '1 Bananas',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  '1 Cup of milk',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  '3 Eggs',
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
