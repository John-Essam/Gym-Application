import 'dart:async';
import 'dart:ffi';
import 'package:fit_map/Constant/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Snacks extends StatefulWidget {


  @override
  State<Snacks> createState() => _SnacksState();
}

class _SnacksState extends State<Snacks> {
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
                          Text('Snacks',
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
                  '100gm Sweet',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                Text(
                  'potato',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Banana',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Juice',
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
