import 'package:arena_sports_app/LogIn/Login_View.dart';
import 'package:arena_sports_app/myProfile/myProfileView.dart';
import 'package:arena_sports_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'LoginSignUpListing/LoginSgnupListingView.dart';
import 'Splash/SplashView.dart';

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
    return GetMaterialApp(
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
      initialRoute: "/splash",
      getPages: [
        GetPage(
          name: '/loginListing',
          page: () => LoginSignUpListingView(),
        ),
        GetPage(
          name: 'login',
          page: () => LoginView(),
        ),
        GetPage(
          name: '/test',
          page: () => TestView(),
        ),
        GetPage(
          name: '/splash',
          page: () => Splash(),
        ),
        GetPage(
          name: '/profile',
          page: () => MyProfileView(),
        )
      ],
    );
  }
}
