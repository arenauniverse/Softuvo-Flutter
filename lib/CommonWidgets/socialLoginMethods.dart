import 'package:flutter/painting.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
final GoogleSignIn googleSignIn = GoogleSignIn();



Future<GoogleSignInAccount> login() async {
  GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount getCredentials;
  await _googleSignIn.signIn().then((GoogleSignInAccount acc) async {
    getCredentials = acc;
    print(acc.id);
    print(acc.email);
    print(acc.displayName);
    print(acc.photoUrl);

    acc.authentication.then((GoogleSignInAuthentication auth) async {
      print(auth.idToken);
      print(auth.accessToken);
    });
  });
  return getCredentials;
}



/*
Future<FacebookLogin> _handleFBSignIn() async {
  final facebookLogin = FacebookLogin();

  final facebookLoginResult = await facebookLogin.logIn(['email']);
  String fbUrl;

  switch (facebookLoginResult.status) {
    case FacebookLoginStatus.cancelledByUser:
      break;
    case FacebookLoginStatus.error:
      print("Error apps " + facebookLoginResult.errorMessage);
      break;
    case FacebookLoginStatus.loggedIn:
      final token = facebookLoginResult.accessToken.token;
      fbUrl =
      'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email,picture.width(100).height(100)&access_token=$token';
      print(fbUrl);

      var graphResponse = await http.get(fbUrl);

      if (graphResponse.statusCode == 200) {
        FbUser fbuser = fbUserFromJson(graphResponse.body);
        print('name is res.............${fbuser.name}');
        print('email is res.............${fbuser.email}');
*/
/*
          Future.delayed(const Duration(seconds: 5), () {
            setState(() {
              _emailcontroller.text = fbuser.email;
              _fnamecontroller.text = fbuser.firstName;
              _lnamecontroller.text = fbuser.lastName;
            });
          });*//*

      } else {
        print("Error");
      }
      break;
  }
  return facebookLoginResult;
}
*/
