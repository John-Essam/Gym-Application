import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fit_map/bussiens_logic/home/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DropDownCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return DropdownButtonHideUnderline(
          child: DropdownButton2(
            buttonDecoration: BoxDecoration(
              border: Border.all(color: Colors.grey,),
                  borderRadius: BorderRadius.all(Radius.circular(15))
            ),
            hint: Text(
              'Choose Your Plan',
              style: TextStyle(
                fontSize: 20,
                color: Theme
                    .of(context)
                    .hintColor,
              ),
            ),
            items: HomeCubit
                .get(context)
                .planList
                .map((item) =>
                DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: TextStyle(
                      fontSize:20,
                    ),
                  ),
                ))
                .toList(),
            value: HomeCubit
                .get(context)
                .planType,
            onChanged: (value) {
              HomeCubit.get(context).choosePlanType(value as String);
            },
            buttonHeight: 50,
            buttonWidth: double.infinity,
            itemHeight: 50,
          ),
        );
      },
    );
  }
}