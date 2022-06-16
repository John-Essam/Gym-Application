import 'package:fit_map/Screens/login_screen/log_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tbib_toast/tbib_toast.dart';

import '../../Constant/constant.dart';
import '../../helper/methods.dart';
import 'cubit/forget_cubit.dart';

class ForgetPassword extends StatelessWidget {
  var emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetCubit(),
      child: BlocConsumer<ForgetCubit, ForgetState>(
        listener: (context, state) {
          if (state is ForgetSuccess) {
            Navigator.pop(context);
            Toast.show('Success Sending Code', context);
            navigateToAndFinish(context, Log_user());
          }
          if (state is ForgetLoading) {
            showCustomProgressIndicator(context);
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
              leading: const BackButton(
                color: Colors.black,
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(30.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  const Text(
                  'Reset now',
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                const Center(
                  child: Text(
                    'If you want recover your account,then please provide your email ID below',
                    style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 90.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'please enter your email',
                    prefixIcon: Icon(Icons.account_circle),
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50.0,
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        ForgetCubit.get(context).sendForgetPasswordLink(
                            email: emailController.text);
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Constant.color_btn,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          side: BorderSide(
                            width: 1,
                            color: Constant.color_btn,
                          )),
                      child: Text(
                        "Send Code",
                        style:
                        TextStyle(fontSize: 23, color: Constant.color_main),
                      ),
                    ),
                  ),
                )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
