import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fit_map/Constant/constant.dart';
import 'package:fit_map/Screens/home.dart';
import 'package:fit_map/Screens/plans.dart';
import 'package:fit_map/Screens/progress.dart';
import 'package:flutter/material.dart';

class BottomNavigatorBar extends StatefulWidget {
  @override
  _BottomNavigatorBarState createState() => _BottomNavigatorBarState();
}

class _BottomNavigatorBarState extends State<BottomNavigatorBar> {
  int _currentIndex = 0;

  final _Home = GlobalKey<NavigatorState>();
  final _Progress = GlobalKey<NavigatorState>();
  final _Plan = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: <Widget>[
          Navigator(
            key: _Home,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => Home(),
            ),
          ),
          Navigator(
            key: _Progress,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => Progress(),
            ),
          ),
          Navigator(
            key: _Plan,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => Plans(),
            ),
          ),

        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        color: Constant.color_btn,
        index: _currentIndex,
        onTap: (val) => _onTap(val, context),
        backgroundColor: Colors.transparent,
        items: [
          ImageIcon(AssetImage(Constant.icon_home), size: 28,
              color: _currentIndex == 0? Colors.black: Colors.white),

          ImageIcon(AssetImage(Constant.icon_progress), size: 36,
              color: _currentIndex == 1? Colors.black: Colors.white),

          ImageIcon(AssetImage(Constant.icon_bulleted_list), size: 28,
            color: _currentIndex == 2? Colors.black: Colors.white,),
        ],
      ),
    );

  }

  void _onTap(int val, BuildContext context) {
    if (_currentIndex == val) {
      switch (val) {
        case 0:
          _Home.currentState.popUntil((route) => route.isFirst);
          break;
        case 1:
          _Progress.currentState.popUntil((route) => route.isFirst);
          break;
        case 2:
          _Plan.currentState.popUntil((route) => route.isFirst);
          break;
        default:
      }
    } else {
      if (mounted) {
        setState(() {
          _currentIndex = val;
        });
      }
    }
  }
}