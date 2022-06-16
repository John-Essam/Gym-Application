import 'package:fit_map/Constant/constant.dart';
import 'package:fit_map/screens/log_sign.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Profil extends StatefulWidget {


  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
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
                      padding: const EdgeInsets.only(left: 100),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 30,),
                          Image.asset(Constant.img_logo, width: 160,),
                          Text('Hi, Mahmoud!', style: TextStyle(fontSize: 20, color: Constant.color_black),)
                        ],
                      ),
                    )

                  ]
              ),
            ),
            SizedBox(height: 50),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  height: 70,
                  child: ElevatedButton(
                    onPressed: () => Null,
                    style: ElevatedButton.styleFrom(
                        alignment: Alignment.center,
                        primary: Constant.color_main,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        side: BorderSide(color: Constant.color_greylin.withOpacity(0.2),)
                    ),
                    child: Text("In Bodies received",style: TextStyle(fontSize:20, color: Constant.color_black,fontWeight: FontWeight.bold),),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 300,
                  height: 70,
                  child: ElevatedButton(
                    onPressed: () => Null,
                    style: ElevatedButton.styleFrom(
                        alignment: Alignment.center,
                        primary: Constant.color_main,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        side: BorderSide(color: Constant.color_greylin.withOpacity(0.2),)
                    ),
                    child: Text("Contact Us",style: TextStyle(fontSize:20, color: Constant.color_black,fontWeight: FontWeight.bold),),
                  ),
                ),
                SizedBox(height: 60),
                Center(
                  child: SizedBox(
                    width: size.width*0.77,
                    height: size.height*0.09,
                    child: ElevatedButton(
                      onPressed: () => Null,
                      style: ElevatedButton.styleFrom(
                          primary: Constant.color_btn,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          side: BorderSide(width: size.width*0.007,color: Constant.color_btn,)
                      ),
                      child: Text('Log Out',style: TextStyle(fontSize:23, color: Colors.white),),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          fixedColor: Constant.color_main,
          backgroundColor: Constant.color_btn,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "profil"),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: "Plan"),
          ],
        )
    );
  }
}
