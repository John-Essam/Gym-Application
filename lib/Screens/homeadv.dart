
import 'package:fit_map/Screens/homeadv/1Hchest.dart';
import 'package:fit_map/Screens/homeadv/2Hback.dart';
import 'package:fit_map/Screens/homeadv/3Hshoulder.dart';
import 'package:fit_map/Screens/homeadv/4Harms.dart';
import 'package:fit_map/Screens/homeadv/5Hleg.dart';
import 'package:flutter/material.dart';

class homeadv extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        Hchesta(),
        Hbacka(),
        Hshouldera(),
        HArmsa(),
        HLega()
      ],
    );
  }
}
