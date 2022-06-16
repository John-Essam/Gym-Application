import 'package:fit_map/Constant/constant.dart';
import 'package:fit_map/Widgets/call_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Call_coach extends StatefulWidget {

  @override
  State<Call_coach> createState() => _Call_coachState();
}

class _Call_coachState extends State<Call_coach> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
              children: [
                Container(
                  height: 200,
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
                  padding: const EdgeInsets.symmetric(
                    vertical: 35,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 30),
                        Image.asset(Constant.img_profile, width: 80),
                        Text('Coaches', style: TextStyle(fontSize: 20, color: Constant.color_black),)
                      ],
                    ),
                  ),
                )
              ]
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Container(
                      color: Colors.white,
                      child: ElevatedButton(
                        onPressed: () => Null,
                         style: ElevatedButton.styleFrom(
                           primary: Constant.color_greylin.withOpacity(.6),
                           padding: EdgeInsets.symmetric(
                             horizontal: 0,
                           ),
                          elevation: 0,
                          alignment: Alignment.center,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                      ),
                          child:Row(
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundImage: NetworkImage(
                                  'https://scontent.fcai1-2.fna.fbcdn.net/v/t1.6435-9/75348948_2335870779869756_7727672894615977984_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=174925&_nc_eui2=AeEQsAF1X7aT2WvIc2c6Ry0bnSti02r5oh6dK2LTavmiHpLjGzqs_uxM6NCI7FJsIw65HFl6jt65_yGTQ9IbQ4AI&_nc_ohc=c15zZQ-g10gAX90Y8j2&_nc_ht=scontent.fcai1-2.fna&oh=00_AT_OAvEsP1dhsKg4OaqVzcZY8FeCeuQO5_NbcsLDq2VzHQ&oe=62BC11C9',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 10,
                                ),
                                child: Text('John Essam Mickael',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black.withOpacity(.6)
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () => showDialog(
                                    barrierColor: Colors.black26,
                                    context: context,
                                    builder: (context){
                                      return CustomAlertDialog(
                                        title: "Call coach",
                                        description: "+010023456789",
                                      );
                                    }
                                ),
                                icon: Icon(
                                Icons.call,
                                  color: Constant.color_btn,
                              ),
                              ),
                            ],
                          ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Container(
                      color: Colors.white,
                      child: ElevatedButton(
                        onPressed: () => Null,
                        style: ElevatedButton.styleFrom(
                          primary: Constant.color_greylin.withOpacity(.6),
                          padding: EdgeInsets.symmetric(
                            horizontal: 0,
                          ),
                          elevation: 0,
                          alignment: Alignment.center,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                        ),
                        child:Row(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundImage: NetworkImage(
                                'https://scontent.fcai1-2.fna.fbcdn.net/v/t1.6435-9/75348948_2335870779869756_7727672894615977984_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=174925&_nc_eui2=AeEQsAF1X7aT2WvIc2c6Ry0bnSti02r5oh6dK2LTavmiHpLjGzqs_uxM6NCI7FJsIw65HFl6jt65_yGTQ9IbQ4AI&_nc_ohc=c15zZQ-g10gAX90Y8j2&_nc_ht=scontent.fcai1-2.fna&oh=00_AT_OAvEsP1dhsKg4OaqVzcZY8FeCeuQO5_NbcsLDq2VzHQ&oe=62BC11C9',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                              ),
                              child: Text('John Essam Mickael',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black.withOpacity(.6)
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () => showDialog(
                                  barrierColor: Colors.black26,
                                  context: context,
                                  builder: (context){
                                    return CustomAlertDialog(
                                      title: "Call coach",
                                      description: "+010023456789",
                                    );
                                  }
                              ),
                              icon: Icon(
                                Icons.call,
                                color: Constant.color_btn,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Container(
                      color: Colors.white,
                      child: ElevatedButton(
                        onPressed: () => Null,
                        style: ElevatedButton.styleFrom(
                          primary: Constant.color_greylin.withOpacity(.6),
                          padding: EdgeInsets.symmetric(
                            horizontal: 0,
                          ),
                          elevation: 0,
                          alignment: Alignment.center,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                        ),
                        child:Row(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundImage: NetworkImage(
                                'https://scontent.fcai1-2.fna.fbcdn.net/v/t1.6435-9/75348948_2335870779869756_7727672894615977984_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=174925&_nc_eui2=AeEQsAF1X7aT2WvIc2c6Ry0bnSti02r5oh6dK2LTavmiHpLjGzqs_uxM6NCI7FJsIw65HFl6jt65_yGTQ9IbQ4AI&_nc_ohc=c15zZQ-g10gAX90Y8j2&_nc_ht=scontent.fcai1-2.fna&oh=00_AT_OAvEsP1dhsKg4OaqVzcZY8FeCeuQO5_NbcsLDq2VzHQ&oe=62BC11C9',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                              ),
                              child: Text('John Essam Mickael',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black.withOpacity(.6)
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () => showDialog(
                                  barrierColor: Colors.black26,
                                  context: context,
                                  builder: (context){
                                    return CustomAlertDialog(
                                      title: "Call coach",
                                      description: "+010023456789",
                                    );
                                  }
                              ),
                              icon: Icon(
                                Icons.call,
                                color: Constant.color_btn,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Container(
                      color: Colors.white,
                      child: ElevatedButton(
                        onPressed: () => Null,
                        style: ElevatedButton.styleFrom(
                          primary: Constant.color_greylin.withOpacity(.6),
                          padding: EdgeInsets.symmetric(
                            horizontal: 0,
                          ),
                          elevation: 0,
                          alignment: Alignment.center,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                        ),
                        child:Row(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundImage: NetworkImage(
                                'https://scontent.fcai1-2.fna.fbcdn.net/v/t1.6435-9/75348948_2335870779869756_7727672894615977984_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=174925&_nc_eui2=AeEQsAF1X7aT2WvIc2c6Ry0bnSti02r5oh6dK2LTavmiHpLjGzqs_uxM6NCI7FJsIw65HFl6jt65_yGTQ9IbQ4AI&_nc_ohc=c15zZQ-g10gAX90Y8j2&_nc_ht=scontent.fcai1-2.fna&oh=00_AT_OAvEsP1dhsKg4OaqVzcZY8FeCeuQO5_NbcsLDq2VzHQ&oe=62BC11C9',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                              ),
                              child: Text('John Essam Mickael',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black.withOpacity(.6)
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () => showDialog(
                                  barrierColor: Colors.black26,
                                  context: context,
                                  builder: (context){
                                    return CustomAlertDialog(
                                      title: "Call coach",
                                      description: "+010023456789",
                                    );
                                  }
                              ),
                              icon: Icon(
                                Icons.call,
                                color: Constant.color_btn,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Container(
                      color: Colors.white,
                      child: ElevatedButton(
                        onPressed: () => Null,
                        style: ElevatedButton.styleFrom(
                          primary: Constant.color_greylin.withOpacity(.6),
                          padding: EdgeInsets.symmetric(
                            horizontal: 0,
                          ),
                          elevation: 0,
                          alignment: Alignment.center,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                        ),
                        child:Row(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundImage: NetworkImage(
                                'https://scontent.fcai1-2.fna.fbcdn.net/v/t1.6435-9/75348948_2335870779869756_7727672894615977984_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=174925&_nc_eui2=AeEQsAF1X7aT2WvIc2c6Ry0bnSti02r5oh6dK2LTavmiHpLjGzqs_uxM6NCI7FJsIw65HFl6jt65_yGTQ9IbQ4AI&_nc_ohc=c15zZQ-g10gAX90Y8j2&_nc_ht=scontent.fcai1-2.fna&oh=00_AT_OAvEsP1dhsKg4OaqVzcZY8FeCeuQO5_NbcsLDq2VzHQ&oe=62BC11C9',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                              ),
                              child: Text('John Essam Mickael',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black.withOpacity(.6)
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () => showDialog(
                                  barrierColor: Colors.black26,
                                  context: context,
                                  builder: (context){
                                    return CustomAlertDialog(
                                      title: "Call coach",
                                      description: "+010023456789",
                                    );
                                  }
                              ),
                              icon: Icon(
                                Icons.call,
                                color: Constant.color_btn,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Container(
                      color: Colors.white,
                      child: ElevatedButton(
                        onPressed: () => Null,
                        style: ElevatedButton.styleFrom(
                          primary: Constant.color_greylin.withOpacity(.6),
                          padding: EdgeInsets.symmetric(
                            horizontal: 0,
                          ),
                          elevation: 0,
                          alignment: Alignment.center,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                        ),
                        child:Row(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundImage: NetworkImage(
                                'https://scontent.fcai1-2.fna.fbcdn.net/v/t1.6435-9/75348948_2335870779869756_7727672894615977984_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=174925&_nc_eui2=AeEQsAF1X7aT2WvIc2c6Ry0bnSti02r5oh6dK2LTavmiHpLjGzqs_uxM6NCI7FJsIw65HFl6jt65_yGTQ9IbQ4AI&_nc_ohc=c15zZQ-g10gAX90Y8j2&_nc_ht=scontent.fcai1-2.fna&oh=00_AT_OAvEsP1dhsKg4OaqVzcZY8FeCeuQO5_NbcsLDq2VzHQ&oe=62BC11C9',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                              ),
                              child: Text('John Essam Mickael',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black.withOpacity(.6)
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () => showDialog(
                                  barrierColor: Colors.black26,
                                  context: context,
                                  builder: (context){
                                    return CustomAlertDialog(
                                      title: "Call coach",
                                      description: "+010023456789",
                                    );
                                  }
                              ),
                              icon: Icon(
                                Icons.call,
                                color: Constant.color_btn,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ],
      ),
    );
  }
}