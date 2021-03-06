import 'dart:async';
import 'package:arena_sports_app/CommonWidgets/SizeConfig.dart';
import 'package:arena_sports_app/screens/userDashboard/NavigationFiles.dart';
import 'package:arena_sports_app/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarColor: Colors.black, // status bar color
    ));

    Future.delayed(const Duration(milliseconds: 2000), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => NavigationScreens()));
      /* Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TestView()),
      );*/
      /*Get.off(TestView());*/
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      sized: true,
      value: SystemUiOverlayStyle.dark,
      child: Container(
        decoration: BoxDecoration(color: AppTheme.blackColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: SizeConfig.blockSizeHorizontal * 60,
                height: SizeConfig.blockSizeVertical * 10,
                child: SvgPicture.asset('assets/Arena.svg'),
              ),
            ),
            Container(
              width: SizeConfig.blockSizeHorizontal * 40,
              height: SizeConfig.blockSizeVertical * 5,
              child: SvgPicture.asset('assets/Sport.svg'),
            ),
          ],
        ),
      ),
    );
  }
}
