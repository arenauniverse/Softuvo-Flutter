import 'package:arena_sports_app/CommonWidgets/SizeConfig.dart';
import 'package:arena_sports_app/UserDashboard/UserDashboard_View.dart';
import 'package:arena_sports_app/UserDashboard/arenaBottomSheet.dart';
import 'package:arena_sports_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoder/geocoder.dart';
import 'package:location/location.dart';

class NavigationScreens extends StatefulWidget {
  @override
  _NavigationScreensState createState() => _NavigationScreensState();
}

class _NavigationScreensState extends State<NavigationScreens> {
  int _currentIndex = 0;
  Coordinates coordinates;
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final widgetOptions = [
    UserDahboardView(),
    Text('Add new screen'),
    ArenaBottomSheet(),
    Text('Add new screen'),
    Text('Favourites'),
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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.shifting,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
              title: Text(""),
              icon: SvgPicture.asset(
                'assets/tab2.svg',
                color: _currentIndex == 0
                    ? AppTheme.blackColor
                    : AppTheme.greyColor,
              )),
          BottomNavigationBarItem(
              title: Text(""),
              icon: SvgPicture.asset(
                'assets/tab2.svg',
                color: _currentIndex == 1
                    ? AppTheme.blackColor
                    : AppTheme.greyColor,
              )),
          BottomNavigationBarItem(
            title: Text(""),
            icon: FloatingActionButton(
                elevation: 0,
                backgroundColor: Colors.transparent,
                onPressed: () {
                  _showModalSheet();
                },
                child: SvgPicture.asset('assets/tab3.svg')),
          ),
          /*SvgPicture.asset('assets/tab3.svg')*/
          BottomNavigationBarItem(
              title: Text(""),
              icon: SvgPicture.asset(
                'assets/tab4.svg',
                color: _currentIndex == 3
                    ? AppTheme.blackColor
                    : AppTheme.greyColor,
              )),
          BottomNavigationBarItem(
              title: Text(""),
              icon: SvgPicture.asset(
                'assets/tab5.svg',
                color: _currentIndex == 4
                    ? AppTheme.blackColor
                    : AppTheme.greyColor,
              )),
        ],
      ),
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

  getUserLocation() async {
    //call this async method from whereever you need
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
        error = 'permission denied- please enable it from app settings';
        print(error);
      }
      myLocation = null;
    }
    currentLocation = myLocation;

    coordinates = new Coordinates(myLocation.latitude, myLocation.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;

    print(
        ' ${first.locality}, ${first.adminArea},${first.subLocality}, ${first.subAdminArea},${first.addressLine}, ${first.featureName},${first.thoroughfare}, ${first.subThoroughfare}');
    return first;
  }
}
