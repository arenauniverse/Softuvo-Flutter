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
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: AppTheme.greyColor,
        selectedItemColor: AppTheme.blackColor,
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
              title: Text(""), icon: SvgPicture.asset('assets/tab1.svg')),
          BottomNavigationBarItem(
              title: Text(""),
              icon: SvgPicture.asset(
                'assets/tab2.svg',
                color: AppTheme.greyColor,
              )),
          BottomNavigationBarItem(
              title: Text(""), icon: SvgPicture.asset('assets/tab3.svg')),
          BottomNavigationBarItem(
              title: Text(""),
              icon: SvgPicture.asset('assets/tab4.svg',
                  color: AppTheme.greyColor)),
          BottomNavigationBarItem(
              title: Text(""),
              icon: SvgPicture.asset('assets/tab5.svg',
                  color: AppTheme.greyColor)),
        ],
      ),
      backgroundColor: AppTheme.backGroundColor,
      body: Stack(
        children: [
          Card(
            elevation: 1,
            child: Container(
              color: Colors.white,
              height: SizeConfig.blockSizeVertical * 23,
              width: SizeConfig.blockSizeHorizontal * 100,
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 8,
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
                              left: SizeConfig.blockSizeHorizontal * 28,
                            ),
                            child: Text(
                              "Live",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(width: SizeConfig.blockSizeHorizontal * 2),
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
                              radius: 16,
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
                          SvgPicture.asset('assets/Barcelona.svg'),
                          SizedBox(
                            width: 15.0,
                          ),
                          SvgPicture.asset('assets/Manchester.svg'),
                          SizedBox(
                            width: 15.0,
                          ),
                          SvgPicture.asset('assets/Escudo.svg'),
                          SizedBox(
                            width: 15.0,
                          ),
                          SvgPicture.asset('assets/Barcelona.svg'),
                          SizedBox(
                            width: 15.0,
                          ),
                          SvgPicture.asset('assets/Manchester.svg'),
                          SizedBox(
                            width: 15.0,
                          ),
                          SvgPicture.asset('assets/Escudo.svg'),
                          SizedBox(
                            width: 15.0,
                          ),
                          SvgPicture.asset('assets/Manchester.svg'),
                          SizedBox(
                            width: 15.0,
                          ),
                          SvgPicture.asset('assets/Escudo.svg'),
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
                top: SizeConfig.blockSizeVertical * 22,
                left: SizeConfig.blockSizeHorizontal * 2,
                right: SizeConfig.blockSizeHorizontal * 2,
                bottom: SizeConfig.blockSizeVertical * 2),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "EN VIVO",
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 16),
                      ),
                      margin: EdgeInsets.only(
                          left: SizeConfig.blockSizeHorizontal * 2),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 2),
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
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  3),
                                          SvgPicture.asset('assets/square.svg'),
                                          SizedBox(
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  3),
                                          SvgPicture.asset(
                                              'assets/notification.svg'),
                                        ],
                                      ),
                                      margin: EdgeInsets.only(
                                          top: SizeConfig.blockSizeVertical * 2,
                                          left: SizeConfig.blockSizeHorizontal *
                                              2,
                                          right:
                                              SizeConfig.blockSizeHorizontal *
                                                  2),
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons
                                                .supervised_user_circle_rounded,
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
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  3),
                                          Spacer(),
                                          SvgPicture.asset(
                                              'assets/circleIcon.svg'),
                                          SizedBox(
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  4),
                                          Text(
                                            "2",
                                            style: TextStyle(
                                                color: AppTheme.blackColor,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
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
                                          left: SizeConfig.blockSizeHorizontal *
                                              2,
                                          right:
                                              SizeConfig.blockSizeHorizontal *
                                                  2),
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons
                                                .supervised_user_circle_rounded,
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
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  3),
                                          Spacer(),
                                          SvgPicture.asset(
                                              'assets/circleIcon.svg'),
                                          SizedBox(
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  4),
                                          Text(
                                            "2",
                                            style: TextStyle(
                                                color: AppTheme.blackColor,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
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
                                          left: SizeConfig.blockSizeHorizontal *
                                              2,
                                          right:
                                              SizeConfig.blockSizeHorizontal *
                                                  2),
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
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  3),
                                          SvgPicture.asset('assets/square.svg'),
                                          SizedBox(
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  3),
                                          SvgPicture.asset(
                                              'assets/notification.svg'),
                                        ],
                                      ),
                                      margin: EdgeInsets.only(
                                          top: SizeConfig.blockSizeVertical * 2,
                                          left: SizeConfig.blockSizeHorizontal *
                                              2,
                                          right:
                                              SizeConfig.blockSizeHorizontal *
                                                  2),
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons
                                                .supervised_user_circle_rounded,
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
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  3),
                                          Spacer(),
                                          SvgPicture.asset(
                                              'assets/circleIcon.svg'),
                                          SizedBox(
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  4),
                                          Text(
                                            "2",
                                            style: TextStyle(
                                                color: AppTheme.blackColor,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
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
                                          left: SizeConfig.blockSizeHorizontal *
                                              2,
                                          right:
                                              SizeConfig.blockSizeHorizontal *
                                                  2),
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons
                                                .supervised_user_circle_rounded,
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
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  3),
                                          Spacer(),
                                          SvgPicture.asset(
                                              'assets/circleIcon.svg'),
                                          SizedBox(
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  4),
                                          Text(
                                            "2",
                                            style: TextStyle(
                                                color: AppTheme.blackColor,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
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
                                          left: SizeConfig.blockSizeHorizontal *
                                              2,
                                          right:
                                              SizeConfig.blockSizeHorizontal *
                                                  2),
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
                          Container(
                            margin: EdgeInsets.only(
                                right: SizeConfig.blockSizeHorizontal * 2,
                                left: SizeConfig.blockSizeHorizontal * 2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Noticias",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 16),
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
                          ),
                          Divider(
                            color: AppTheme.blackColor,
                          ),
                          Container(
                              child: Image.asset('assets/Image.png'),
                              margin: EdgeInsets.only(
                                  top: SizeConfig.blockSizeVertical * 2)),
                          Container(
                              child: Text(
                                  "Messi entrena con el grupo del \ Barcelona por primera vez bajo el mando de Koeman",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12)),
                              margin: EdgeInsets.only(
                                  top: SizeConfig.blockSizeVertical * 2)),
                          Container(
                            margin: EdgeInsets.only(
                                top: SizeConfig.blockSizeVertical * 2),
                            child: Row(
                              children: [
                                Stack(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/Rectangle.svg',
                                      width: SizeConfig.blockSizeHorizontal * 8,
                                    ),
                                    Positioned(
                                      top: 5.0,
                                      left: 2.0,
                                      bottom: 5.0,
                                      child: GestureDetector(
                                        child: SvgPicture.asset(
                                          'assets/Shape.svg',
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  7,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 3.0,
                                ),
                                Text("ESPN"),
                                SizedBox(
                                  width: 8.0,
                                ),
                                Text(
                                  "58 min",
                                  style: TextStyle(color: AppTheme.greyColor),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: AppTheme.blackColor,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    right: SizeConfig.blockSizeHorizontal * 3),
                                height: 80,
                                child: Image.asset(
                                  'assets/newsImage.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Koeman le comunica a Sergio  Busquets su ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top:
                                              SizeConfig.blockSizeVertical * 1),
                                      child: Row(
                                        children: [
                                          Stack(
                                            children: [
                                              SvgPicture.asset(
                                                'assets/Rectangle.svg',
                                                width: SizeConfig
                                                        .blockSizeHorizontal *
                                                    8,
                                              ),
                                              Positioned(
                                                top: 5.0,
                                                left: 2.0,
                                                bottom: 5.0,
                                                child: GestureDetector(
                                                  child: SvgPicture.asset(
                                                    'assets/Shape.svg',
                                                    width: SizeConfig
                                                            .blockSizeHorizontal *
                                                        7,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            width: 3.0,
                                          ),
                                          Text("ESPN"),
                                          SizedBox(
                                            width: 8.0,
                                          ),
                                          Text(
                                            "58 min",
                                            style: TextStyle(
                                                color: AppTheme.greyColor),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Divider(
                            color: AppTheme.blackColor,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    right: SizeConfig.blockSizeHorizontal * 3),
                                height: 80,
                                child: Image.asset(
                                  'assets/newsImage.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              /*SvgPicture.asset(
                                'assets/newsImage.svg',
                                width: SizeConfig.blockSizeHorizontal * 8,
                              ),*/
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Koeman le comunica a Sergio  Busquets su ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top:
                                              SizeConfig.blockSizeVertical * 1),
                                      child: Row(
                                        children: [
                                          Stack(
                                            children: [
                                              SvgPicture.asset(
                                                'assets/Rectangle.svg',
                                                width: SizeConfig
                                                        .blockSizeHorizontal *
                                                    8,
                                              ),
                                              Positioned(
                                                top: 5.0,
                                                left: 2.0,
                                                bottom: 5.0,
                                                child: GestureDetector(
                                                  child: SvgPicture.asset(
                                                    'assets/Shape.svg',
                                                    width: SizeConfig
                                                            .blockSizeHorizontal *
                                                        7,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            width: 3.0,
                                          ),
                                          Text("ESPN"),
                                          SizedBox(
                                            width: 8.0,
                                          ),
                                          Text(
                                            "58 min",
                                            style: TextStyle(
                                                color: AppTheme.greyColor),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Divider(
                            color: AppTheme.blackColor,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    right: SizeConfig.blockSizeHorizontal * 5),
                                child: Text(
                                  "11.08",
                                  style: TextStyle(color: AppTheme.greyColor),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "Pirlo confirmó que no tendrá en cuenta a Higuaín en Juventus",
                                  style: TextStyle(
                                      color: AppTheme.blackColor,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              /*SvgPicture.asset(
                                'assets/newsImage.svg',
                                width: SizeConfig.blockSizeHorizontal * 8,
                              ),*/
                            ],
                          ),
                          Divider(
                            color: AppTheme.blackColor,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    right: SizeConfig.blockSizeHorizontal * 5),
                                child: Text(
                                  "11.08",
                                  style: TextStyle(color: AppTheme.greyColor),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "Pirlo confirmó que no tendrá en cuenta a Higuaín en Juventus",
                                  style: TextStyle(
                                      color: AppTheme.blackColor,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              /*SvgPicture.asset(
                                'assets/newsImage.svg',
                                width: SizeConfig.blockSizeHorizontal * 8,
                              ),*/
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: SizeConfig.blockSizeHorizontal * 2,
                                right: SizeConfig.blockSizeHorizontal * 2,
                                top: SizeConfig.blockSizeVertical * 2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "VIDEOS",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 16),
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
                          ),
                          Divider(
                            color: AppTheme.blackColor,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Card(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: AppTheme.whiteColor,
                                    ),
                                    height: SizeConfig.blockSizeVertical * 22,
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            Container(
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  50,
                                              child: Image.asset(
                                                'assets/videoImage.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Positioned(
                                              top: 5.0,
                                              left: 80.0,
                                              bottom: 5.0,
                                              child: GestureDetector(
                                                child: SvgPicture.asset(
                                                  'assets/playIcon.svg',
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 5),
                                          child: FittedBox(
                                            child: Text(
                                              "Jugadas principales",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: AppTheme.whiteColor,
                                    ),
                                    height: SizeConfig.blockSizeVertical * 22,
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            Container(
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  50,
                                              child: Image.asset(
                                                'assets/videoImage.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Positioned(
                                              top: 5.0,
                                              left: 80.0,
                                              bottom: 5.0,
                                              child: GestureDetector(
                                                child: SvgPicture.asset(
                                                  'assets/playIcon.svg',
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 5),
                                          child: FittedBox(
                                            child: Text(
                                              "Jugadas principales",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      padding: EdgeInsets.only(
                          left: SizeConfig.blockSizeHorizontal * 2,
                          right: SizeConfig.blockSizeHorizontal * 2,
                          top: SizeConfig.blockSizeVertical * 2),
                      margin: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppTheme.whiteColor),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                left: SizeConfig.blockSizeHorizontal * 2,
                                right: SizeConfig.blockSizeHorizontal * 2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Partidos",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 16),
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
                          ),
                          Divider(
                            color: AppTheme.blackColor,
                          ),
                          Text(
                            "UEFA Champions League",
                            style: TextStyle(
                                fontSize: 16, color: AppTheme.greyColor),
                          ),
                          ListView.builder(
                              physics: ClampingScrollPhysics(),
                              itemCount: 2,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext ctxt, int index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/Borusia Dourmunt.svg'),
                                          SizedBox(
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  2),
                                          Container(
                                            width:
                                                SizeConfig.blockSizeHorizontal *
                                                    30,
                                            child: Text(
                                              "Borussia Dortmund",
                                              style: TextStyle(
                                                  color: AppTheme.blackColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                            ),
                                          ),
                                          SizedBox(
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  3),
                                          Spacer(),
                                          SvgPicture.asset(
                                              'assets/circleIcon.svg'),
                                          SizedBox(
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  2),
                                          SvgPicture.asset(
                                              'assets/circleIcon.svg'),
                                          SizedBox(
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  2),
                                          SvgPicture.asset(
                                              'assets/circleIcon.svg'),
                                          SizedBox(
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  2),
                                          SvgPicture.asset(
                                              'assets/circleIcon.svg'),
                                          SizedBox(
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  3),
                                          Text(
                                            "21:00",
                                            style: TextStyle(
                                                color: AppTheme.blackColor,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  3),
                                          SvgPicture.asset(
                                              'assets/notification.svg'),
                                        ],
                                      ),
                                      margin: EdgeInsets.only(
                                          top: SizeConfig.blockSizeVertical * 2,
                                          right:
                                              SizeConfig.blockSizeHorizontal *
                                                  2),
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/Borusia Dourmunt.svg'),
                                          SizedBox(
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  2),
                                          Container(
                                            width:
                                                SizeConfig.blockSizeHorizontal *
                                                    30,
                                            child: Text(
                                              "Borussia Dortmund",
                                              style: TextStyle(
                                                color: AppTheme.blackColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  3),
                                          Spacer(),
                                          SvgPicture.asset(
                                              'assets/circleIcon.svg'),
                                          SizedBox(
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  2),
                                          SvgPicture.asset(
                                              'assets/circleIcon.svg'),
                                          SizedBox(
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  2),
                                          SvgPicture.asset(
                                              'assets/circleIcon.svg'),
                                          SizedBox(
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  2),
                                          SvgPicture.asset(
                                              'assets/circleIcon.svg'),
                                          SizedBox(
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  3),
                                          Text(
                                            "Direct TV",
                                            style: TextStyle(
                                                color: AppTheme.greyColor,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  3),
                                          SvgPicture.asset('assets/square.svg'),
                                        ],
                                      ),
                                      margin: EdgeInsets.only(
                                          top: SizeConfig.blockSizeVertical * 3,
                                          right:
                                              SizeConfig.blockSizeHorizontal *
                                                  2),
                                    ),
                                  ],
                                );
                              }),
                        ],
                      ),
                      padding: EdgeInsets.only(
                          left: SizeConfig.blockSizeHorizontal * 2,
                          right: SizeConfig.blockSizeHorizontal * 2,
                          bottom: SizeConfig.blockSizeHorizontal * 2,
                          top: SizeConfig.blockSizeVertical * 2),
                      margin: EdgeInsets.only(
                          left: SizeConfig.blockSizeHorizontal * 1,
                          right: SizeConfig.blockSizeHorizontal * 1,
                          top: SizeConfig.blockSizeVertical * 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppTheme.whiteColor),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              left: SizeConfig.blockSizeHorizontal * 2,
                              right: SizeConfig.blockSizeHorizontal * 2,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Traspasos",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 16),
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
                          ),
                          Divider(
                            color: AppTheme.blackColor,
                          ),
                          ListView.builder(
                              physics: ClampingScrollPhysics(),
                              itemCount: 1,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext ctxt, int index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons
                                                .supervised_user_circle_rounded,
                                            color: AppTheme.greyColor,
                                            size: 30,
                                          ),
                                          SizedBox(
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  2),
                                          Column(
                                            children: [
                                              Container(
                                                width: SizeConfig
                                                        .blockSizeHorizontal *
                                                    25,
                                                child: Text(
                                                  "Luis Suárez",
                                                  style: TextStyle(
                                                      color:
                                                          AppTheme.blackColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14),
                                                ),
                                              ),
                                              Container(
                                                width: SizeConfig
                                                        .blockSizeHorizontal *
                                                    25,
                                                child: Text(
                                                  "Barcelona FC",
                                                  style: TextStyle(
                                                      color: AppTheme.greyColor,
                                                      fontSize: 14),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SvgPicture.asset('assets/Check.svg'),
                                          SizedBox(
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  3),
                                          SvgPicture.asset(
                                              'assets/athletic-club-madrid.svg'),
                                          SizedBox(
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  3),
                                          Column(
                                            children: [
                                              Container(
                                                width: SizeConfig
                                                        .blockSizeHorizontal *
                                                    20,
                                                child: Text(
                                                  "A. Madrid",
                                                  style: TextStyle(
                                                      color:
                                                          AppTheme.blackColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15),
                                                ),
                                              ),
                                              Container(
                                                width: SizeConfig
                                                        .blockSizeHorizontal *
                                                    20,
                                                child: Text(
                                                  "Prestamo",
                                                  style: TextStyle(
                                                      color: AppTheme.greyColor,
                                                      fontSize: 12),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      margin: EdgeInsets.only(
                                          top: SizeConfig.blockSizeVertical * 2,
                                          right:
                                              SizeConfig.blockSizeHorizontal *
                                                  2),
                                    ),
                                  ],
                                );
                              }),
                        ],
                      ),
                      padding: EdgeInsets.only(
                          left: SizeConfig.blockSizeHorizontal * 2,
                          right: SizeConfig.blockSizeHorizontal * 2,
                          top: SizeConfig.blockSizeVertical * 2,
                          bottom: SizeConfig.blockSizeVertical * 2),
                      margin: EdgeInsets.only(
                          left: SizeConfig.blockSizeHorizontal * 1,
                          right: SizeConfig.blockSizeHorizontal * 1,
                          top: SizeConfig.blockSizeVertical * 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppTheme.whiteColor),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              left: SizeConfig.blockSizeHorizontal * 2,
                              right: SizeConfig.blockSizeHorizontal * 2,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Partidos",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 16),
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
                          ),
                          Divider(
                            color: AppTheme.blackColor,
                          ),
                          Text(
                            "UEFA Champions League",
                            style: TextStyle(
                                fontSize: 16, color: AppTheme.greyColor),
                          ),
                          ListView.builder(
                              itemCount: 2,
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              itemBuilder: (BuildContext ctxt, int index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/valencia.svg'),
                                          SizedBox(
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  2),
                                          Container(
                                            width:
                                                SizeConfig.blockSizeHorizontal *
                                                    30,
                                            child: Text(
                                              "Borussia Dortmund",
                                              style: TextStyle(
                                                  color: AppTheme.blackColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                            ),
                                          ),
                                          SizedBox(
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  3),
                                          Spacer(),
                                          SvgPicture.asset(
                                              'assets/circleIcon.svg'),
                                          SizedBox(
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  2),
                                          SvgPicture.asset(
                                              'assets/circleIcon.svg'),
                                          SizedBox(
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  2),
                                          SvgPicture.asset(
                                              'assets/circleIcon.svg'),
                                          SizedBox(
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  2),
                                          SvgPicture.asset(
                                              'assets/circleIcon.svg'),
                                          SizedBox(
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  3),
                                          Text(
                                            "21:00",
                                            style: TextStyle(
                                                color: AppTheme.blackColor,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  3),
                                          SvgPicture.asset(
                                              'assets/notification.svg'),
                                        ],
                                      ),
                                      margin: EdgeInsets.only(
                                          top: SizeConfig.blockSizeVertical * 2,
                                          right:
                                              SizeConfig.blockSizeHorizontal *
                                                  2),
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/valencia.svg'),
                                          SizedBox(
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  2),
                                          Container(
                                            width:
                                                SizeConfig.blockSizeHorizontal *
                                                    30,
                                            child: Text(
                                              "Borussia Dortmund",
                                              style: TextStyle(
                                                color: AppTheme.blackColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  3),
                                          Spacer(),
                                          SvgPicture.asset(
                                              'assets/circleIcon.svg'),
                                          SizedBox(
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  2),
                                          SvgPicture.asset(
                                              'assets/circleIcon.svg'),
                                          SizedBox(
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  2),
                                          SvgPicture.asset(
                                              'assets/circleIcon.svg'),
                                          SizedBox(
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  2),
                                          SvgPicture.asset(
                                              'assets/circleIcon.svg'),
                                          SizedBox(
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  3),
                                          Text(
                                            "Direct TV",
                                            style: TextStyle(
                                                color: AppTheme.greyColor,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  3),
                                          SvgPicture.asset('assets/square.svg'),
                                        ],
                                      ),
                                      margin: EdgeInsets.only(
                                          top: SizeConfig.blockSizeVertical * 2,
                                          right:
                                              SizeConfig.blockSizeHorizontal *
                                                  2),
                                    ),
                                  ],
                                );
                              }),
                        ],
                      ),
                      padding: EdgeInsets.only(
                          left: SizeConfig.blockSizeHorizontal * 2,
                          right: SizeConfig.blockSizeHorizontal * 2,
                          bottom: SizeConfig.blockSizeVertical * 2,
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
              ],
            ),
          ),
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
