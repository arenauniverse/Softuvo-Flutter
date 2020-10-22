import 'dart:convert';
import 'dart:io';
import 'package:arena_sports_app/CommonWidgets/Dialogs.dart';
import 'package:arena_sports_app/CommonWidgets/SocialLoginMethods.dart';
import 'package:arena_sports_app/CommonWidgets/Strings.dart';
import 'package:arena_sports_app/CommonWidgets/buttons.dart';
import 'package:arena_sports_app/CommonWidgets/cammonMethods.dart';
import 'package:arena_sports_app/CommonWidgets/errorMessages.dart';
import 'package:arena_sports_app/LogIn/Login_View.dart';
import 'package:arena_sports_app/Register/Register_View.dart';
import 'package:arena_sports_app/SizeConfig.dart';
import 'package:arena_sports_app/myProfile/myProfileView.dart';
import 'package:arena_sports_app/Repos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TestView extends StatefulWidget {
  @override
  _TestViewState createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GestureDetector(
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.only(
                    top: SizeConfig.blockSizeVertical * 10,
                    left: SizeConfig.blockSizeHorizontal * 8,
                    bottom: SizeConfig.blockSizeVertical * 3),
                child: SvgPicture.asset('assets/ArenaLogin.svg'),
              ),
            ),
            onTap: () {
              _showModalSheet();
            },
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              child: Text(
                "Please click on Arena to continue",
                style: TextStyle(
                  fontFamily: AppTheme.appFont,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                ),
              ),
              margin: EdgeInsets.only(
                left: SizeConfig.blockSizeHorizontal * 8,
              ),
            ),
          )
        ],
      ),
    );
  }

  void _showModalSheet() {
    /* Get.bottomSheet(LoginSignUpListingView(),
        elevation: 20.0, isScrollControlled: true);*/
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(25.0),
                topLeft: Radius.circular(25.0))),
        context: context,
        builder: (builder) {
          return LoginSignUpListingView();
        });
  }
}

class LoginSignUpListingView extends StatefulWidget {
  @override
  _LoginSignUpListingViewState createState() => _LoginSignUpListingViewState();
}

class _LoginSignUpListingViewState extends State<LoginSignUpListingView> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<State> _addLoader = new GlobalKey<State>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.blockSizeVertical * 79,
      width: SizeConfig.blockSizeHorizontal,
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: SizeConfig.blockSizeVertical * 2,
                  right: SizeConfig.blockSizeHorizontal * 5),
              child: Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    child: Stack(
                      children: [
                        SvgPicture.asset('assets/closeIcon.svg'),
                        Positioned(
                          top: 5.0,
                          left: 8.0,
                          bottom: 5.0,
                          child: GestureDetector(
                            child: SvgPicture.asset(
                              'assets/cross.svg',
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
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
                  fontFamily: AppTheme.appFont,
                  color: AppTheme.blackColor,
                  fontWeight: FontWeight.w600),
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
                    margin: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockSizeVertical * 2,
                        horizontal: SizeConfig.blockSizeHorizontal * 10),
                    child: ButtonsWidget(
                      onPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyProfileView()),
                        );
                        //     Get.to(MyProfileView());
                      },
                      title: Strings.googleText,
                      image: SvgPicture.asset(
                        'assets/googleIcon.svg',
                        height: 21,
                      ),
                      bottonColor: AppTheme.googleColor,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.blockSizeHorizontal * 10),
                    child: ButtonsWidget(
                      onPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginView()),
                        );
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
                          color: AppTheme.blackColor,
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
                      color: AppTheme.blackColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                      ),
                      child: Text(Strings.registerButtonText,
                          style: TextStyle(
                              color: AppTheme.whiteColor,
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
        Dialogs.showLoadingDialog(context, _addLoader);
        SocialLogin().fbLogin(context: context).then((value) async {
          if (value != null) {
            saveFbDetails(data: value.profile);
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
                savefbToken(data: value.data);
                Navigator.of(_addLoader.currentContext, rootNavigator: true)
                    .pop();
                toast(context: context, msg: Messages.fbLoginSuccess);
              } else {
                Navigator.of(_addLoader.currentContext, rootNavigator: true)
                    .pop();
                toast(context: context, msg: queryResult.exception.toString());
              }
            });
          } else {
            Navigator.of(_addLoader.currentContext, rootNavigator: true).pop();
            toast(
                context: context,
                msg: "Something went wrong. Please login again");
          }
        });
      }
    } on SocketException catch (_) {
      toast(msg: "No Internet Connection", context: context);
    }
  }

  savefbToken({Map<String, dynamic> data}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('fbToken', json.encode(data));
  }

  saveFbDetails({Map<String, dynamic> data}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('fbData', json.encode(data));
  }
}
