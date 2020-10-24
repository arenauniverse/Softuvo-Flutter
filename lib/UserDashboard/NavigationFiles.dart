import 'package:arena_sports_app/UserDashboard/UserDashboard_View.dart';
import 'package:arena_sports_app/UserDashboard/arenaBottomSheet.dart';
import 'package:arena_sports_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavigationScreens extends StatefulWidget {
  @override
  _NavigationScreensState createState() => _NavigationScreensState();
}

class _NavigationScreensState extends State<NavigationScreens> {
  int _currentIndex = 0;
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final widgetOptions = [
    UserDahboardView(),
    Text('Add new beer'),
    ArenaBottomSheet(),
    Text('Add new beer'),
    Text('Favourites'),
  ];

  Widget getBottomSheet() {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(25.0),
                topLeft: Radius.circular(25.0))),
        context: context,
        builder: (builder) {
          return ArenaBottomSheet();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: AppTheme.greyColor,
        selectedItemColor: AppTheme.blackColor,
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
              title: Text(""), icon: SvgPicture.asset('assets/tab1.svg')),
          BottomNavigationBarItem(
              title: Text(""),
              icon: SvgPicture.asset(
                'assets/tab2.svg',
                color: AppTheme.greyColor,
              )),
          BottomNavigationBarItem(
              title: Text(""), icon: SvgPicture.asset('assets/tab3.svg')),
          BottomNavigationBarItem(
              title: Text(""),
              icon: SvgPicture.asset('assets/tab4.svg',
                  color: AppTheme.greyColor)),
          BottomNavigationBarItem(
              title: Text(""),
              icon: SvgPicture.asset('assets/tab5.svg',
                  color: AppTheme.greyColor)),
        ],
      ),
      backgroundColor: AppTheme.backGroundColor,
      body: Center(
        child: widgetOptions.elementAt(_currentIndex),
      ),
    );
  }
}
