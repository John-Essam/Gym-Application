import 'package:fit_map/Constant/constant.dart';
import 'package:fit_map/Screens/register_screen/sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'login_screen/log_user.dart';

// ignore: camel_case_types
class Log_sign extends StatefulWidget{
  @override
  _Log_signState createState() => _Log_signState();
}

// ignore: camel_case_types
class _Log_signState extends State<Log_sign> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(Constant.img_bg, fit: BoxFit.cover,
              color:Constant.color_black.withOpacity(0.6),
                colorBlendMode: BlendMode.colorBurn,
              ),
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: size.height*0.16,),
                  Image.asset(Constant.img_logo2, width: size.width*0.83,),
                  Text("Fit Map", style: TextStyle(color: Constant.color_main, fontSize: 30),),
                  SizedBox(height: size.height*0.11),
                  SizedBox(
                    width: size.width*0.77,
                    height: size.height*0.09,
                    child: ElevatedButton(
                      onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context)=> Log_user())
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                          side: BorderSide(width: size.width*0.007,color: Constant.color_btn,)
                      ),
                      child: Text("Log In",style: TextStyle(fontSize:23, color: Constant.color_main),),
                    ),
                  ),
                  SizedBox(height: size.height*0.042),
                  SizedBox(
                    width: size.width*0.77,
                    height: size.height*0.09,
                    child: ElevatedButton(
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context)=> Sign_up())
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                          side: BorderSide(width: size.width*0.007,color: Constant.color_btn,)
                      ),
                      child: Text("Sign Up",style: TextStyle(fontSize:23, color: Constant.color_main),),
                    ),
                  )
                  
              ]

              ),
            )

          ],
        ),
      )
    );
  }
}