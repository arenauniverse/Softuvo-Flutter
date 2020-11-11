import 'dart:async';
import 'package:arena_sports_app/CommonWidgets/ChannelWidget.dart';
import 'package:arena_sports_app/CommonWidgets/SizeConfig.dart';
import 'package:arena_sports_app/CommonWidgets/SlideRightRoute.dart';
import 'package:arena_sports_app/CommonWidgets/Strings.dart';
import 'package:arena_sports_app/CommonWidgets/bottomSheet.dart';
import 'package:arena_sports_app/CommonWidgets/buttons.dart';
import 'package:arena_sports_app/CommonWidgets/dividerWidget.dart';
import 'package:arena_sports_app/CommonWidgets/sharePreferenceData.dart';
import 'package:arena_sports_app/screens/feedHome/FeedHomeView.dart';
import 'package:arena_sports_app/screens/feedHome/VideoPlayerView.dart';
import 'package:arena_sports_app/screens/loginSignUpListing/LoginSgnupListingView.dart';
import 'package:arena_sports_app/screens/myProfile/myProfileView.dart';
import 'package:arena_sports_app/screens/news/NewsDetails_View.dart';
import 'package:arena_sports_app/screens/news/NewsView.dart';
import 'package:arena_sports_app/screens/notifications/notificationsView.dart';
import 'package:arena_sports_app/screens/scorers/scrorersView.dart';
import 'package:arena_sports_app/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

bool status = false;

class UserDashboardView extends StatefulWidget {
  @override
  _UserDashboardViewState createState() => _UserDashboardViewState();
}

