import 'package:fit_map/Constant/constant.dart';
import 'package:fit_map/Screens/call_coach.dart';
import 'package:fit_map/Screens/login_screen/log_user.dart';
import 'package:fit_map/Screens/personal_info.dart';
import 'package:fit_map/Screens/plans.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SideBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) => Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      ),
    );
  Widget buildHeader(BuildContext context) => Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30)),
      color: Constant.color_btn,
    ),
    padding: EdgeInsets.only(
      top: MediaQuery.of(context).padding.top,
    ),
    child: SafeArea(
      child: Column(
        children: [
          SizedBox(height: 20),
          Image.asset(Constant.img_profile, width: 85,),
          SizedBox(height: 10),
          Text("Hi, Mahmoud!", style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w600
          ),),
          SizedBox(height: 30),
        ],
      ),
    ),
  );
  Widget buildMenuItems (BuildContext context) => Column(
    children: [
      SizedBox(height: 20,),
      ListTile(
        leading: Icon(Icons.person, size: 30, color: Colors.black,),
        title: Text('Personal Information', style: TextStyle(
          fontSize: 18,
          color: Colors.black,
          fontWeight: FontWeight.bold
        ),),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> Personal_Info())),
      ),
      Divider(color: Colors.black54),
      ListTile(
        leading: Icon(Icons.quick_contacts_dialer, size: 30, color: Colors.black,),
        title: Text('Contact Us', style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold
        ),),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> Call_coach())),
      ),
      SizedBox(height: 290),
      Divider(color: Colors.black54),
      ListTile(
        leading: Icon(Icons.logout, size: 30, color: Colors.black,),
        title: Text('Log out', style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold
        ),),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> Log_user())),
      ),
    ],
  );

  }

