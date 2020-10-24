import 'package:arena_sports_app/Repos.dart';
import 'package:arena_sports_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Splash/SplashView.dart';
import 'UserDashboard/NavigationFiles.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black, // navigation bar color
    statusBarColor: Colors.white, // status bar color
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        sized: true,
        value: SystemUiOverlayStyle.dark,
        child: MaterialApp(
          theme: ThemeData(
              fontFamily: AppTheme.appFont,
              textTheme: TextTheme(
                  button: TextStyle(
                fontFamily: AppTheme.appFont,
              )),
              backgroundColor: AppTheme.whiteColor,
              scaffoldBackgroundColor: AppTheme.whiteColor,
              primaryColor: AppTheme.greyColor),
          debugShowCheckedModeBanner: false,
          home: NavigationScreens(),
          //initialRoute: "/splash",
        ));
  }
}

