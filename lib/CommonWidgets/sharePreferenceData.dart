import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceData {
  saveFbToken({Map<String, dynamic> data}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('fbToken', json.encode(data));
  }

  saveFbDetails({Map<String, dynamic> data}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('fbData', json.encode(data));
  }

  saveGoogleToken({Map<String, dynamic> data}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('googleToken', json.encode(data));
  }

  saveGoogleDetails({Map<String, dynamic> data}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('googleData', json.encode(data));
  }

   saveSelectedThemeMode(bool value) async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     prefs.setBool('themeMode',value);
   }
    Future<bool> getSelectedThemeMode() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getBool('themeMode') ?? false ;
    }

}
