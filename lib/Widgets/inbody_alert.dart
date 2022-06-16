import 'dart:io';
import 'package:fit_map/Constant/constant.dart';
import 'package:fit_map/bussiens_logic/home/home_cubit.dart';
import 'package:fit_map/compoents/drop_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tbib_toast/tbib_toast.dart';

class InBodyAlertDialog extends StatelessWidget {
  final String title, description, type;

  InBodyAlertDialog({this.title, this.description, this.type});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is UploadImageSuccess) {
          Navigator.pop(context);
          Toast.show("Sucess Send InBody To Coach", context,
              backgroundColor: Colors.green, duration: 3);
        }
      },
      builder: (context, state) {
        return Dialog(
          elevation: 0,
          backgroundColor: Color(0xffffffff),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 15),
              state is UploadImageLoading
                  ? LinearProgressIndicator()
                  : Center(),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: DropDownCategory(),
              ),
              SizedBox(height: 20),
              Text(
                "${title}",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15),
              Text(
                "${description}",
                style: TextStyle(fontSize: 17),
              ),
              SizedBox(height: 20),
              Container(
                  height: 100,
                  width: 120,
                  child: Image(
                    image: HomeCubit.get(context).image == null
                        ? AssetImage(Constant.img_empty_img)
                        : FileImage(HomeCubit.get(context).image),
                    fit: BoxFit.contain,
                  )),
              SizedBox(height: 20),
              Divider(
                height: 1,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: InkWell(
                  highlightColor: Colors.grey[200],
                  onTap: () {
                    HomeCubit.get(context).pickImage(type);
                  },
                  child: Center(
                      child: IconButton(
                    icon:
                        Icon(Icons.add, color: Constant.color_black, size: 30),
                  )),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
