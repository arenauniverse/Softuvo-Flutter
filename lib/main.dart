import 'package:arena_sports_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'LoginSignUpListing/LoginSgnupListingView.dart';
import 'Splash/SplashView.dart';

void main() {
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
          backgroundColor: AppTheme.backgroundColor,
          scaffoldBackgroundColor: AppTheme.backgroundColor,
          primaryColor: AppTheme.greyColor),
      debugShowCheckedModeBanner: false,
      initialRoute: "/splash",
      getPages: [
        GetPage(
          name: '/login',
          page: () => LoginSignUpListingView(),
        ),
        /* GetPage(
          name: '/signup',
          page: () => SignUpView(),
        ),*/
        GetPage(
          name: '/splash',
          page: () => Splash(),
        )
      ],
    );
  }
}
