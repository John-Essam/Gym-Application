import 'dart:async';
import 'dart:ffi';
import 'package:fit_map/Constant/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Snack extends StatefulWidget {


  @override
  State<Snack> createState() => _SnackState();
}

class _SnackState extends State<Snack> {
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
                        Text('Snack',
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Fruits',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                'OR',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                'Vegetables',
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
