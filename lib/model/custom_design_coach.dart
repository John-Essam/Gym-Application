import 'package:fit_map/bussiens_logic/coach_cubit/coach_cubit.dart';
import 'package:fit_map/helper/methods.dart';
import 'package:fit_map/model/inbody_model.dart';
import 'package:flutter/material.dart';

import 'app_text.dart';

class CustomCoachDesign extends StatelessWidget {
  InBodyModel model;
  CoachCubit cubit;

  CustomCoachDesign(this.model, this.cubit);

  @override
  Widget build(BuildContext context) {
    return setUp(context);
  }

  Widget setUp(context) {
    if (model.isOkLose == false &&
        model.isOkGain == false &&
        model.isOkStay == false &&
        model.isReject == false) {
      return InkWell(
        onTap: () {
          navigateTo(context, ViewFullScreenImage(model.inBodyId, model.image));
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(20.0)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 100,
                height: 100,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(model.image),
                )),
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: '${model.userName}',
                    maxLines: 1,
                    color: Colors.white,
                    textSize: 25.0,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  AppText(
                    text: '${model.type}',
                    maxLines: 1,
                    color: Colors.white,
                    textSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 50),
                      Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: IconButton(
                              onPressed: () {
                                cubit.rejectInbody(model.inBodyId);
                              },
                              icon: Icon(Icons.clear, color: Colors.red),
                              iconSize: 30)),
                      SizedBox(width: 20),
                      Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: IconButton(
                              onPressed: () {
                                cubit.acceptInbody(model.inBodyId, model.type);
                              },
                              icon: Icon(Icons.add_task, color: Colors.green),
                              iconSize: 30)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    } else {
      return Center();
    }
  }
}

class ViewFullScreenImage extends StatelessWidget {
  String id, image;

  ViewFullScreenImage(this.id, this.image);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Hero(
        tag: id.toString(),
        child: Image.network(image),
      ),
    );
  }
}
