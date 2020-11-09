import 'dart:convert';
import 'dart:io';
import 'package:arena_sports_app/CommonWidgets/Dialogs.dart';
import 'package:arena_sports_app/CommonWidgets/SizeConfig.dart';
import 'package:arena_sports_app/CommonWidgets/SocialLoginMethods.dart';
import 'package:arena_sports_app/CommonWidgets/Strings.dart';
import 'package:arena_sports_app/CommonWidgets/buttons.dart';
import 'package:arena_sports_app/CommonWidgets/cammonMethods.dart';
import 'package:arena_sports_app/CommonWidgets/Messages.dart';
import 'package:arena_sports_app/CommonWidgets/sharePreferenceData.dart';
import 'package:arena_sports_app/Repos.dart';
import 'package:arena_sports_app/screens/logIn/Login_View.dart';
import 'package:arena_sports_app/screens/register/Register_View.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:http/http.dart' as http;

import '../../theme.dart';

class LoginSignUpListingView extends StatefulWidget {
  @override
  _LoginSignUpListingViewState createState() => _LoginSignUpListingViewState();
}

class _LoginSignUpListingViewState extends State<LoginSignUpListingView> {
  final GlobalKey<State> _addLoader = new GlobalKey<State>();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(30)),
      ),
      height: Platform.isAndroid
          ? SizeConfig.blockSizeVertical * 70
          : SizeConfig.blockSizeVertical * 75,
      width: SizeConfig.blockSizeHorizontal,
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.only(
                      right: SizeConfig.blockSizeVertical * 2,
                      top: SizeConfig.blockSizeVertical * 2),
                  child: SvgPicture.asset('assets/crossIcon.svg'),
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
                child: SvgPicture.asset('assets/ArenaLogin.svg'),
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 1,
            ),
            Center(
              child: Container(
                child: SvgPicture.asset('assets/SportLogin.svg'),
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 5,
            ),
            Text(
              Strings.listingText,
              style: TextStyle(
                  fontFamily: AppTheme.appFont, fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 3),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.blockSizeHorizontal * 10),
                    child: ButtonsWidget(
                      onPress: () async {
                        QueryResult queryResult;
                        fbLogin(context: context, queryResult: queryResult);
                      },
                      title: Strings.fbText,
                      image: SvgPicture.asset('assets/fbIcon.svg'),
                      bottonColor: AppTheme.fbColor,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: SizeConfig.blockSizeHorizontal * 10,
                      right: SizeConfig.blockSizeHorizontal * 10,
                      top: SizeConfig.blockSizeVertical * 2,
                    ),
                    child: ButtonsWidget(
                      onPress: () {
                        QueryResult queryResult;
                        googleLogin(context: context, queryResult: queryResult);
                      },
                      title: Strings.googleText,
                      image: SvgPicture.asset(
                        'assets/googleIcon.svg',
                        height: 21,
                      ),
                      bottonColor: AppTheme.googleColor,
                    ),
                  ),
                  Platform.isAndroid
                      ? SizedBox()
                      : Container(
                          margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 10,
                            right: SizeConfig.blockSizeHorizontal * 10,
                            top: SizeConfig.blockSizeVertical * 2,
                          ),
                          child: ButtonsWidget(
                            onPress: () async {
                              final credential =
                                  await SignInWithApple.getAppleIDCredential(
                                scopes: [
                                  AppleIDAuthorizationScopes.email,
                                  AppleIDAuthorizationScopes.fullName,
                                ],
                                webAuthenticationOptions:
                                    WebAuthenticationOptions(
                                  // TODO: Set the `clientId` and `redirectUri` arguments to the values you entered in the Apple Developer portal during the setup
                                  clientId: 'com.softuvo.arenasports',
                                  redirectUri: Uri.parse(
                                    'https://www.softuvo.com',
                                  ),
                                ),
                                // TODO: Remove these if you have no need for them
                                nonce: 'example-nonce',
                                state: 'example-state',
                              );

                              print(credential);

                              // This is the endpoint that will convert an authorization code obtained
                              // via Sign in with Apple into a session in your system
                              final signInWithAppleEndpoint = Uri(
                                scheme: 'https',
                                host: 'www.softuvo.com',
                                path: '',
                                queryParameters: <String, String>{
                                  'code': credential.authorizationCode,
                                  'firstName': credential.givenName,
                                  'lastName': credential.familyName,
                                  'useBundleId':
                                      Platform.isIOS || Platform.isMacOS
                                          ? 'true'
                                          : 'false',
                                  if (credential.state != null)
                                    'state': credential.state,
                                },
                              );

                              final session = await http.Client().post(
                                signInWithAppleEndpoint,
                              );

                              // If we got this far, a session based on the Apple ID credential has been created in your system,
                              // and you can now set this as the app's session
                              print(session);
                              //     Get.to(LoginView(), popGesture: false);
                            },
                            title: Strings.appleText,
                            image: SvgPicture.asset('assets/appleIcon.svg'),
                            bottonColor: AppTheme.blackColor,
                          ),
                        ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockSizeVertical * 2,
                        horizontal: SizeConfig.blockSizeHorizontal * 10),
                    child: ButtonsWidget(
                      onPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginView()),
                        );
                      },
                      title: Strings.emailText,
                      image: SvgPicture.asset('assets/mailIcon.svg'),
                      bottonColor: AppTheme.blackColor,
                    ),
                  ),
                  Text("O",
                      style: TextStyle(
                          fontFamily: AppTheme.appFont,
                          fontWeight: FontWeight.w500)),
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockSizeVertical * 2,
                        horizontal: SizeConfig.blockSizeHorizontal * 10),
                    child: RaisedButton(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.blockSizeHorizontal * 28,
                          vertical: SizeConfig.blockSizeVertical * 1.9),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterView()),
                        );
                      },
                      color: Theme.of(context).accentColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                      ),
                      child: Text(Strings.registerButtonText,
                          style: TextStyle(
                              color: Theme.of(context).primaryColorDark,
                              fontWeight: FontWeight.w500,
                              fontFamily: AppTheme.appFont)),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future fbLogin({BuildContext context, QueryResult queryResult}) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        /* Dialogs.showLoadingDialog(context, _addLoader);*/
        SocialLogin().fbLogin(context: context).then((value) async {
          if (value != null) {
            SharedPreferenceData().saveFbDetails(data: value.profile);
            GraphQLClient _client = graphQLConfiguration.clientToQuery();
            QueryResult result = await _client
                .mutate(
              MutationOptions(
                  documentNode: gql(
                addMutation.fbLogin(token: value.token.toString()),
              )),
            )
                .then((value) {
              queryResult = value;
              if (!queryResult.hasException) {
                SharedPreferenceData().saveFbToken(data: value.data);
                /*    Navigator.of(_addLoader.currentContext, rootNavigator: true)
                    .pop();*/
                toast(context: context, msg: Messages.fbLoginSuccess);
                Navigator.pop(context);
              } else {
                /*   Navigator.of(_addLoader.currentContext, rootNavigator: true)
                    .pop();*/
                toast(context: context, msg: queryResult.exception.toString());
              }
            });
          } else {
            var errorMessage = queryResult.exception.toString().split(':');
            /*  Navigator.of(_addLoader.currentContext, rootNavigator: true).pop();*/
            toast(context: context, msg: errorMessage[2]);
          }
        });
      }
    } on SocketException catch (_) {
      toast(msg: Messages.noConnection, context: context);
    }
  }

  Future googleLogin({BuildContext context, QueryResult queryResult}) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        Dialogs.showLoadingDialog(context, _addLoader);
        SocialLogin().googleLogin().then((value) async {
          if (value != null) {
            //  SharedPreferenceData().saveGoogleDetails(data: value.googleProfile);
            GraphQLClient _client = graphQLConfiguration.clientToQuery();
            QueryResult result = await _client
                .mutate(
              MutationOptions(
                  documentNode: gql(
                addMutation.googleLogin(token: value.googleToken),
              )),
            )
                .then((value) {
              queryResult = value;
              if (!queryResult.hasException) {
                SharedPreferenceData().saveGoogleToken(data: value.data);
                Navigator.of(_addLoader.currentContext, rootNavigator: true)
                    .pop();
                toast(context: context, msg: Messages.fbLoginSuccess);
              } else {
                var errorMessage = queryResult.exception.toString().split(':');
                Navigator.of(_addLoader.currentContext, rootNavigator: true)
                    .pop();
                print(
                    "errorMessage : " + "" + queryResult.exception.toString());
                toast(context: context, msg: queryResult.exception.toString());
              }
            });
          }
        });
      }
    } on SocketException catch (_) {
      toast(msg: Messages.noConnection, context: context);
    }
  }
}