class _UserDashboardViewState extends State<UserDashboardView>
    with SingleTickerProviderStateMixin {
  bool isRegisterd = false;
  bool isFirstRun = true;
  GlobalKey _arenaKey = GlobalObjectKey("arena");
  GlobalKey _loginKey = GlobalObjectKey("login");
  List<TargetFocus> targets = List();
  TutorialCoachMark tutorialCoachMark;
  AnimationController controller;
  Animation<Offset> offset;

  @override
  void initState() {
    super.initState();
    SharedPreferenceData().getFirstRun().then((value) {
      setState(() {
        // isFirstRun =value;
        if (value) initCoachMarker();
      });
    });

    SharedPreferenceData().getRegisteredValue().then((value) {
      setState(() {
        isRegisterd = value;
      });
    });
    controller =  AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    offset =  Tween<Offset>(begin: Offset.zero, end: Offset(0.0, 1.0))
        .animate(controller);
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: CustomScrollView(slivers: [
          SliverAppBar(
            backgroundColor: Theme.of(context).cardColor,
            pinned: true,
            floating: true,
            title: Container(
              padding: EdgeInsets.only(
                left: SizeConfig.blockSizeHorizontal * 2,
                right: SizeConfig.blockSizeHorizontal * 2,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      isRegisterd
                          ? ShowBottomSheet()
                              .showModalSheet(context, LoginSignUpListingView())
                          : Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      MyProfileView()));
                    },
                    child: Container(
                      child: SvgPicture.asset('assets/ArenaLogin.svg'),
                    ),
                  ),
                  Spacer(),
                  Text(
                    Strings.live,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal * 1.5,
                      ),
                      child: toggleButton(
                          onChanged: (val) {
                            setState(() {
                              status = val;
                              if (status)
                                controller.reverse();
                              else
                                controller.forward();
                            });
                          },
                          status: status)),
                  GestureDetector(
                    onTap: () {
                      //toast(msg: Messages.underDevelopment, context: context);
                      /*    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NotificationScreen()),
                      );*/
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal * 3.5,
                      ),
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: AppTheme.greyColor,
                        child: SvgPicture.asset('assets/search.svg'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate(
            <Widget>[
              status
                  ? SlideTransition(
                      child: FeedHomeView(),
                      position: offset,
                    )
                  : Column(
                      children: [
                        Container(
                          color: Theme.of(context).cardColor,
                          height: SizeConfig.blockSizeVertical * 8,
                          margin: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 0.02,
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: SizeConfig.blockSizeHorizontal * 5,
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/Barcelona.svg',
                                  ),
                                  SizedBox(
                                    width: SizeConfig.blockSizeHorizontal * 3,
                                  ),
                                  SvgPicture.asset(
                                    'assets/Manchester.svg',
                                  ),
                                  SizedBox(
                                    width: SizeConfig.blockSizeHorizontal * 3,
                                  ),
                                  SvgPicture.asset(
                                    'assets/Escudo.svg',
                                  ),
                                  SizedBox(
                                    width: SizeConfig.blockSizeHorizontal * 3,
                                  ),
                                  SvgPicture.asset(
                                    'assets/Barcelona.svg',
                                  ),
                                  SizedBox(
                                    width: SizeConfig.blockSizeHorizontal * 3,
                                  ),
                                  SvgPicture.asset(
                                    'assets/Manchester.svg',
                                  ),
                                  SizedBox(
                                    width: SizeConfig.blockSizeHorizontal * 3,
                                  ),
                                  SvgPicture.asset(
                                    'assets/Escudo.svg',
                                  ),
                                  SizedBox(
                                    width: SizeConfig.blockSizeHorizontal * 3,
                                  ),
                                  SvgPicture.asset(
                                    'assets/Barcelona.svg',
                                  ),
                                  SizedBox(
                                    width: SizeConfig.blockSizeHorizontal * 3,
                                  ),
                                  SvgPicture.asset(
                                    'assets/Manchester.svg',
                                  ),
                                  SizedBox(
                                    width: SizeConfig.blockSizeHorizontal * 3,
                                  ),
                                  SvgPicture.asset(
                                    'assets/Escudo.svg',
                                  ),
                                  SizedBox(
                                    width: SizeConfig.blockSizeHorizontal * 3,
                                  ),
                                  SvgPicture.asset(
                                    'assets/Barcelona.svg',
                                  ),
                                  SizedBox(
                                    width: SizeConfig.blockSizeHorizontal * 3,
                                  ),
                                  SvgPicture.asset(
                                    'assets/Manchester.svg',
                                  ),
                                  SizedBox(
                                    width: SizeConfig.blockSizeHorizontal * 3,
                                  ),
                                  SvgPicture.asset(
                                    'assets/Escudo.svg',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                Strings.enVivo,
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
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          SizeConfig.blockSizeHorizontal * 2),
                                  child: Row(
                                    children: [
                                      Container(
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  70,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: Theme.of(context).cardColor,
                                          ),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: SizeConfig
                                                        .blockSizeHorizontal *
                                                    0.8,
                                                height: SizeConfig
                                                        .blockSizeVertical *
                                                    9,
                                                margin: EdgeInsets.only(
                                                    top: SizeConfig
                                                            .blockSizeVertical *
                                                        3),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                    color: AppTheme.greenColor),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            margin: EdgeInsets.only(
                                                                left: SizeConfig
                                                                        .blockSizeHorizontal *
                                                                    4),
                                                            child: Text(
                                                                Strings.US_OPEN,
                                                                style: TextStyle(
                                                                    color: AppTheme
                                                                        .greyColor)),
                                                          ),
                                                          Spacer(),
                                                          Text(
                                                            Strings.numbers,
                                                            style: TextStyle(
                                                                color: AppTheme
                                                                    .borderColor),
                                                          ),
                                                          SizedBox(
                                                              width: SizeConfig
                                                                      .blockSizeHorizontal *
                                                                  3),
                                                          directLinkBell(),
                                                          /* SvgPicture.asset('assets/directIcon.svg'),*/
                                                          SizedBox(
                                                              width: SizeConfig
                                                                      .blockSizeHorizontal *
                                                                  3),
                                                          GestureDetector(
                                                            onTap: () {
                                                              ShowBottomSheet()
                                                                  .showModalSheet(
                                                                      context,
                                                                      NotificationsView());
                                                            },
                                                            child: Container(
                                                              child:
                                                                  notificationBell(),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      margin: EdgeInsets.only(
                                                          top: SizeConfig
                                                                  .blockSizeVertical *
                                                              2,
                                                          right: SizeConfig
                                                                  .blockSizeHorizontal *
                                                              2.6),
                                                    ),
                                                    Container(
                                                      child: Row(
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .supervised_user_circle_rounded,
                                                            color: AppTheme
                                                                .greyColor,
                                                            size: SizeConfig
                                                                    .blockSizeVertical *
                                                                4,
                                                          ),
                                                          SizedBox(
                                                              width: SizeConfig
                                                                      .blockSizeHorizontal *
                                                                  1),
                                                          Text(
                                                            Strings.playerName,
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 16),
                                                          ),
                                                          Spacer(),
                                                          SvgPicture.asset(
                                                              'assets/circleIcon.svg'),
                                                          SizedBox(
                                                              width: SizeConfig
                                                                      .blockSizeHorizontal *
                                                                  4),
                                                          Text(
                                                            Strings.scores,
                                                            style: TextStyle(
                                                                color: AppTheme
                                                                    .blackColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                          SizedBox(
                                                              width: SizeConfig
                                                                      .blockSizeHorizontal *
                                                                  3),
                                                          Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        6.0,
                                                                    vertical:
                                                                        3.0),
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              color: AppTheme
                                                                  .greyColor,
                                                            ),
                                                            child: Text(
                                                              Strings.scores,
                                                              style: TextStyle(
                                                                  color: AppTheme
                                                                      .blackColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      margin: EdgeInsets.only(
                                                          top: SizeConfig
                                                                  .blockSizeVertical *
                                                              1,
                                                          left: SizeConfig
                                                                  .blockSizeHorizontal *
                                                              4,
                                                          right: SizeConfig
                                                                  .blockSizeHorizontal *
                                                              3),
                                                    ),
                                                    Container(
                                                      child: Row(
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .supervised_user_circle_rounded,
                                                            color: AppTheme
                                                                .greyColor,
                                                            size: SizeConfig
                                                                    .blockSizeVertical *
                                                                4,
                                                          ),
                                                          SizedBox(
                                                              width: SizeConfig
                                                                      .blockSizeHorizontal *
                                                                  1),
                                                          Text(
                                                            Strings.playerName,
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 16),
                                                          ),
                                                          Spacer(),
                                                          SvgPicture.asset(
                                                              'assets/circleIcon.svg'),
                                                          SizedBox(
                                                              width: SizeConfig
                                                                      .blockSizeHorizontal *
                                                                  4),
                                                          Text(
                                                            Strings.scores,
                                                            style: TextStyle(
                                                                color: AppTheme
                                                                    .blackColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                          SizedBox(
                                                              width: SizeConfig
                                                                      .blockSizeHorizontal *
                                                                  3),
                                                          Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        6.0,
                                                                    vertical:
                                                                        3.0),
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              color: AppTheme
                                                                  .greyColor,
                                                            ),
                                                            child: Text(
                                                              Strings.scores,
                                                              style: TextStyle(
                                                                  color: AppTheme
                                                                      .blackColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      margin: EdgeInsets.only(
                                                          top: SizeConfig
                                                                  .blockSizeVertical *
                                                              0.5,
                                                          bottom: SizeConfig
                                                                  .blockSizeVertical *
                                                              2,
                                                          left: SizeConfig
                                                                  .blockSizeHorizontal *
                                                              4,
                                                          right: SizeConfig
                                                                  .blockSizeHorizontal *
                                                              3),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )),
                                      SizedBox(
                                        width:
                                            SizeConfig.blockSizeHorizontal * 2,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  70,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                color:
                                                    Theme.of(context).cardColor,
                                              ),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: SizeConfig
                                                            .blockSizeHorizontal *
                                                        0.8,
                                                    height: SizeConfig
                                                            .blockSizeVertical *
                                                        9,
                                                    margin: EdgeInsets.only(
                                                        top: SizeConfig
                                                                .blockSizeVertical *
                                                            3),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6),
                                                        color: AppTheme
                                                            .greenColor),
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                margin: EdgeInsets.only(
                                                                    left: SizeConfig
                                                                            .blockSizeHorizontal *
                                                                        4),
                                                                child: Text(
                                                                    Strings
                                                                        .US_OPEN,
                                                                    style: TextStyle(
                                                                        color: AppTheme
                                                                            .greyColor)),
                                                              ),
                                                              Spacer(),
                                                              Text(
                                                                Strings.numbers,
                                                                style: TextStyle(
                                                                    color: AppTheme
                                                                        .borderColor),
                                                              ),
                                                              SizedBox(
                                                                  width: SizeConfig
                                                                          .blockSizeHorizontal *
                                                                      3),
                                                              directLinkBell(),
                                                              /* SvgPicture.asset('assets/directIcon.svg'),*/
                                                              SizedBox(
                                                                  width: SizeConfig
                                                                          .blockSizeHorizontal *
                                                                      3),
                                                              notificationBell(),
                                                            ],
                                                          ),
                                                          margin: EdgeInsets.only(
                                                              top: SizeConfig
                                                                      .blockSizeVertical *
                                                                  2,
                                                              right: SizeConfig
                                                                      .blockSizeHorizontal *
                                                                  2.6),
                                                        ),
                                                        Container(
                                                          child: Row(
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .supervised_user_circle_rounded,
                                                                color: AppTheme
                                                                    .greyColor,
                                                                size: SizeConfig
                                                                        .blockSizeVertical *
                                                                    4,
                                                              ),
                                                              SizedBox(
                                                                  width: SizeConfig
                                                                          .blockSizeHorizontal *
                                                                      1),
                                                              Text(
                                                                Strings
                                                                    .playerName,
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        16),
                                                              ),
                                                              Spacer(),
                                                              SvgPicture.asset(
                                                                  'assets/circleIcon.svg'),
                                                              SizedBox(
                                                                  width: SizeConfig
                                                                          .blockSizeHorizontal *
                                                                      4),
                                                              Text(
                                                                Strings.scores,
                                                                style: TextStyle(
                                                                    color: AppTheme
                                                                        .blackColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                              SizedBox(
                                                                  width: SizeConfig
                                                                          .blockSizeHorizontal *
                                                                      3),
                                                              Container(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            6.0,
                                                                        vertical:
                                                                            3.0),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                  color: AppTheme
                                                                      .greyColor,
                                                                ),
                                                                child: Text(
                                                                  Strings
                                                                      .scores,
                                                                  style: TextStyle(
                                                                      color: AppTheme
                                                                          .blackColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          margin: EdgeInsets.only(
                                                              top: SizeConfig
                                                                      .blockSizeVertical *
                                                                  1,
                                                              left: SizeConfig
                                                                      .blockSizeHorizontal *
                                                                  4,
                                                              right: SizeConfig
                                                                      .blockSizeHorizontal *
                                                                  3),
                                                        ),
                                                        Container(
                                                          child: Row(
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .supervised_user_circle_rounded,
                                                                color: AppTheme
                                                                    .greyColor,
                                                                size: SizeConfig
                                                                        .blockSizeVertical *
                                                                    4,
                                                              ),
                                                              SizedBox(
                                                                  width: SizeConfig
                                                                          .blockSizeHorizontal *
                                                                      1),
                                                              Text(
                                                                Strings
                                                                    .playerName,
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        16),
                                                              ),
                                                              Spacer(),
                                                              SvgPicture.asset(
                                                                  'assets/circleIcon.svg'),
                                                              SizedBox(
                                                                  width: SizeConfig
                                                                          .blockSizeHorizontal *
                                                                      4),
                                                              Text(
                                                                Strings.scores,
                                                                style: TextStyle(
                                                                    color: AppTheme
                                                                        .blackColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                              SizedBox(
                                                                  width: SizeConfig
                                                                          .blockSizeHorizontal *
                                                                      3),
                                                              Container(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            6.0,
                                                                        vertical:
                                                                            3.0),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                  color: AppTheme
                                                                      .greyColor,
                                                                ),
                                                                child: Text(
                                                                  Strings
                                                                      .scores,
                                                                  style: TextStyle(
                                                                      color: AppTheme
                                                                          .blackColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          margin: EdgeInsets.only(
                                                              top: SizeConfig
                                                                      .blockSizeVertical *
                                                                  0.5,
                                                              bottom: SizeConfig
                                                                      .blockSizeVertical *
                                                                  2,
                                                              left: SizeConfig
                                                                      .blockSizeHorizontal *
                                                                  4,
                                                              right: SizeConfig
                                                                      .blockSizeHorizontal *
                                                                  3),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              )),
                                        ],
                                      )
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
                                              right: SizeConfig
                                                      .blockSizeHorizontal *
                                                  4,
                                              left: SizeConfig
                                                      .blockSizeHorizontal *
                                                  4),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                Strings.news,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 16),
                                              ),
                                              GestureDetector(
                                                child: Text(
                                                  Strings.see_all,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16,
                                                      color:
                                                          AppTheme.blueColor),
                                                ),
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      SlideRightRoute(
                                                          page: NewsView()));
                                                },
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: GetDivider(),
                                          margin: EdgeInsets.symmetric(
                                              vertical:
                                                  SizeConfig.blockSizeVertical *
                                                      0.5,
                                              horizontal: SizeConfig
                                                      .blockSizeHorizontal *
                                                  4),
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
                                                width: SizeConfig
                                                        .blockSizeHorizontal *
                                                    120,
                                              ),
                                              SizedBox(
                                                  height: SizeConfig
                                                          .blockSizeVertical *
                                                      2),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    right: SizeConfig
                                                            .blockSizeHorizontal *
                                                        4,
                                                    left: SizeConfig
                                                            .blockSizeHorizontal *
                                                        4),
                                                child: Text(Strings.aboutPlayer,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    )),
                                              )
                                            ]),
                                          ),
                                        ),
                                        Container(
                                          child: ChannelWidget(),
                                          margin: EdgeInsets.only(
                                              right: SizeConfig
                                                      .blockSizeHorizontal *
                                                  4,
                                              left: SizeConfig
                                                      .blockSizeHorizontal *
                                                  4),
                                        ),
                                        Container(
                                            child: GetDivider(),
                                            margin: EdgeInsets.only(
                                              right: SizeConfig
                                                      .blockSizeHorizontal *
                                                  4,
                                              left: SizeConfig
                                                      .blockSizeHorizontal *
                                                  4,
                                              top:
                                                  SizeConfig.blockSizeVertical *
                                                      0.5,
                                              bottom:
                                                  SizeConfig.blockSizeVertical *
                                                      0.5,
                                            )),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: SizeConfig
                                                          .blockSizeHorizontal *
                                                      4,
                                                  right: SizeConfig
                                                          .blockSizeHorizontal *
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
                                                    Strings.text,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  ChannelWidget(),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        Container(
                                            child: GetDivider(),
                                            margin: EdgeInsets.only(
                                                right: SizeConfig
                                                        .blockSizeHorizontal *
                                                    4,
                                                left: SizeConfig
                                                        .blockSizeHorizontal *
                                                    4,
                                                top: SizeConfig
                                                        .blockSizeVertical *
                                                    0.5,
                                                bottom: SizeConfig
                                                        .blockSizeVertical *
                                                    0.5)),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: SizeConfig
                                                          .blockSizeHorizontal *
                                                      4,
                                                  right: SizeConfig
                                                          .blockSizeHorizontal *
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
                                                    Strings.text,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  ChannelWidget(),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        Container(
                                            child: GetDivider(),
                                            margin: EdgeInsets.symmetric(
                                              horizontal: SizeConfig
                                                      .blockSizeHorizontal *
                                                  4,
                                              vertical:
                                                  SizeConfig.blockSizeVertical *
                                                      0.5,
                                            )),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: SizeConfig
                                                          .blockSizeHorizontal *
                                                      5,
                                                  right: SizeConfig
                                                          .blockSizeHorizontal *
                                                      3),
                                              child: Text(
                                                Strings.textTime,
                                                style: TextStyle(
                                                    color: AppTheme.greyColor),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                Strings.text1,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                            /*SvgPicture.asset(
                                    'assets/newsImage.svg',
                                    width: SizeConfig.blockSizeHorizontal * 8,
                                  ),*/
                                          ],
                                        ),
                                        Container(
                                            child: GetDivider(),
                                            margin: EdgeInsets.only(
                                                right: SizeConfig
                                                        .blockSizeHorizontal *
                                                    4,
                                                left: SizeConfig
                                                        .blockSizeHorizontal *
                                                    4,
                                                top: SizeConfig
                                                        .blockSizeVertical *
                                                    0.5,
                                                bottom: SizeConfig
                                                        .blockSizeVertical *
                                                    0.5)),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                right: SizeConfig
                                                        .blockSizeHorizontal *
                                                    3,
                                                left: SizeConfig
                                                        .blockSizeHorizontal *
                                                    5,
                                              ),
                                              child: Text(
                                                Strings.textTime,
                                                style: TextStyle(
                                                    color: AppTheme.greyColor),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                Strings.text1,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                            /* SvgPicture.asset(
                                    'assets/newsImage.svg',
                                    width: SizeConfig.blockSizeHorizontal * 8,
                                  ),*/
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: SizeConfig
                                                      .blockSizeHorizontal *
                                                  4,
                                              right: SizeConfig
                                                      .blockSizeHorizontal *
                                                  4,
                                              top:
                                                  SizeConfig.blockSizeVertical *
                                                      2),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                Strings.videos,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 16),
                                              ),
                                              GestureDetector(
                                                child: Text(
                                                  Strings.see_all,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16,
                                                      color:
                                                          AppTheme.blueColor),
                                                ),
                                                onTap: () {

                                                },
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                            child: GetDivider(),
                                            margin: EdgeInsets.symmetric(
                                              vertical:
                                                  SizeConfig.blockSizeVertical *
                                                      0.5,
                                              horizontal: SizeConfig
                                                      .blockSizeHorizontal *
                                                  4,
                                            )),
                                        Container(
                                          height:
                                              SizeConfig.blockSizeVertical * 25,
                                          // width: SizeConfig.blockSizeVertical * 35,
                                          margin: EdgeInsets.symmetric(
                                              vertical:
                                                  SizeConfig.blockSizeVertical *
                                                      0.5,
                                              horizontal: SizeConfig
                                                      .blockSizeHorizontal *
                                                  4),
                                          child: Swiper(
                                            viewportFraction: 0.6,
                                            scale: 0.8,
                                            itemCount: 2,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder:
                                                (BuildContext ctxt, int index) {
                                              return Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(18),
                                                ),
                                                child: Container(
                                                  height: 50,
                                                  child: Column(
                                                    children: [
                                                      Stack(
                                                        children: [
                                                          Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            25))),
                                                            child: Image.asset(
                                                              'assets/videoImage.png',
                                                              fit: BoxFit.cover,
                                                            ),
                                                            width: SizeConfig
                                                                    .blockSizeVertical *
                                                                35,
                                                          ),
                                                          Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child:
                                                                    Container(
                                                                  margin: EdgeInsets.only(
                                                                      top: SizeConfig
                                                                              .blockSizeVertical *
                                                                          5.5),
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () {
                                                                      Navigator.push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                              builder: (BuildContext context) => VideoPlayerView(videoUrl: "http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4")));
                                                                    },
                                                                    child: SvgPicture
                                                                        .asset(
                                                                      'assets/playIcon.svg',
                                                                      width:
                                                                          SizeConfig.blockSizeVertical *
                                                                              5,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment: Alignment
                                                                    .bottomLeft,
                                                                child:
                                                                    Container(
                                                                  margin:
                                                                      EdgeInsets
                                                                          .only(
                                                                    left: SizeConfig
                                                                            .blockSizeVertical *
                                                                        2,
                                                                  ),
                                                                  child: Text(
                                                                    Strings
                                                                        .textTime,
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        color: AppTheme
                                                                            .whiteColor),
                                                                  ),
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              6),
                                                                      color: Color(
                                                                              0xFF0E3311)
                                                                          .withOpacity(
                                                                              0.5)),
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              3),
                                                                ),
                                                              )
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                          left: SizeConfig
                                                                  .blockSizeHorizontal *
                                                              1,
                                                        ),
                                                        child: Container(
                                                          margin: EdgeInsets.only(
                                                              left: SizeConfig
                                                                      .blockSizeHorizontal *
                                                                  3,
                                                              right: SizeConfig
                                                                      .blockSizeHorizontal *
                                                                  3,
                                                              top: SizeConfig
                                                                      .blockSizeVertical *
                                                                  1),
                                                          child: Text(
                                                            Strings.text2,
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      vertical:
                                          SizeConfig.blockSizeVertical * 2,
                                    ),
                                    margin: EdgeInsets.only(
                                        top: SizeConfig.blockSizeVertical * 2),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Theme.of(context).cardColor,
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: SizeConfig
                                                      .blockSizeHorizontal *
                                                  4),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                Strings.matches1,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 16),
                                              ),
                                              GestureDetector(
                                                child: Text(
                                                  Strings.see_all,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16,
                                                      color:
                                                          AppTheme.blueColor),
                                                ),
                                                onTap: () {},
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                            child: GetDivider(),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: SizeConfig
                                                        .blockSizeHorizontal *
                                                    4,
                                                vertical: SizeConfig
                                                        .blockSizeVertical *
                                                    0.5)),
                                        Container(
                                          margin: EdgeInsets.only(
                                            left:
                                                SizeConfig.blockSizeHorizontal *
                                                    4,
                                          ),
                                          child: Text(
                                            Strings.UEFA_Champions_League,
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: AppTheme.greyColor,
                                            ),
                                          ),
                                        ),
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
                                                        SvgPicture.asset(
                                                          'assets/Borusia Dourmunt.svg',
                                                          width: SizeConfig
                                                                  .blockSizeHorizontal *
                                                              6,
                                                        ),
                                                        SizedBox(
                                                            width: SizeConfig
                                                                    .blockSizeHorizontal *
                                                                2),
                                                        Container(
                                                          width: SizeConfig
                                                                  .blockSizeHorizontal *
                                                              28,
                                                          child: Text(
                                                            Strings
                                                                .Borussia_Dortmund,
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 14),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                            width: SizeConfig
                                                                    .blockSizeHorizontal *
                                                                4),
                                                        Container(
                                                            height: SizeConfig
                                                                    .blockSizeVertical *
                                                                1,
                                                            width: SizeConfig
                                                                    .blockSizeVertical *
                                                                1,
                                                            decoration:
                                                                new BoxDecoration(
                                                              color: AppTheme
                                                                  .yellowColor,
                                                              shape: BoxShape
                                                                  .circle,
                                                            )),
                                                        /*  SvgPicture.asset(
                                                            'assets/circleIcon.svg'),*/
                                                        SizedBox(
                                                            width: SizeConfig
                                                                    .blockSizeHorizontal *
                                                                2),
                                                        Container(
                                                            height: SizeConfig
                                                                    .blockSizeVertical *
                                                                1,
                                                            width: SizeConfig
                                                                    .blockSizeVertical *
                                                                1,
                                                            decoration:
                                                                new BoxDecoration(
                                                              color: AppTheme
                                                                  .borderColor,
                                                              shape: BoxShape
                                                                  .circle,
                                                            )),
                                                        SizedBox(
                                                            width: SizeConfig
                                                                    .blockSizeHorizontal *
                                                                2),
                                                        Container(
                                                            height: SizeConfig
                                                                    .blockSizeVertical *
                                                                1,
                                                            width: SizeConfig
                                                                    .blockSizeVertical *
                                                                1,
                                                            decoration:
                                                                new BoxDecoration(
                                                              color: AppTheme
                                                                  .borderColor,
                                                              shape: BoxShape
                                                                  .circle,
                                                            )),
                                                        SizedBox(
                                                            width: SizeConfig
                                                                    .blockSizeHorizontal *
                                                                2),
                                                        Container(
                                                            height: SizeConfig
                                                                    .blockSizeVertical *
                                                                1,
                                                            width: SizeConfig
                                                                    .blockSizeVertical *
                                                                1,
                                                            decoration:
                                                                new BoxDecoration(
                                                              color: AppTheme
                                                                  .greenColor,
                                                              shape: BoxShape
                                                                  .circle,
                                                            )),
                                                        SizedBox(
                                                            width: SizeConfig
                                                                    .blockSizeHorizontal *
                                                                2),
                                                        Container(
                                                            height: SizeConfig
                                                                    .blockSizeVertical *
                                                                1,
                                                            width: SizeConfig
                                                                    .blockSizeVertical *
                                                                1,
                                                            decoration:
                                                                new BoxDecoration(
                                                              color: AppTheme
                                                                  .borderColor,
                                                              shape: BoxShape
                                                                  .circle,
                                                            )),
                                                        SizedBox(
                                                            width: SizeConfig
                                                                    .blockSizeHorizontal *
                                                                3),
                                                        Text(
                                                          Strings.time,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        Spacer(),
                                                        notificationBell(),
                                                      ],
                                                    ),
                                                    margin: EdgeInsets.only(
                                                      right: SizeConfig
                                                              .blockSizeHorizontal *
                                                          4.7,
                                                      left: SizeConfig
                                                              .blockSizeHorizontal *
                                                          5,
                                                      bottom: SizeConfig
                                                              .blockSizeVertical *
                                                          1,
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Row(
                                                      children: [
                                                        SvgPicture.asset(
                                                          'assets/chelsea.svg',
                                                          width: SizeConfig
                                                                  .blockSizeHorizontal *
                                                              6.5,
                                                        ),
                                                        SizedBox(
                                                            width: SizeConfig
                                                                    .blockSizeHorizontal *
                                                                2),
                                                        Container(
                                                          width: SizeConfig
                                                                  .blockSizeHorizontal *
                                                              28,
                                                          child: Text(
                                                            Strings.Chelsea,
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 14),
                                                          ),
                                                        ),
                                                        Spacer(),
                                                        Container(
                                                            height: SizeConfig
                                                                    .blockSizeVertical *
                                                                1,
                                                            width: SizeConfig
                                                                    .blockSizeVertical *
                                                                1,
                                                            decoration:
                                                                new BoxDecoration(
                                                              color: AppTheme
                                                                  .greenColor,
                                                              shape: BoxShape
                                                                  .circle,
                                                            )),
                                                        /*  SvgPicture.asset(
                                                            'assets/circleIcon.svg'),*/
                                                        SizedBox(
                                                            width: SizeConfig
                                                                    .blockSizeHorizontal *
                                                                2),
                                                        Container(
                                                            height: SizeConfig
                                                                    .blockSizeVertical *
                                                                1,
                                                            width: SizeConfig
                                                                    .blockSizeVertical *
                                                                1,
                                                            decoration:
                                                                new BoxDecoration(
                                                              color: AppTheme
                                                                  .greenColor,
                                                              shape: BoxShape
                                                                  .circle,
                                                            )),
                                                        SizedBox(
                                                            width: SizeConfig
                                                                    .blockSizeHorizontal *
                                                                2),
                                                        Container(
                                                            height: SizeConfig
                                                                    .blockSizeVertical *
                                                                1,
                                                            width: SizeConfig
                                                                    .blockSizeVertical *
                                                                1,
                                                            decoration:
                                                                new BoxDecoration(
                                                              color: AppTheme
                                                                  .greenColor,
                                                              shape: BoxShape
                                                                  .circle,
                                                            )),
                                                        SizedBox(
                                                            width: SizeConfig
                                                                    .blockSizeHorizontal *
                                                                2),
                                                        Container(
                                                            height: SizeConfig
                                                                    .blockSizeVertical *
                                                                1,
                                                            width: SizeConfig
                                                                    .blockSizeVertical *
                                                                1,
                                                            decoration:
                                                                new BoxDecoration(
                                                              color: AppTheme
                                                                  .borderColor,
                                                              shape: BoxShape
                                                                  .circle,
                                                            )),
                                                        SizedBox(
                                                            width: SizeConfig
                                                                    .blockSizeHorizontal *
                                                                2),
                                                        Container(
                                                            height: SizeConfig
                                                                    .blockSizeVertical *
                                                                1,
                                                            width: SizeConfig
                                                                    .blockSizeVertical *
                                                                1,
                                                            decoration:
                                                                new BoxDecoration(
                                                              color: AppTheme
                                                                  .greenColor,
                                                              shape: BoxShape
                                                                  .circle,
                                                            )),
                                                        SizedBox(
                                                            width: SizeConfig
                                                                    .blockSizeHorizontal *
                                                                3),
                                                        Text(
                                                          Strings.Direct_TV,
                                                          style: TextStyle(
                                                              color: AppTheme
                                                                  .lightgrey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        SizedBox(
                                                            width: SizeConfig
                                                                    .blockSizeHorizontal *
                                                                4),
                                                        directLinkBell(),
                                                      ],
                                                    ),
                                                    margin: EdgeInsets.only(
                                                      right: SizeConfig
                                                              .blockSizeHorizontal *
                                                          5,
                                                      left: SizeConfig
                                                              .blockSizeHorizontal *
                                                          5,
                                                    ),
                                                  ),
                                                  Container(
                                                      child: GetDivider(),
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                        horizontal: SizeConfig
                                                                .blockSizeHorizontal *
                                                            4,
                                                      )),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        child: Column(
                                                          children: [
                                                            SvgPicture.asset(
                                                              'assets/Atalanta.svg',
                                                              width: SizeConfig
                                                                      .blockSizeHorizontal *
                                                                  6,
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets.only(
                                                                  top: SizeConfig
                                                                          .blockSizeVertical *
                                                                      1),
                                                              child: SvgPicture
                                                                  .asset(
                                                                'assets/paris.svg',
                                                                width: SizeConfig
                                                                        .blockSizeHorizontal *
                                                                    6,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        margin: EdgeInsets.only(
                                                            left: SizeConfig
                                                                    .blockSizeHorizontal *
                                                                5),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            left: SizeConfig
                                                                    .blockSizeHorizontal *
                                                                2),
                                                        child: Column(
                                                          children: [
                                                            Text(
                                                              Strings.Atalanta,
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 15),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets.only(
                                                                  top: SizeConfig
                                                                          .blockSizeVertical *
                                                                      1),
                                                              child: Text(
                                                                Strings
                                                                    .Atalanta,
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        15),
                                                              ),
                                                            )
                                                          ],
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                        ),
                                                      ),
                                                      Spacer(),
                                                      Container(
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          6.0,
                                                                      vertical:
                                                                          3.0),
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                                color: AppTheme
                                                                    .greyColor,
                                                              ),
                                                              child: Text(
                                                                "1",
                                                                style: TextStyle(
                                                                    color: AppTheme
                                                                        .blackColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets.only(
                                                                  top: SizeConfig
                                                                          .blockSizeVertical *
                                                                      1),
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          6.0,
                                                                      vertical:
                                                                          3.0),
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                                color: AppTheme
                                                                    .greyColor,
                                                              ),
                                                              child: Text(
                                                                Strings.scores,
                                                                style: TextStyle(
                                                                    color: AppTheme
                                                                        .blackColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            right: SizeConfig
                                                                    .blockSizeHorizontal *
                                                                10,
                                                            left: SizeConfig
                                                                    .blockSizeHorizontal *
                                                                3),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              Strings.Finished,
                                                              style: TextStyle(
                                                                  color: AppTheme
                                                                      .greenColor),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets.only(
                                                                  top: SizeConfig
                                                                          .blockSizeVertical *
                                                                      1),
                                                              child: Text(
                                                                Strings.Espn,
                                                                style: TextStyle(
                                                                    color: AppTheme
                                                                        .lightgrey,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        top: SizeConfig
                                                                .blockSizeVertical *
                                                            3),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          child: Column(
                                                            children: [
                                                              SvgPicture.asset(
                                                                'assets/Manchester.svg',
                                                                width: SizeConfig
                                                                        .blockSizeHorizontal *
                                                                    6,
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets.only(
                                                                    top: SizeConfig
                                                                            .blockSizeVertical *
                                                                        1),
                                                                child:
                                                                    SvgPicture
                                                                        .asset(
                                                                  'assets/paris.svg',
                                                                  width: SizeConfig
                                                                          .blockSizeHorizontal *
                                                                      6,
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          margin: EdgeInsets.only(
                                                              left: SizeConfig
                                                                      .blockSizeHorizontal *
                                                                  5),
                                                        ),
                                                        Container(
                                                          margin: EdgeInsets.only(
                                                              left: SizeConfig
                                                                      .blockSizeHorizontal *
                                                                  2),
                                                          child: Column(
                                                            children: [
                                                              Text(
                                                                Strings
                                                                    .manshester,
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        15),
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets.only(
                                                                    top: SizeConfig
                                                                            .blockSizeVertical *
                                                                        1),
                                                                child: Text(
                                                                  Strings.Lyon,
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          15),
                                                                ),
                                                              )
                                                            ],
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                          ),
                                                        ),
                                                        Spacer(),
                                                        Container(
                                                          child: Column(
                                                            children: [
                                                              Container(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            6.0,
                                                                        vertical:
                                                                            3.0),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                  color: AppTheme
                                                                      .greyColor,
                                                                ),
                                                                child: Text(
                                                                  "1",
                                                                  style: TextStyle(
                                                                      color: AppTheme
                                                                          .blackColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                ),
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets.only(
                                                                    top: SizeConfig
                                                                            .blockSizeVertical *
                                                                        1),
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            6.0,
                                                                        vertical:
                                                                            3.0),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                  color: AppTheme
                                                                      .greyColor,
                                                                ),
                                                                child: Text(
                                                                  Strings
                                                                      .scores,
                                                                  style: TextStyle(
                                                                      color: AppTheme
                                                                          .blackColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          margin: EdgeInsets.only(
                                                              right: SizeConfig
                                                                      .blockSizeHorizontal *
                                                                  10,
                                                              left: SizeConfig
                                                                      .blockSizeHorizontal *
                                                                  3),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                Strings
                                                                    .Finished,
                                                                style: TextStyle(
                                                                    color: AppTheme
                                                                        .greenColor),
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets.only(
                                                                    top: SizeConfig
                                                                            .blockSizeVertical *
                                                                        1),
                                                                child: Text(
                                                                  Strings.Espn,
                                                                  style: TextStyle(
                                                                      color: AppTheme
                                                                          .lightgrey,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              );
                                            }),
                                      ],
                                    ),
                                    padding: EdgeInsets.only(
                                        bottom:
                                            SizeConfig.blockSizeHorizontal * 2,
                                        top: SizeConfig.blockSizeVertical * 2),
                                    margin: EdgeInsets.only(
                                        top: SizeConfig.blockSizeVertical * 2),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Theme.of(context).cardColor,
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              right: SizeConfig
                                                      .blockSizeHorizontal *
                                                  4,
                                              left: SizeConfig
                                                      .blockSizeHorizontal *
                                                  4),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                Strings.transfers,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 16),
                                              ),
                                              GestureDetector(
                                                child: Text(
                                                  Strings.see_all,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16,
                                                      color:
                                                          AppTheme.blueColor),
                                                ),
                                                onTap: () {},
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                            child: GetDivider(),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: SizeConfig
                                                        .blockSizeHorizontal *
                                                    4,
                                                vertical: SizeConfig
                                                        .blockSizeVertical *
                                                    0.5)),
                                        Container(
                                          margin: EdgeInsets.only(
                                            left:
                                                SizeConfig.blockSizeHorizontal *
                                                    3,
                                          ),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons
                                                    .supervised_user_circle_rounded,
                                                color: AppTheme.greyColor,
                                                size: 50,
                                              ),
                                              Column(
                                                children: [
                                                  Container(
                                                    child: Text(
                                                      Strings.name1,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 14),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                      left: SizeConfig
                                                              .blockSizeHorizontal *
                                                          1.5,
                                                    ),
                                                    child: Text(
                                                      Strings.teamName,
                                                      style: TextStyle(
                                                          color: AppTheme
                                                              .greyColor,
                                                          fontSize: 14),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                  width: SizeConfig
                                                          .blockSizeVertical *
                                                      2),
                                              Center(
                                                  child: SvgPicture.asset(
                                                'assets/Check.svg',
                                                height: SizeConfig
                                                        .blockSizeHorizontal *
                                                    10,
                                              )),
                                              SizedBox(
                                                  width: SizeConfig
                                                          .blockSizeHorizontal *
                                                      2),
                                              SvgPicture.asset(
                                                  'assets/athletic-club-madrid.svg'),
                                              Column(
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: SizeConfig
                                                                .blockSizeVertical *
                                                            1.5),
                                                    child: Text(
                                                      Strings.name2,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 15),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      Strings.name3,
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
                                        ),
                                      ],
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        vertical:
                                            SizeConfig.blockSizeVertical * 2),
                                    margin: EdgeInsets.only(
                                        top: SizeConfig.blockSizeVertical * 2),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Theme.of(context).cardColor,
                                    ),
                                  ),
