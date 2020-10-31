import 'dart:ui';

import 'package:arena_sports_app/theme.dart';
import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      primarySwatch: Colors.blue,
      primaryColor: isDarkTheme ? Color(0xff3B3B3B) : Colors.white,
      backgroundColor: isDarkTheme ? Color(0xFF212121) : Color(0xffF1F5FB),
      scaffoldBackgroundColor: isDarkTheme ? Color(0xFF212121) : Color(0XFFF8F8FA),
      indicatorColor: isDarkTheme ? Colors.white : Colors.black,
      buttonColor: isDarkTheme ? Color(0xff3B3B3B) : Color(0xffF1F5FB),
      hintColor: isDarkTheme ? Color(0xff280C0B) : Color(0xffEECED3),
      highlightColor: isDarkTheme ? Color(0xff372901) : Color(0xffFCE192),
      hoverColor: isDarkTheme ? Color(0xff3A3A3B) : Color(0xff4285F4),
      focusColor: isDarkTheme ? Color(0xff0B2512) : Color(0xffA8DAB5),
      disabledColor: Colors.grey,
      textSelectionColor: isDarkTheme ? Colors.white : Colors.black,
      cardColor: isDarkTheme ? Color(0xff3B3B3B) : Colors.white,
      accentColor: isDarkTheme ? AppTheme.blackColor :AppTheme.blackColor,
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
    //  brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      cursorColor: isDarkTheme ? Color(0xFF212121) : AppTheme.lightgrey,
      primaryColorDark:  isDarkTheme ? Colors.black : Colors.white,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),

      appBarTheme: AppBarTheme(
        elevation: 0.0,
        /*brightness: isDarkTheme
            ? Brightness.dark
            : Brightness.light,*/ // this makes status bar text color black
      ),

    );
  }
}
