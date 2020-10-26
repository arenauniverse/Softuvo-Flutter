import 'package:arena_sports_app/CommonWidgets/dividerWidget.dart';
import 'package:arena_sports_app/LoginSignUpListing/LoginSgnupListingView.dart';
import 'package:arena_sports_app/NewsDetails/NewsDetails_View.dart';
import 'package:arena_sports_app/SizeConfig.dart';
import 'package:arena_sports_app/feedHome/FeedHomeView.dart';
import 'package:arena_sports_app/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
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
  void initState() {
    /*showAlert(context);*/
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppTheme.backGroundColor,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: SizeConfig.blockSizeVertical * 6,
            pinned: true,
            backgroundColor: AppTheme.whiteColor,
            title: Container(
                margin: EdgeInsets.only(
                    top: SizeConfig.blockSizeVertical * 6,
                    bottom: SizeConfig.blockSizeVertical * 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal * 3,
                        top: SizeConfig.blockSizeVertical * 1.9,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          _showModalSheet();
                        },
                        child: SvgPicture.asset('assets/ArenaLogin.svg'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical * 2,
                        left: SizeConfig.blockSizeHorizontal * 20,
                      ),
                      child: Text(
                        "Live",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(width: SizeConfig.blockSizeHorizontal * 2),
                    Transform.scale(
                      scale: 1.3,
                      child: Switch(
                        value: status,
                        onChanged: (val) {
                          setState(() {
                            status = val;
                          });
                        },
                        dragStartBehavior: DragStartBehavior.down,
                      ),
                    ),
                    SizedBox(width: SizeConfig.blockSizeHorizontal * 1),
                    Container(
                        margin: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 1.2,
                        ),
                        child: CircleAvatar(
                          radius: 16,
                          backgroundColor: AppTheme.greyColor,
                          child: SvgPicture.asset('assets/search.svg'),
                        ) /* CircleAvatar(
                            radius: 16,
                             backgroundColor: AppTheme.greyColor,
                        child: SvgPicture.asset(
                            'assets/searchIcon.svg'),  Icon(
                        Icons.search_rounded,
                        color: AppTheme.blackColor,
                      ),
                          ),*/
                        )
                  ],
                )),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    color: AppTheme.whiteColor,
                    padding: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical * 2,
                        bottom: SizeConfig.blockSizeVertical * 2),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/Barcelona.svg',
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        SvgPicture.asset('assets/Manchester.svg'),
                        SizedBox(
                          width: 12.0,
                        ),
                        SvgPicture.asset('assets/Escudo.svg'),
                        SizedBox(
                          width: 12.0,
                        ),
                        SvgPicture.asset('assets/Barcelona.svg'),
                        SizedBox(
                          width: 12.0,
                        ),
                        SvgPicture.asset('assets/Manchester.svg'),
                        SizedBox(
                          width: 12.0,
                        ),
                        SvgPicture.asset('assets/Escudo.svg'),
                        SizedBox(
                          width: 12.0,
                        ),
                        SvgPicture.asset('assets/Manchester.svg'),
                        SizedBox(
                          width: 12.0,
                        ),
                        SvgPicture.asset('assets/Escudo.svg'),
                        SizedBox(
                          width: 12.0,
                        ),
                        SvgPicture.asset('assets/Manchester.svg'),
                      ],
                    ),
                  ),
                ),
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
                          left: SizeConfig.blockSizeHorizontal * 6,
                          top: SizeConfig.blockSizeVertical * 2),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 2),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: SizeConfig.blockSizeHorizontal * 2,
                              right: SizeConfig.blockSizeHorizontal * 2),
                          child: Row(
                            children: [
                              Container(
                                  height: SizeConfig.blockSizeVertical * 17,
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
                                            Container(
                                              margin: EdgeInsets.only(
                                                  right: SizeConfig
                                                          .blockSizeHorizontal *
                                                      2,
                                                  left: SizeConfig
                                                          .blockSizeHorizontal *
                                                      2),
                                              child: Text("US OPEN",
                                                  style: TextStyle(
                                                      color:
                                                          AppTheme.greyColor)),
                                            ),
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
                                            SvgPicture.asset(
                                                'assets/square.svg'),
                                            SizedBox(
                                                width: SizeConfig
                                                        .blockSizeHorizontal *
                                                    3),
                                            SvgPicture.asset(
                                                'assets/notification.svg'),
                                          ],
                                        ),
                                        margin: EdgeInsets.only(
                                            top: SizeConfig.blockSizeVertical *
                                                2,
                                            left:
                                                SizeConfig.blockSizeHorizontal *
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
                                            SvgPicture.asset(
                                                'assets/userIcon.svg'),
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
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                          ],
                                        ),
                                        margin: EdgeInsets.only(
                                            top: SizeConfig.blockSizeVertical *
                                                2,
                                            left:
                                                SizeConfig.blockSizeHorizontal *
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
                                            SvgPicture.asset(
                                                'assets/userIcon.svg'),
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
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                          ],
                                        ),
                                        margin: EdgeInsets.only(
                                            top: SizeConfig.blockSizeVertical *
                                                2,
                                            left:
                                                SizeConfig.blockSizeHorizontal *
                                                    2,
                                            right:
                                                SizeConfig.blockSizeHorizontal *
                                                    2),
                                      )
                                    ],
                                  )),
                              Container(
                                  height: SizeConfig.blockSizeVertical * 17,
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
                                            SvgPicture.asset(
                                                'assets/square.svg'),
                                            SizedBox(
                                                width: SizeConfig
                                                        .blockSizeHorizontal *
                                                    3),
                                            SvgPicture.asset(
                                                'assets/notification.svg'),
                                          ],
                                        ),
                                        margin: EdgeInsets.only(
                                            top: SizeConfig.blockSizeVertical *
                                                2,
                                            left:
                                                SizeConfig.blockSizeHorizontal *
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
                                            SvgPicture.asset(
                                                'assets/userIcon.svg'),
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
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                          ],
                                        ),
                                        margin: EdgeInsets.only(
                                            top: SizeConfig.blockSizeVertical *
                                                2,
                                            left:
                                                SizeConfig.blockSizeHorizontal *
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
                                            SvgPicture.asset(
                                                'assets/userIcon.svg'),
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
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                          ],
                                        ),
                                        margin: EdgeInsets.only(
                                            top: SizeConfig.blockSizeVertical *
                                                2,
                                            left:
                                                SizeConfig.blockSizeHorizontal *
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
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: SizeConfig.blockSizeHorizontal * 2,
                          right: SizeConfig.blockSizeHorizontal * 2,
                          bottom: SizeConfig.blockSizeVertical * 2),
                      child: Column(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      right: SizeConfig.blockSizeHorizontal * 2,
                                      left: SizeConfig.blockSizeHorizontal * 2),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                Container(
                                  child: GetDivider(),
                                  margin: EdgeInsets.only(
                                      top: SizeConfig.blockSizeVertical * 0.5,
                                      right: SizeConfig.blockSizeHorizontal * 2,
                                      left: SizeConfig.blockSizeHorizontal * 2),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              NewsDetailsView()),
                                    );
                                  },
                                  child: Container(
                                    child: Column(children: [
                                      Image.asset(
                                        'assets/Imagenew.png',
                                        fit: BoxFit.fitWidth,
                                        width: SizeConfig.blockSizeHorizontal *
                                            120,
                                      ),
                                      SizedBox(
                                          height:
                                              SizeConfig.blockSizeVertical * 2),
                                      Container(
                                        margin: EdgeInsets.only(
                                            right:
                                                SizeConfig.blockSizeHorizontal *
                                                    2,
                                            left:
                                                SizeConfig.blockSizeHorizontal *
                                                    2),
                                        child: Text(
                                            "Messi entrena con el grupo del \ Barcelona por primera vez bajo el mando de Koeman",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            )),
                                      )
                                    ]),
                                    margin: EdgeInsets.only(
                                        top: SizeConfig.blockSizeVertical * 2),
                                  ),
                                ),
                                Container(
                                  child: Espn(context),
                                  margin: EdgeInsets.only(
                                      right: SizeConfig.blockSizeHorizontal * 2,
                                      left: SizeConfig.blockSizeHorizontal * 2),
                                ),
                                Container(
                                    child: GetDivider(),
                                    margin: EdgeInsets.only(
                                      right: SizeConfig.blockSizeHorizontal * 2,
                                      left: SizeConfig.blockSizeHorizontal * 2,
                                      top: SizeConfig.blockSizeVertical * 0.5,
                                      bottom:
                                          SizeConfig.blockSizeVertical * 0.5,
                                    )),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          right:
                                              SizeConfig.blockSizeHorizontal *
                                                  3),
                                      height: 80,
                                      child: Image.asset(
                                        'assets/newsImage.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Koeman le comunica a Sergio  Busquets su ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Espn(context),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                    child: GetDivider(),
                                    margin: EdgeInsets.only(
                                        right:
                                            SizeConfig.blockSizeHorizontal * 2,
                                        left:
                                            SizeConfig.blockSizeHorizontal * 2,
                                        top: SizeConfig.blockSizeVertical * 0.5,
                                        bottom: SizeConfig.blockSizeVertical *
                                            0.5)),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          right:
                                              SizeConfig.blockSizeHorizontal *
                                                  3),
                                      height: 80,
                                      child: Image.asset(
                                        'assets/newsImage.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SvgPicture.asset(
                                      'assets/newsImage.svg',
                                      width: SizeConfig.blockSizeHorizontal * 8,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Koeman le comunica a Sergio  Busquets su ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Espn(context),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                    child: GetDivider(),
                                    margin: EdgeInsets.only(
                                        right:
                                            SizeConfig.blockSizeHorizontal * 2,
                                        left:
                                            SizeConfig.blockSizeHorizontal * 2,
                                        top: SizeConfig.blockSizeVertical * 0.5,
                                        bottom: SizeConfig.blockSizeVertical *
                                            0.5)),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: SizeConfig.blockSizeHorizontal *
                                              2,
                                          right:
                                              SizeConfig.blockSizeHorizontal *
                                                  5),
                                      child: Text(
                                        "11.08",
                                        style: TextStyle(
                                            color: AppTheme.greyColor),
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
                                    SvgPicture.asset(
                                      'assets/newsImage.svg',
                                      width: SizeConfig.blockSizeHorizontal * 8,
                                    ),
                                  ],
                                ),
                                Container(
                                    child: GetDivider(),
                                    margin: EdgeInsets.only(
                                        right:
                                            SizeConfig.blockSizeHorizontal * 2,
                                        left:
                                            SizeConfig.blockSizeHorizontal * 2,
                                        top: SizeConfig.blockSizeVertical * 0.5,
                                        bottom: SizeConfig.blockSizeVertical *
                                            0.5)),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                        right:
                                            SizeConfig.blockSizeHorizontal * 5,
                                        left:
                                            SizeConfig.blockSizeHorizontal * 2,
                                      ),
                                      child: Text(
                                        "11.08",
                                        style: TextStyle(
                                            color: AppTheme.greyColor),
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
                                    SvgPicture.asset(
                                      'assets/newsImage.svg',
                                      width: SizeConfig.blockSizeHorizontal * 8,
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: SizeConfig.blockSizeHorizontal * 2,
                                      right: SizeConfig.blockSizeHorizontal * 2,
                                      top: SizeConfig.blockSizeVertical * 2),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                Container(
                                    child: GetDivider(),
                                    margin: EdgeInsets.only(
                                        right:
                                            SizeConfig.blockSizeHorizontal * 2,
                                        left:
                                            SizeConfig.blockSizeHorizontal * 2,
                                        top: SizeConfig.blockSizeVertical * 0.5,
                                        bottom: SizeConfig.blockSizeVertical *
                                            0.5)),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Card(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            color: AppTheme.whiteColor,
                                          ),
                                          height:
                                              SizeConfig.blockSizeVertical * 22,
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
                                                        fontWeight:
                                                            FontWeight.w600),
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
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            color: AppTheme.whiteColor,
                                          ),
                                          height:
                                              SizeConfig.blockSizeVertical * 22,
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
                                                        fontWeight:
                                                            FontWeight.w600),
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
                                bottom: SizeConfig.blockSizeHorizontal * 2,
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
                                      right:
                                          SizeConfig.blockSizeHorizontal * 2),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                Container(
                                    child: GetDivider(),
                                    margin: EdgeInsets.only(
                                        right:
                                            SizeConfig.blockSizeHorizontal * 2,
                                        left:
                                            SizeConfig.blockSizeHorizontal * 2,
                                        top: SizeConfig.blockSizeVertical * 0.5,
                                        bottom: SizeConfig.blockSizeVertical *
                                            0.5)),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: SizeConfig.blockSizeHorizontal * 2,
                                  ),
                                  child: Text(
                                    "UEFA Champions League",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: AppTheme.greyColor,
                                    ),
                                  ),
                                ),
                                ListView.builder(
                                    physics: ClampingScrollPhysics(),
                                    itemCount: 2,
                                    shrinkWrap: true,
                                    itemBuilder:
                                        (BuildContext ctxt, int index) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                  width: SizeConfig
                                                          .blockSizeHorizontal *
                                                      30,
                                                  child: Text(
                                                    "Borussia Dortmund",
                                                    style: TextStyle(
                                                        color:
                                                            AppTheme.blackColor,
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                      color:
                                                          AppTheme.blackColor,
                                                      fontWeight:
                                                          FontWeight.w600),
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
                                              top:
                                                  SizeConfig.blockSizeVertical *
                                                      2,
                                              right: SizeConfig
                                                      .blockSizeHorizontal *
                                                  2,
                                              left: SizeConfig
                                                      .blockSizeHorizontal *
                                                  2,
                                            ),
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
                                                  width: SizeConfig
                                                          .blockSizeHorizontal *
                                                      30,
                                                  child: Text(
                                                    "Borussia Dortmund",
                                                    style: TextStyle(
                                                      color:
                                                          AppTheme.blackColor,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                SizedBox(
                                                    width: SizeConfig
                                                            .blockSizeHorizontal *
                                                        3),
                                                SvgPicture.asset(
                                                    'assets/square.svg'),
                                              ],
                                            ),
                                            margin: EdgeInsets.only(
                                              top:
                                                  SizeConfig.blockSizeVertical *
                                                      3,
                                              right: SizeConfig
                                                      .blockSizeHorizontal *
                                                  2,
                                              left: SizeConfig
                                                      .blockSizeHorizontal *
                                                  2,
                                            ),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                Container(
                                    child: GetDivider(),
                                    margin: EdgeInsets.only(
                                        right:
                                            SizeConfig.blockSizeHorizontal * 2,
                                        left:
                                            SizeConfig.blockSizeHorizontal * 2,
                                        top: SizeConfig.blockSizeVertical * 0.5,
                                        bottom: SizeConfig.blockSizeVertical *
                                            0.5)),
                                ListView.builder(
                                    physics: ClampingScrollPhysics(),
                                    itemCount: 1,
                                    shrinkWrap: true,
                                    itemBuilder:
                                        (BuildContext ctxt, int index) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons
                                                      .supervised_user_circle_rounded,
                                                  color: AppTheme.greyColor,
                                                  size: 50,
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
                                                            color: AppTheme
                                                                .blackColor,
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
                                                            color: AppTheme
                                                                .greyColor,
                                                            fontSize: 14),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SvgPicture.asset(
                                                    'assets/Check.svg'),
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
                                                            color: AppTheme
                                                                .blackColor,
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
                                                            color: AppTheme
                                                                .greyColor,
                                                            fontSize: 12),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                            margin: EdgeInsets.only(
                                                top: SizeConfig
                                                        .blockSizeVertical *
                                                    2,
                                                right: SizeConfig
                                                        .blockSizeHorizontal *
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                Container(
                                    child: GetDivider(),
                                    margin: EdgeInsets.only(
                                        right:
                                            SizeConfig.blockSizeHorizontal * 2,
                                        left: SizeConfig.blockSizeHorizontal *
                                            2)),
                                Container(
                                  child: Text(
                                    "UEFA Champions League",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: AppTheme.greyColor),
                                  ),
                                  margin: EdgeInsets.only(
                                    left: SizeConfig.blockSizeHorizontal * 2,
                                  ),
                                ),
                                ListView.builder(
                                    itemCount: 2,
                                    shrinkWrap: true,
                                    physics: ClampingScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext ctxt, int index) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                  width: SizeConfig
                                                          .blockSizeHorizontal *
                                                      30,
                                                  child: Text(
                                                    "Borussia Dortmund",
                                                    style: TextStyle(
                                                        color:
                                                            AppTheme.blackColor,
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                      color:
                                                          AppTheme.blackColor,
                                                      fontWeight:
                                                          FontWeight.w600),
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
                                              top:
                                                  SizeConfig.blockSizeVertical *
                                                      2,
                                              right: SizeConfig
                                                      .blockSizeHorizontal *
                                                  2,
                                              left: SizeConfig
                                                      .blockSizeHorizontal *
                                                  2,
                                            ),
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
                                                  width: SizeConfig
                                                          .blockSizeHorizontal *
                                                      30,
                                                  child: Text(
                                                    "Borussia Dortmund",
                                                    style: TextStyle(
                                                      color:
                                                          AppTheme.blackColor,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                SizedBox(
                                                    width: SizeConfig
                                                            .blockSizeHorizontal *
                                                        3),
                                                SvgPicture.asset(
                                                    'assets/square.svg'),
                                              ],
                                            ),
                                            margin: EdgeInsets.only(
                                              top:
                                                  SizeConfig.blockSizeVertical *
                                                      2,
                                              right: SizeConfig
                                                      .blockSizeHorizontal *
                                                  2,
                                              left: SizeConfig
                                                      .blockSizeHorizontal *
                                                  2,
                                            ),
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
                                top: SizeConfig.blockSizeVertical * 2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: AppTheme.whiteColor),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget Espn(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
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
                    width: SizeConfig.blockSizeHorizontal * 7,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            width: 3.0,
          ),
          Text(
            "ESPN",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          SizedBox(
            width: 8.0,
          ),
          Text(
            "58 min",
            style: TextStyle(color: AppTheme.greyColor),
          ),
        ],
      ),
    );
  }

  void _showModalSheet() {
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

  void _showFeedModalSheet() {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(25.0),
                topLeft: Radius.circular(25.0))),
        context: context,
        builder: (builder) {
          return FeedHomeView();
        });
  }
}
