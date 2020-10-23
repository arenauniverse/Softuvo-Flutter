import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceData {
  savefbToken({Map<String, dynamic> data}) async {
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
}
