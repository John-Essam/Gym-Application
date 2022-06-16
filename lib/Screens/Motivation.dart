import 'package:fit_map/Constant/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Motivation extends StatefulWidget {
  @override
  State<Motivation> createState() => _MotivationState();
}
class _MotivationState extends State<Motivation> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Constant.color_main,
        body: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
                        color: Constant.color_btn,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                              icon: Image.asset(Constant.icon_backAro, width:size.width*0.035,),
                              iconSize: 4,
                              onPressed: () => Navigator.pop(context)
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 100),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 30,),
                          Image.asset(Constant.img_logo, width: 160,),
                          Text('MOTIVATION', style: TextStyle(fontSize: 20, color: Constant.color_black),)
                        ],
                      ),
                    )

                  ]
              ),
            ),
          ],
        ),
    );
  }
}
