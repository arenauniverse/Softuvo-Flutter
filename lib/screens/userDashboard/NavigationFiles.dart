import 'dart:ffi';
import 'package:arena_sports_app/CommonWidgets/Messages.dart';
import 'package:arena_sports_app/CommonWidgets/SizeConfig.dart';
import 'package:arena_sports_app/CommonWidgets/bottomSheet.dart';
import 'package:arena_sports_app/screens/resultsTab/ResultsView.dart';
import 'package:arena_sports_app/screens/selectSportsBottomSheet/SelectSportsBottomSheet.dart';
import 'package:arena_sports_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoder/geocoder.dart';
import 'package:location/location.dart';

import 'UserDashboard_View.dart';
import 'arenaBottomSheet.dart';

var getLat, getLang;

class NavigationScreens extends StatefulWidget {
  @override
  _NavigationScreensState createState() => _NavigationScreensState();
}

class _NavigationScreensState extends State<NavigationScreens> {
  int _currentIndex = 0;
  Coordinates coordinates;
  GlobalKey _arenaKey = GlobalObjectKey("arena");
  GlobalKey _selectSport = GlobalObjectKey("selectSport");
  bool firstRun = true;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final widgetOptions = [
    UserDashboardView(),
    ResultsView(),
    ArenaBottomSheet(),
    Text('Add new screen'),
    /*Align(
      alignment: Alignment.bottomRight,
      child: Container(
        height: 300,
        child:SelectSportsBottomSheet()
      ),
    )*/
  ];

  @override
  void initState() {
    getUserLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      bottomNavigationBar: Container(
          alignment: Alignment.center,
          width: SizeConfig.blockSizeHorizontal * 80,
          height: SizeConfig.blockSizeVertical * 9,
          child: Row(
            children: [
              Container(
                width: SizeConfig.blockSizeHorizontal * 80,
                height: SizeConfig.blockSizeVertical * 9,
                color: Colors.white,
                child: BottomNavigationBar(
                  // transparent
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.white,
                  onTap: onTabTapped,
                  items: [
                    BottomNavigationBarItem(
                        title: Text(""),
                        icon: SvgPicture.asset(
                          'assets/tab1.svg',
                          color: _currentIndex == 0
                              ? AppTheme.blackColor
                              : AppTheme.greyColor,
                          height: SizeConfig.blockSizeVertical * 3,
                        )),
                    BottomNavigationBarItem(
                        title: Text(""),
                        icon: SvgPicture.asset(
                          'assets/tab2.svg',
                          color: _currentIndex == 1
                              ? AppTheme.blackColor
                              : AppTheme.greyColor,
                          height: SizeConfig.blockSizeVertical * 3,
                        )),
                    BottomNavigationBarItem(
                      title: Text(""),
                      icon: Container(
                        height: SizeConfig.blockSizeVertical * 4,
                        child: FloatingActionButton(
                          key: _arenaKey,
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                          onPressed: () {
                            ShowBottomSheet()
                                .showModalSheet(context, ArenaBottomSheet());
                          },
                          child: SvgPicture.asset(
                            'assets/tab3.svg',
                            height: SizeConfig.blockSizeVertical * 5,
                          ),
                        ),
                      ),
                    ),
                    /*SvgPicture.asset('assets/tab3.svg')*/
                    BottomNavigationBarItem(
                        title: Text(""),
                        icon: SvgPicture.asset(
                          'assets/tab4.svg',
                          color: _currentIndex == 3
                              ? AppTheme.blackColor
                              : AppTheme.greyColor,
                          height: SizeConfig.blockSizeVertical * 3,
                        )),

                    /*  BottomNavigationBarItem(
                title: Text(""),
                icon: SvgPicture.asset(
                  'assets/tab5.svg',
                  color: _currentIndex == 4
                      ? AppTheme.blackColor
                      : AppTheme.greyColor,
                  height: SizeConfig.blockSizeVertical * 3,
                )),*/

                    /* BottomNavigationBarItem(
              title: Text(""),
              icon: GestureDetector(
                key: _selectSport,

                onTap: () {
                  _showSportSheet();
                },
                child: SvgPicture.asset(
                  'assets/tab5.svg',
                  height: SizeConfig.blockSizeVertical * 3,
                ),
              ),
            ),*/
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: SizeConfig.blockSizeHorizontal * 20,
                  alignment: Alignment.center,
                  height: SizeConfig.blockSizeVertical * 9,
                  color: Colors.white,
                  padding: EdgeInsets.only(
                      bottom: SizeConfig.blockSizeVertical * 1.5),
                  child: GestureDetector(
                    key: _selectSport,
                    onTap: () {
                      ShowBottomSheet()
                          .showModalSheet(context, SelectSportsBottomSheet());
                      //    _showSportSheet();
                    },
                    child: SvgPicture.asset(
                      'assets/tab5.svg',
                      alignment: Alignment.center,
                      width: SizeConfig.blockSizeVertical * 3,
                      height: SizeConfig.blockSizeVertical * 3,
                    ),
                  ),
                ),
              ),
            ],
          )),
      backgroundColor: AppTheme.backGroundColor,
      body: Center(
        child: widgetOptions.elementAt(_currentIndex),
      ),
    );
  }

  void _showModalSheet() {
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

  void _showSportSheet() {
    showModalBottomSheet(
        isScrollControlled: true,
        useRootNavigator: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(25.0),
                topLeft: Radius.circular(25.0))),
        context: context,
        builder: (builder) {
          return SelectSportsBottomSheet();
        });
  }

  getUserLocation() async {
    var currentLocation;
    LocationData myLocation;
    String error;
    Location location = new Location();
    try {
      myLocation = await location.getLocation();
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        error = 'please grant permission';
        print(error);
      }
      if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        error = Messages.locationPermissions;
        print(error);
      }
      myLocation = null;
    }
    currentLocation = myLocation;

    coordinates = new Coordinates(myLocation.latitude, myLocation.longitude);
    getLat = myLocation.latitude;
    getLang = myLocation.longitude;
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    return first;
  }
}
