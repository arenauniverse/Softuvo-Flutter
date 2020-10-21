import 'package:arena_sports_app/CommonWidgets/Strings.dart';
import 'package:arena_sports_app/CommonWidgets/buttons.dart';
import 'package:arena_sports_app/LogIn/Login_View.dart';
import 'package:arena_sports_app/Register/Register_View.dart';
import 'package:arena_sports_app/SizeConfig.dart';
import 'package:arena_sports_app/myProfile/myProfileView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme.dart';

class TestView extends StatefulWidget {
  @override
  _TestViewState createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
            child: Text(
          Strings.arena,
          style: TextStyle(
              fontFamily: AppTheme.appFont,
              color: AppTheme.blackColor,
              fontSize: 40.0),
        )),
        onTap: () {
          _showModalSheet();
        },
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
              padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 5),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.blockSizeHorizontal * 10),
                    child: ButtonsWidget(
                      onPress: () {},
                      title:  Strings.fbText,
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
                      title:  Strings.googleText,
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
                      title:  Strings.appleText,
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
                      title:  Strings.emailText,
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
                      child: Text( Strings.registerButtonText,
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
}