/*
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                            horizontal:
                                                SizeConfig.blockSizeHorizontal *
                                                    4,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                Strings.matches1,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 16),
                                              ),
                                              GestureDetector(
                                                child: Text(
                                                  Strings.see_all,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16,
                                                      color:
                                                          AppTheme.blueColor),
                                                ),
                                                onTap: () {},
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                            child: GetDivider(),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: SizeConfig
                                                        .blockSizeHorizontal *
                                                    4)),
                                        Container(
                                          child: Text(
                                            Strings.UEFA_Champions_League,
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: AppTheme.greyColor),
                                          ),
                                          margin: EdgeInsets.only(
                                            left:
                                                SizeConfig.blockSizeHorizontal *
                                                    4,
                                          ),
                                        ),
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
                                                        SvgPicture.asset(
                                                          'assets/valencia.svg',
                                                          width: SizeConfig
                                                                  .blockSizeHorizontal *
                                                              6,
                                                        ),
                                                        SizedBox(
                                                            width: SizeConfig
                                                                    .blockSizeHorizontal *
                                                                2),
                                                        Container(
                                                          child: Text(
                                                            Strings
                                                                .Borussia_Dortmund,
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 14),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                            width: SizeConfig
                                                                    .blockSizeHorizontal *
                                                                6),
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
                                                          Strings.time,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        Spacer(),
                                                        notificationBell(),
                                                      ],
                                                    ),
                                                    margin: EdgeInsets.only(
                                                      right: SizeConfig
                                                              .blockSizeHorizontal *
                                                          4.7,
                                                      left: SizeConfig
                                                              .blockSizeHorizontal *
                                                          5,
                                                      bottom: SizeConfig
                                                              .blockSizeVertical *
                                                          1,
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Row(
                                                      children: [
                                                        SvgPicture.asset(
                                                          'assets/chelsea.svg',
                                                          width: SizeConfig
                                                                  .blockSizeHorizontal *
                                                              6.5,
                                                        ),
                                                        SizedBox(
                                                            width: SizeConfig
                                                                    .blockSizeHorizontal *
                                                                2),
                                                        Container(
                                                          child: Text(
                                                            Strings.Chelsea,
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 14),
                                                          ),
                                                        ),
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
                                                          Strings.Direct_TV,
                                                          style: TextStyle(
                                                              color: AppTheme
                                                                  .lightgrey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        SizedBox(
                                                            width: SizeConfig
                                                                    .blockSizeHorizontal *
                                                                4),
                                                        directLinkBell(),
                                                      ],
                                                    ),
                                                    margin: EdgeInsets.only(
                                                      right: SizeConfig
                                                              .blockSizeHorizontal *
                                                          5,
                                                      left: SizeConfig
                                                              .blockSizeHorizontal *
                                                          5,
                                                      bottom: SizeConfig
                                                              .blockSizeVertical *
                                                          2,
                                                    ),
                                                  )
                                                ],
                                              );
                                            }),
                                      ],
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        vertical:
                                            SizeConfig.blockSizeVertical * 2),
                                    margin: EdgeInsets.only(
                                        top: SizeConfig.blockSizeVertical * 2),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Theme.of(context).cardColor,
                                    ),
                                  )
*/
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    )
            ],
          )),
        ]));
  }

  void showTutorial() {
    tutorialCoachMark = TutorialCoachMark(context,
        targets: targets,
        alignSkip: Alignment.topCenter,
        colorShadow: AppTheme.blackColor,
        textSkip: "Omitir",
        textStyleSkip: TextStyle(
            fontWeight: FontWeight.w500,
            color: AppTheme.whiteColor,
            fontSize: 18),
        paddingFocus: 10,
        opacityShadow: 0.7,
        onFinish: () {}, onClickTarget: (target) {
      SharedPreferenceData().saveFirstRun(false);
    }, onClickSkip: () {
      SharedPreferenceData().saveFirstRun(false);
    })
      ..show();
  }

  void _afterLayout(_) {
    Future.delayed(Duration(milliseconds: 100), () {
      showTutorial();
    });
  }

  void initCoachMarker() {
    targets.add(TargetFocus(
      identify: "Target 1",
      keyTarget: _arenaKey,
      contents: [
        ContentTarget(
            align: AlignContent.top,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 6.0),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: AppTheme.whiteColor,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  height: SizeConfig.blockSizeVertical * 15,
                  width: SizeConfig.blockSizeVertical * 25,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 3,
                            top: SizeConfig.blockSizeVertical * 1),
                        child: Text(
                          "My Arena",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppTheme.blackColor,
                              fontSize: 20.0),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 3,
                            top: SizeConfig.blockSizeVertical * 1),
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                          style: TextStyle(color: AppTheme.greyColor),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ))
      ],
    ));

    targets
        .add(TargetFocus(identify: "Target 2", keyTarget: _loginKey, contents: [
      ContentTarget(
          align: AlignContent.right,
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Title lorem ipsum",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20.0),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ))
    ]));
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
  }
}
