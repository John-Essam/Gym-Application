import 'package:fit_map/Constant/constant.dart';
import 'package:fit_map/Screens/home.dart';
import 'package:fit_map/Screens/log_sign.dart';
import 'package:fit_map/Screens/login_screen/log_user.dart';
import 'package:fit_map/Screens/register_screen/cubit/register_cubit.dart';
import 'package:fit_map/Widgets/bottomNavigatorBar.dart';
import 'package:fit_map/helper/methods.dart';
import 'package:fit_map/model/userModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tbib_toast/tbib_toast.dart';

// ignore: camel_case_types
class Sign_up extends StatefulWidget {
  @override
  _Sign_upState createState() => _Sign_upState();
}

// ignore: camel_case_types
class _Sign_upState extends State<Sign_up> {
  var name = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  var confirmPassword = TextEditingController();
  var birthDate = TextEditingController();

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

    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterUserSucess) {
            Navigator.pop(context);
            navigateToAndFinish(context, Log_user());
            Toast.show("Sucess Register ", context,
                backgroundColor: Colors.green, duration: 3);
          }
          if (state is RegisterUserError) {
            Navigator.pop(context);
            Toast.show(state.error, context,
                backgroundColor: Colors.red, duration: 3);
          }
          if (state is RegisterUserLoading) {
            showCustomProgressIndicator(context);
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              shadowColor: Colors.transparent,
              title: Text(
                'Sign Up',
                style: TextStyle(
                    color: Constant.color_black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              centerTitle: true,
              leading: IconButton(
                icon: Image.asset(
                  Constant.icon_backAro,
                  width: size.width * 0.035,
                ),
                iconSize: 4,
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Log_sign())),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.only(left: 2, right: 5),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: size.height * 0.07),
                      SizedBox(height: size.height * 0.05),
                      Padding(
                        padding: const EdgeInsets.only(left: 18, right: 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: size.width * 0.87,
                              child: TextFormField(
                                controller: name,
                                focusNode: focusNode1,
                                decoration: InputDecoration(
                                  labelText: "Name",
                                  labelStyle: TextStyle(
                                      fontSize: 18,
                                      color: focusNode1.hasFocus
                                          ? Color(0xFF1C5D99)
                                          : Colors.black),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Constant.color_grytxtfild)),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Constant.color_btn),
                                  ),
                                ),
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            SizedBox(height: size.height * 0.01),
                            SizedBox(
                              width: size.width * 0.87,
                              child: TextFormField(
                                controller: email,
                                focusNode: focusNode2,
                                decoration: InputDecoration(
                                  labelText: "E-mail",
                                  labelStyle: TextStyle(
                                      fontSize: 18,
                                      color: focusNode2.hasFocus
                                          ? Color(0xFF1C5D99)
                                          : Colors.black),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Constant.color_grytxtfild)),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Constant.color_btn),
                                  ),
                                ),
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            SizedBox(height: size.height * 0.01),
                            SizedBox(
                              width: size.width * 0.87,
                              child: TextFormField(
                                controller: password,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: secure,
                                focusNode: focusNode3,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: secure
                                        ? Icon(
                                            Icons.visibility,
                                            color: Colors.black,
                                            size: 30,
                                          )
                                        : Icon(
                                            Icons.remove_red_eye_outlined,
                                            color: Constant.color_btn,
                                            size: 30,
                                          ),
                                    onPressed: () {
                                      setState(() {
                                        secure = !secure;
                                      });
                                    },
                                  ),
                                  labelText: "Password",
                                  labelStyle: TextStyle(
                                      fontSize: 18,
                                      color: focusNode3.hasFocus
                                          ? Color(0xFF1C5D99)
                                          : Colors.black),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Constant.color_grytxtfild)),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Constant.color_btn),
                                  ),
                                ),
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            SizedBox(height: size.height * 0.01),
                            SizedBox(
                              width: size.width * 0.87,
                              child: TextFormField(
                                controller: confirmPassword,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: secure2,
                                focusNode: focusNode4,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: secure2
                                        ? Icon(
                                            Icons.visibility,
                                            color: Colors.black,
                                            size: 30,
                                          )
                                        : Icon(
                                            Icons.remove_red_eye_outlined,
                                            color: Constant.color_btn,
                                            size: 30,
                                          ),
                                    onPressed: () {
                                      setState(() {
                                        secure2 = !secure2;
                                      });
                                    },
                                  ),
                                  labelText: "Confirm password",
                                  labelStyle: TextStyle(
                                      fontSize: 18,
                                      color: focusNode4.hasFocus
                                          ? Color(0xFF1C5D99)
                                          : Colors.black),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Constant.color_grytxtfild)),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Constant.color_btn),
                                  ),
                                ),
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            SizedBox(height: size.height * 0.06),
                            Row(
                              children: [
                                Text(
                                  '${selectedDate.day}.${selectedDate.month}.${selectedDate.year}',
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(width: size.width * 0.35),
                                SizedBox(
                                    width: size.width * 0.3,
                                    height: size.height * 0.05,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Constant.color_btn),
                                      child: Text('Select Date'),
                                      onPressed: () async {
                                        DateTime newDate = await showDatePicker(
                                            context: context,
                                            initialDate: selectedDate,
                                            firstDate: DateTime(1900),
                                            lastDate: DateTime(2023));
                                        if (newDate == null) return;
                                        setState(() => selectedDate = newDate);
                                        birthDate.text =
                                            DateFormat.yMMMd().format(newDate);
                                      },
                                    )),
                              ],
                            ),
                            SizedBox(height: size.height * 0.03),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Male",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    SizedBox(width: size.width * 0.00005),
                                    Radio(
                                      activeColor: Constant.color_btn,
                                      value: 1,
                                      groupValue: _value,
                                      onChanged: (value) {
                                        setState(() {
                                          _value = value;
                                        });
                                      },
                                    )
                                  ],
                                ),
                                SizedBox(width: size.width * 0.08),
                                Row(
                                  children: [
                                    Text(
                                      "Female",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    SizedBox(width: size.width * 0.00005),
                                    Radio(
                                      activeColor: Constant.color_btn,
                                      value: 2,
                                      groupValue: _value,
                                      onChanged: (value) {
                                        setState(() {
                                          _value = value;
                                        });
                                      },
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: size.height * 0.05),
                            Center(
                              child: SizedBox(
                                width: size.width * 0.77,
                                height: size.height * 0.09,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_value == 0) {
                                      Toast.show("PLease Show Gender", context,
                                          duration: 3,
                                          backgroundColor: Colors.red);
                                    } else {
                                      UserModel userModel = UserModel(
                                          name: name.text,
                                          email: email.text,
                                          password: password.text,
                                          birthDate: birthDate.text,
                                          isMale: _value == 1 ? true : false);
                                      RegisterCubit.get(context)
                                          .registerUser(userModel: userModel);
                                    }
                                    },
                                  style: ElevatedButton.styleFrom(
                                      primary: Constant.color_btn,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)),
                                      ),
                                      side: BorderSide(
                                        width: size.width * 0.007,
                                        color: Constant.color_btn,
                                      )),
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                        fontSize: 23, color: Colors.white),
                                  ),
                                ),
                              ),
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
        },
      ),
    );
  }
}
