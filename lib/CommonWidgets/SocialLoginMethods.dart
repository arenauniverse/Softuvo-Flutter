import 'package:arena_sports_app/CommonWidgets/cammonMethods.dart';
import 'package:arena_sports_app/LoginSignUpListing/UserResults.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:google_sign_in/google_sign_in.dart';

class SocialLogin {
  Future<UserResults> fbLogin({BuildContext context}) async {
    final facebookLogin = FacebookLogin();
    final facebookLoginResult = await facebookLogin.logIn(['email']);
    var profile, token;
    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.cancelledByUser:
        break;
      case FacebookLoginStatus.error:
        print("Error apps " + facebookLoginResult.errorMessage);
        break;
      case FacebookLoginStatus.loggedIn:
        token = facebookLoginResult.accessToken.token;
        print("token" + token);
        final graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email,picture.width(100).height(100)&access_token=$token');
        if (graphResponse.statusCode == 200) {
          profile = json.decode(graphResponse.body);
          print("profile" + profile.toString());
        } else {
          toast(context: context, msg: "Something went Wrong");
          print("Error");
        }
        break;
    }
    var results = UserResults(token: token, profile: profile);
    return results;
  }

  Future<UserResults> googleLogin() async {
    GoogleSignIn _googleSignIn = GoogleSignIn();
    var results;
    await _googleSignIn.signIn().then((GoogleSignInAccount acc) async {
      await acc.authentication.then((GoogleSignInAuthentication auth) async {
        results = UserResults(googleProfile: acc, googleToken: auth.idToken);
        print("res" + results.toString());
      });
    });
    return results;
  }
}
