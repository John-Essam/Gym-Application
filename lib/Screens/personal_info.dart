import 'package:fit_map/Constant/constant.dart';
import 'package:fit_map/screens/log_sign.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';



class Personal_Info extends StatefulWidget{
  @override
  _Personal_InfoState createState() => _Personal_InfoState();
}

class _Personal_InfoState extends State<Personal_Info> {
  var secure = true;
  var secure2 = true;

  int _value = 0;

  DateTime selectedDate = DateTime.now();

  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  FocusNode focusNode4 = FocusNode();
  Color color;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    focusNode1.addListener(() {
      setState(() {
        color = focusNode1.hasFocus ? Color(0xFF1C5D99) : Colors.red;
      });
    });
    focusNode2.addListener(() {
      setState(() {
        color = focusNode2.hasFocus ? Color(0xFF1C5D99) : Colors.red;
      });
    });
    focusNode3.addListener(() {
      setState(() {
        color = focusNode3.hasFocus ? Color(0xFF1C5D99) : Colors.red;
      });
    });
    focusNode4.addListener(() {
      setState(() {
        color = focusNode4.hasFocus ? Color(0xFF1C5D99) : Colors.red;
      });
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body:  Padding(
        padding: const EdgeInsets.only(left:2,right:5),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height*0.07),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: size.width*0.25,),
                    Text("Personal Information", style: TextStyle(
                        color: Colors.black, fontSize: 17, fontWeight: FontWeight.w600
                    ),
                    ),
                  ],
                ),
                SizedBox(height: size.height*0.05),
                Padding(
                  padding: const EdgeInsets.only(left: 18,right: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width*0.87,
                        child: TextFormField(
                          focusNode: focusNode1,
                          decoration: InputDecoration(
                            labelText: "Name",
                            labelStyle: TextStyle(
                                fontSize: 18,
                                color: focusNode1.hasFocus? Color(0xFF1C5D99) : Colors.black
                            ),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Constant.color_grytxtfild)
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Constant.color_btn),
                            ),
                          ),
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      SizedBox(
                          height: size.height*0.01),
                      SizedBox(
                        width: size.width*0.87,
                        child: TextFormField(
                          focusNode: focusNode2,
                          decoration: InputDecoration(
                            labelText: "E-mail",
                            labelStyle: TextStyle(
                                fontSize: 18,
                                color: focusNode2.hasFocus? Color(0xFF1C5D99) : Colors.black
                            ),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Constant.color_grytxtfild)
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Constant.color_btn),
                            ),
                          ),
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      SizedBox(height: size.height*0.01),
                      Row(
                        children: [
                          Text(
                            '${selectedDate.day}.${selectedDate.month}.${selectedDate.year}',
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(width: size.width*0.35),
                          SizedBox(
                              width: size.width*0.3,
                              height: size.height*0.05,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Constant.color_btn
                                ),
                                child: Text('Select Date'),
                                onPressed: () async{
                                  DateTime newDate = await showDatePicker(
                                      context: context,
                                      initialDate: selectedDate,
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime(2023)
                                  );
                                  if (newDate == null) return;
                                  setState(() => selectedDate = newDate);
                                },
                              )
                          ),
                        ],
                      ),
                      SizedBox(height: size.height*0.03),
                      Row(
                        children: [
                          Row(
                            children: [
                              Text("Male", style: TextStyle(fontSize: 18),),
                              SizedBox(width: size.width*0.00005),
                              Radio(
                                activeColor: Constant.color_btn,
                                value: 1,
                                groupValue: _value,
                                onChanged: (value){
                                  setState(() {
                                    _value = value;
                                  });
                                },
                              )
                            ],
                          ),
                          SizedBox(width: size.width*0.08),
                          Row(
                            children: [
                              Text("Female", style: TextStyle(fontSize: 18),),
                              SizedBox(width: size.width*0.00005),
                              Radio(
                                activeColor: Constant.color_btn,
                                value: 2,
                                groupValue: _value,
                                onChanged: (value){
                                  setState(() {
                                    _value = value;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}