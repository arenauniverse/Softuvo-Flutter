import 'package:arena_sports_app/LoginSignUpListing/LoginSgnupListingView.dart';
import 'package:arena_sports_app/SizeConfig.dart';
import 'package:arena_sports_app/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';

class UserDahboardView extends StatefulWidget {
  @override
  _UserDahboardViewState createState() => _UserDahboardViewState();
}

class _UserDahboardViewState extends State<UserDahboardView> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backGroundColor,
      body: Stack(
        children: [
          Card(
            elevation: 1,
            child: Container(
              color: Colors.white,
              height: SizeConfig.blockSizeVertical * 23,
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 8,
                          left: SizeConfig.blockSizeHorizontal * 4,
                          right: SizeConfig.blockSizeHorizontal * 4,
                          bottom: SizeConfig.blockSizeVertical * 2),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _showModalSheet();
                            },
                            child: SvgPicture.asset('assets/ArenaLogin.svg'),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: SizeConfig.blockSizeVertical * 0.5,
                              left: SizeConfig.blockSizeHorizontal * 23,
                            ),
                            child: Text(
                              "Live",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                          ),
                          FlutterSwitch(
                            activeColor: AppTheme.blueColor,
                            inactiveColor: AppTheme.toggleColor,
                            width: 50.0,
                            height: 28.0,
                            toggleSize: 18.0,
                            value: status,
                            borderRadius: 20.0,
                            padding: 5.0,
                            onToggle: (val) {
                              setState(() {
                                status = val;
                              });
                            },
                          ),
                          SizedBox(width: SizeConfig.blockSizeHorizontal * 3),
                          Container(
                            child: CircleAvatar(
                              radius: 18,
                              backgroundColor: AppTheme.greyColor,
                              child: SvgPicture.asset(
                                  'assets/searchIcon.svg'), /*Icon(
                                Icons.search_rounded,
                                color: AppTheme.blackColor,
                              ),*/
                            ),
                          )
                        ],
                      )),
                  Container(
                    margin: EdgeInsets.only(
                      left: SizeConfig.blockSizeHorizontal * 4,
                      right: SizeConfig.blockSizeHorizontal * 4,
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Icon(Icons.sports_baseball, size: 40),
                          Icon(Icons.sports_basketball, size: 40),
                          Icon(Icons.sports_baseball_sharp, size: 40),
                          Icon(Icons.sports_football_rounded, size: 40),
                          Icon(Icons.sports_baseball, size: 40),
                          Icon(Icons.sports_basketball, size: 40),
                          Icon(Icons.sports_baseball_sharp, size: 40),
                          Icon(Icons.sports_basketball, size: 40),
                          Icon(Icons.sports_baseball_sharp, size: 40),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: SizeConfig.blockSizeVertical * 26,
                left: SizeConfig.blockSizeHorizontal * 4,
                right: SizeConfig.blockSizeHorizontal * 4,
                bottom: SizeConfig.blockSizeVertical * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "EN VIVO",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                            height: SizeConfig.blockSizeVertical * 20,
                            width: SizeConfig.blockSizeHorizontal * 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Text("US OPEN",
                                          style: TextStyle(
                                              color: AppTheme.greyColor)),
                                      Spacer(),
                                      Text(
                                        "62’",
                                        style: TextStyle(
                                            color: AppTheme.borderColor),
                                      ),
                                      SizedBox(
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  3),
                                      SvgPicture.asset('assets/square.svg'),
                                      SizedBox(
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  3),
                                      SvgPicture.asset(
                                          'assets/notification.svg'),
                                    ],
                                  ),
                                  margin: EdgeInsets.only(
                                      top: SizeConfig.blockSizeVertical * 2,
                                      left: SizeConfig.blockSizeHorizontal * 2,
                                      right:
                                          SizeConfig.blockSizeHorizontal * 2),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.supervised_user_circle_rounded,
                                        color: AppTheme.greyColor,
                                      ),
                                      /*  SvgPicture.asset('assets/userIcon.svg'),*/
                                      Text(
                                        "D. Thiem",
                                        style: TextStyle(
                                            color: AppTheme.blackColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      SizedBox(
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  3),
                                      Spacer(),
                                      SvgPicture.asset('assets/circleIcon.svg'),
                                      SizedBox(
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  4),
                                      Text(
                                        "2",
                                        style: TextStyle(
                                            color: AppTheme.blackColor,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  3),
                                      Container(
                                        padding: EdgeInsets.all(4.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          color: AppTheme.greyColor,
                                        ),
                                        child: Text(
                                          "2",
                                          style: TextStyle(
                                              color: AppTheme.blackColor,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ],
                                  ),
                                  margin: EdgeInsets.only(
                                      top: SizeConfig.blockSizeVertical * 2,
                                      left: SizeConfig.blockSizeHorizontal * 2,
                                      right:
                                          SizeConfig.blockSizeHorizontal * 2),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.supervised_user_circle_rounded,
                                        color: AppTheme.greyColor,
                                      ),
                                      /*  SvgPicture.asset('assets/userIcon.svg'),*/
                                      Text(
                                        "D. Thiem",
                                        style: TextStyle(
                                            color: AppTheme.blackColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      SizedBox(
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  3),
                                      Spacer(),
                                      SvgPicture.asset('assets/circleIcon.svg'),
                                      SizedBox(
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  4),
                                      Text(
                                        "2",
                                        style: TextStyle(
                                            color: AppTheme.blackColor,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  3),
                                      Container(
                                        padding: EdgeInsets.all(4.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          color: AppTheme.greyColor,
                                        ),
                                        child: Text(
                                          "2",
                                          style: TextStyle(
                                              color: AppTheme.blackColor,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ],
                                  ),
                                  margin: EdgeInsets.only(
                                      top: SizeConfig.blockSizeVertical * 2,
                                      left: SizeConfig.blockSizeHorizontal * 2,
                                      right:
                                          SizeConfig.blockSizeHorizontal * 2),
                                )
                              ],
                            )),
                        Container(
                            height: SizeConfig.blockSizeVertical * 20,
                            width: SizeConfig.blockSizeHorizontal * 70,
                            margin: EdgeInsets.only(
                                left: SizeConfig.blockSizeHorizontal * 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Text("US OPEN",
                                          style: TextStyle(
                                              color: AppTheme.greyColor)),
                                      Spacer(),
                                      Text(
                                        "62’",
                                        style: TextStyle(
                                            color: AppTheme.borderColor),
                                      ),
                                      SizedBox(
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  3),
                                      SvgPicture.asset('assets/square.svg'),
                                      SizedBox(
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  3),
                                      SvgPicture.asset(
                                          'assets/notification.svg'),
                                    ],
                                  ),
                                  margin: EdgeInsets.only(
                                      top: SizeConfig.blockSizeVertical * 2,
                                      left: SizeConfig.blockSizeHorizontal * 2,
                                      right:
                                          SizeConfig.blockSizeHorizontal * 2),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.supervised_user_circle_rounded,
                                        color: AppTheme.greyColor,
                                      ),
                                      /*  SvgPicture.asset('assets/userIcon.svg'),*/
                                      Text(
                                        "D. Thiem",
                                        style: TextStyle(
                                            color: AppTheme.blackColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      SizedBox(
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  3),
                                      Spacer(),
                                      SvgPicture.asset('assets/circleIcon.svg'),
                                      SizedBox(
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  4),
                                      Text(
                                        "2",
                                        style: TextStyle(
                                            color: AppTheme.blackColor,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  3),
                                      Container(
                                        padding: EdgeInsets.all(4.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          color: AppTheme.greyColor,
                                        ),
                                        child: Text(
                                          "2",
                                          style: TextStyle(
                                              color: AppTheme.blackColor,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ],
                                  ),
                                  margin: EdgeInsets.only(
                                      top: SizeConfig.blockSizeVertical * 2,
                                      left: SizeConfig.blockSizeHorizontal * 2,
                                      right:
                                          SizeConfig.blockSizeHorizontal * 2),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.supervised_user_circle_rounded,
                                        color: AppTheme.greyColor,
                                      ),
                                      /*  SvgPicture.asset('assets/userIcon.svg'),*/
                                      Text(
                                        "D. Thiem",
                                        style: TextStyle(
                                            color: AppTheme.blackColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      SizedBox(
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  3),
                                      Spacer(),
                                      SvgPicture.asset('assets/circleIcon.svg'),
                                      SizedBox(
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  4),
                                      Text(
                                        "2",
                                        style: TextStyle(
                                            color: AppTheme.blackColor,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  3),
                                      Container(
                                        padding: EdgeInsets.all(4.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          color: AppTheme.greyColor,
                                        ),
                                        child: Text(
                                          "2",
                                          style: TextStyle(
                                              color: AppTheme.blackColor,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ],
                                  ),
                                  margin: EdgeInsets.only(
                                      top: SizeConfig.blockSizeVertical * 2,
                                      left: SizeConfig.blockSizeHorizontal * 2,
                                      right:
                                          SizeConfig.blockSizeHorizontal * 2),
                                )
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Noticias",
                            style: TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 16),
                          ),
                          GestureDetector(
                            child: Text(
                              "Ver todos",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: AppTheme.blueColor),
                            ),
                            onTap: () {},
                          )
                        ],
                      ),
                      Divider(
                        color: AppTheme.blackColor,
                      ),
                      Container(
                          child: SvgPicture.asset('assets/newsImage.svg'),
                          margin: EdgeInsets.only(
                              top: SizeConfig.blockSizeVertical * 2))
                    ],
                  ),
                  padding: EdgeInsets.only(
                      left: SizeConfig.blockSizeHorizontal * 2,
                      right: SizeConfig.blockSizeHorizontal * 2,
                      top: SizeConfig.blockSizeVertical * 2),
                  margin: EdgeInsets.only(
                      left: SizeConfig.blockSizeHorizontal * 1,
                      right: SizeConfig.blockSizeHorizontal * 1,
                      top: SizeConfig.blockSizeVertical * 2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppTheme.whiteColor),
                )
              ],
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
