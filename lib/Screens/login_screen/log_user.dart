import 'package:fit_map/Constant/constant.dart';
import 'package:fit_map/Screens/forget_password/forget_password.dart';
import 'package:fit_map/Screens/login_screen/cubit/login_cubit.dart';
import 'package:fit_map/Screens/register_screen/sign_up.dart';
import 'package:fit_map/Widgets/bottomNavigatorBar.dart';
import 'package:fit_map/screens/log_sign.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tbib_toast/tbib_toast.dart';

import '../../helper/methods.dart';
import 'log_coach.dart';

// ignore: camel_case_types
class Log_user extends StatefulWidget {
  @override
  _Log_userState createState() => _Log_userState();
}

// ignore: camel_case_types
class _Log_userState extends State<Log_user> {
  var secure = true;
  var email = TextEditingController();
  var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.pop(context);
          navigateToAndFinish(context, BottomNavigatorBar());
          Toast.show("Welcome", context,
              backgroundColor: Colors.green, duration: 3);
        }
        if (state is LoginError) {
          Navigator.pop(context);
          Toast.show(state.error, context,
              backgroundColor: Colors.red, duration: 3);
        }
        if (state is LoginLoading) {
          showCustomProgressIndicator(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Constant.color_main,
          appBar: AppBar(
            backgroundColor: Colors.white,
            shadowColor: Colors.transparent,
            title: Text(
              'Log In',
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
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Log_sign())),
            ),
          ),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Center(
                    child: Image.asset(
                      Constant.img_logo,
                      width: size.width * 0.75,
                    ),
                  ),
                  SizedBox(height: size.height * 0.005),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'user',
                        style: TextStyle(
                            color: Constant.color_btn,
                            fontSize: 32,
                            fontWeight: FontWeight.w400),
                      ),
                      TextButton(
                        child: Text(
                          'coach',
                          style: TextStyle(
                              color: Constant.color_greylin,
                              fontSize: 32,
                              fontWeight: FontWeight.w400),
                        ),
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Log_coach())),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: size.height * 0.004,
                        width: size.width * 0.5,
                        color: Constant.color_btn,
                      ),
                      Container(
                        height: size.height * 0.004,
                        width: size.width * 0.5,
                        color: Constant.color_greylin,
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.065),
                  SizedBox(
                    width: size.width * 0.75,
                    height: size.height * 0.09,
                    child: TextFormField(
                      controller: email,
                      style: TextStyle(fontSize: 18),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Constant.color_btn, width: 1),
                              borderRadius: BorderRadius.circular(30)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Constant.color_greybrd, width: 2),
                              borderRadius: BorderRadius.circular(30)),
                          hintText: "  Email",
                          hintStyle: TextStyle(
                              color: Constant.color_greybrd, fontSize: 19)),
                    ),
                  ),
                  SizedBox(height: size.height * 0.006),
                  SizedBox(
                    width: size.width * 0.75,
                    height: size.height * 0.1,
                    child: TextFormField(
                      controller: password,
                      style: TextStyle(fontSize: 18),
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: secure
                                ? Icon(
                                    Icons.visibility,
                                    color: Constant.color_black,
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
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Constant.color_btn, width: 1),
                              borderRadius: BorderRadius.circular(30)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Constant.color_greybrd, width: 2),
                              borderRadius: BorderRadius.circular(30)),
                          hintText: "  Password",
                          hintStyle: TextStyle(
                              color: Constant.color_greybrd, fontSize: 19)),
                    ),
                  ),
                  SizedBox(height: size.height * 0.006),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPassword()));
                    },
                    child: Text(
                      'forgetPassword',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                        decoration: TextDecoration.underline
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.018),
                  SizedBox(
                    width: size.width * 0.77,
                    height: size.height * 0.09,
                    child: ElevatedButton(
                      onPressed: () {
                        LoginCubit.get(context).SignInUser(
                            email: email.text, password: password.text,user: true);
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Constant.color_btn,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          side: BorderSide(
                            width: size.width * 0.007,
                            color: Constant.color_btn,
                          )),
                      child: Text(
                        "Log In",
                        style:
                            TextStyle(fontSize: 23, color: Constant.color_main),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  RichText(
                      text: TextSpan(
                          text: "don't have an account ? ",
                          style: TextStyle(
                              color: Constant.color_black,
                              fontSize: 17,
                              fontWeight: FontWeight.w300),
                          children: [
                        TextSpan(
                            text: 'sign up',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Constant.color_btn,
                              fontSize: 17,
                            ),
                            recognizer: new TapGestureRecognizer()
                              ..onTap = () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Sign_up())))
                      ]))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
