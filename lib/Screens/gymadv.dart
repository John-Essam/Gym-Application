
import 'package:fit_map/Screens/gymadv/1Gchest.dart';
import 'package:fit_map/Screens/gymadv/2Gback.dart';
import 'package:fit_map/Screens/gymadv/3Gshoulder.dart';
import 'package:fit_map/Screens/gymadv/4Garms.dart';
import 'package:fit_map/Screens/gymadv/5Gleg.dart';
import 'package:flutter/material.dart';

class gymadv extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        Gchesta(),
        Gbacka(),
        Gshouldera(),
        GArmsa(),
        GLega(),
      ],
    );
  }
}
