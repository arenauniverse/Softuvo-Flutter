import 'package:arena_sports_app/CommonWidgets/Strings.dart';
import 'package:arena_sports_app/CommonWidgets/buttons.dart';
import 'package:arena_sports_app/CommonWidgets/dividerWidget.dart';
import 'package:arena_sports_app/CommonWidgets/sharePreferenceData.dart';
import 'package:arena_sports_app/LoginSignUpListing/LoginSgnupListingView.dart';
import 'package:arena_sports_app/NewsDetails/NewsDetails_View.dart';
import 'package:arena_sports_app/SizeConfig.dart';
import 'package:arena_sports_app/feedHome/FeedHomeView.dart';
import 'package:arena_sports_app/myProfile/myProfileView.dart';
import 'package:arena_sports_app/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class UserDahboardView extends StatefulWidget {
  @override
  _UserDahboardViewState createState() => _UserDahboardViewState();
}

class _UserDahboardViewState extends State<UserDahboardView> {
  bool status = false;

  @override
  void initState() {
    SharedPreferenceData().getRegisteredValue().then((value) {
      setState(() {
        status = value;
      });
    });
    super.initState();
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
                      status == true
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      MyProfileView()))
                          : _showModalSheet();
                    },
                    child: Container(
                      child: SvgPicture.asset('assets/ArenaLogin.svg'),
                      margin: EdgeInsets.only(),
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
                    child: Transform.scale(
                      scale: 1.4,
                      child: Switch(
                        activeColor: AppTheme.blueColor,
                        value: status,
                        onChanged: (val) {
                          setState(() {
                            status = val;
                          });
                        },
                        dragStartBehavior: DragStartBehavior.down,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: SizeConfig.blockSizeHorizontal * 3.5,
                    ),
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: AppTheme.greyColor,
                      child: SvgPicture.asset('assets/search.svg'),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate(
            <Widget>[
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
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
                    ),
                    margin: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal * 6,
                        top: SizeConfig.blockSizeVertical * 2),
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.blockSizeHorizontal * 2),
                        child: Row(
                          children: [
                            Container(
                                width: SizeConfig.blockSizeHorizontal * 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Theme.of(context).cardColor,
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width:
                                          SizeConfig.blockSizeHorizontal * 0.8,
                                      height: SizeConfig.blockSizeVertical * 9,
                                      margin: EdgeInsets.only(
                                          top:
                                              SizeConfig.blockSizeVertical * 3),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
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
                                                  child: Text(Strings.US_OPEN,
                                                      style: TextStyle(
                                                          color: AppTheme
                                                              .greyColor)),
                                                ),
                                                Spacer(),
                                                Text(
                                                  Strings.numbers,
                                                  style: TextStyle(
                                                      color:
                                                          AppTheme.borderColor),
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
                                                  color: AppTheme.greyColor,
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
                                                          FontWeight.bold,
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
                                                      color:
                                                          AppTheme.blackColor,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                SizedBox(
                                                    width: SizeConfig
                                                            .blockSizeHorizontal *
                                                        3),
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 6.0,
                                                      vertical: 3.0),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    color: AppTheme.greyColor,
                                                  ),
                                                  child: Text(
                                                    Strings.scores,
                                                    style: TextStyle(
                                                        color:
                                                            AppTheme.blackColor,
                                                        fontWeight:
                                                            FontWeight.w600),
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
                                                  color: AppTheme.greyColor,
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
                                                          FontWeight.bold,
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
                                                      color:
                                                          AppTheme.blackColor,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                SizedBox(
                                                    width: SizeConfig
                                                            .blockSizeHorizontal *
                                                        3),
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 6.0,
                                                      vertical: 3.0),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    color: AppTheme.greyColor,
                                                  ),
                                                  child: Text(
                                                    Strings.scores,
                                                    style: TextStyle(
                                                        color:
                                                            AppTheme.blackColor,
                                                        fontWeight:
                                                            FontWeight.w600),
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
                              width: SizeConfig.blockSizeHorizontal * 2,
                            ),
                            Row(
                              children: [
                                Container(
                                    width: SizeConfig.blockSizeHorizontal * 70,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Theme.of(context).cardColor,
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  0.8,
                                          height:
                                              SizeConfig.blockSizeVertical * 9,
                                          margin: EdgeInsets.only(
                                              top:
                                                  SizeConfig.blockSizeVertical *
                                                      3),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(6),
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
                                                      color: AppTheme.greyColor,
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
                                                              FontWeight.bold,
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
                                                              FontWeight.w600),
                                                    ),
                                                    SizedBox(
                                                        width: SizeConfig
                                                                .blockSizeHorizontal *
                                                            3),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 6.0,
                                                              vertical: 3.0),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                        color:
                                                            AppTheme.greyColor,
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
                                                      color: AppTheme.greyColor,
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
                                                              FontWeight.bold,
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
                                                              FontWeight.w600),
                                                    ),
                                                    SizedBox(
                                                        width: SizeConfig
                                                                .blockSizeHorizontal *
                                                            3),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 6.0,
                                                              vertical: 3.0),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                        color:
                                                            AppTheme.greyColor,
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
                                    right: SizeConfig.blockSizeHorizontal * 4,
                                    left: SizeConfig.blockSizeHorizontal * 4),
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
                                margin: EdgeInsets.symmetric(
                                    vertical:
                                        SizeConfig.blockSizeVertical * 0.5,
                                    horizontal:
                                        SizeConfig.blockSizeHorizontal * 4),
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
                                      width:
                                          SizeConfig.blockSizeHorizontal * 120,
                                    ),
                                    SizedBox(
                                        height:
                                            SizeConfig.blockSizeVertical * 2),
                                    Container(
                                      margin: EdgeInsets.only(
                                          right:
                                              SizeConfig.blockSizeHorizontal *
                                                  4,
                                          left: SizeConfig.blockSizeHorizontal *
                                              4),
                                      child: Text(Strings.aboutPlayer,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          )),
                                    )
                                  ]),
                                ),
                              ),
                              Container(
                                child: Espn(context),
                                margin: EdgeInsets.only(
                                    right: SizeConfig.blockSizeHorizontal * 4,
                                    left: SizeConfig.blockSizeHorizontal * 4),
                              ),
                              Container(
                                  child: GetDivider(),
                                  margin: EdgeInsets.only(
                                    right: SizeConfig.blockSizeHorizontal * 4,
                                    left: SizeConfig.blockSizeHorizontal * 4,
                                    top: SizeConfig.blockSizeVertical * 0.5,
                                    bottom: SizeConfig.blockSizeVertical * 0.5,
                                  )),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        left:
                                            SizeConfig.blockSizeHorizontal * 4,
                                        right:
                                            SizeConfig.blockSizeHorizontal * 3),
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
                                      right: SizeConfig.blockSizeHorizontal * 4,
                                      left: SizeConfig.blockSizeHorizontal * 4,
                                      top: SizeConfig.blockSizeVertical * 0.5,
                                      bottom:
                                          SizeConfig.blockSizeVertical * 0.5)),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        left:
                                            SizeConfig.blockSizeHorizontal * 4,
                                        right:
                                            SizeConfig.blockSizeHorizontal * 3),
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
                                      right: SizeConfig.blockSizeHorizontal * 4,
                                      left: SizeConfig.blockSizeHorizontal * 4,
                                      top: SizeConfig.blockSizeVertical * 0.5,
                                      bottom:
                                          SizeConfig.blockSizeVertical * 0.5)),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        left:
                                            SizeConfig.blockSizeHorizontal * 5,
                                        right:
                                            SizeConfig.blockSizeHorizontal * 3),
                                    child: Text(
                                      Strings.textTime,
                                      style:
                                          TextStyle(color: AppTheme.greyColor),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      Strings.text1,
                                      style: TextStyle(
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
                                      right: SizeConfig.blockSizeHorizontal * 4,
                                      left: SizeConfig.blockSizeHorizontal * 4,
                                      top: SizeConfig.blockSizeVertical * 0.5,
                                      bottom:
                                          SizeConfig.blockSizeVertical * 0.5)),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      right: SizeConfig.blockSizeHorizontal * 3,
                                      left: SizeConfig.blockSizeHorizontal * 5,
                                    ),
                                    child: Text(
                                      Strings.textTime,
                                      style:
                                          TextStyle(color: AppTheme.greyColor),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      Strings.text1,
                                      style: TextStyle(
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
                                    left: SizeConfig.blockSizeHorizontal * 4,
                                    right: SizeConfig.blockSizeHorizontal * 4,
                                    top: SizeConfig.blockSizeVertical * 2),
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
                                  margin: EdgeInsets.symmetric(
                                    vertical:
                                        SizeConfig.blockSizeVertical * 0.5,
                                    horizontal:
                                        SizeConfig.blockSizeHorizontal * 4,
                                  )),
                              Container(
                                height: SizeConfig.blockSizeVertical * 25,
                                // width: SizeConfig.blockSizeVertical * 35,
                                margin: EdgeInsets.symmetric(
                                    vertical:
                                        SizeConfig.blockSizeVertical * 0.5,
                                    horizontal:
                                        SizeConfig.blockSizeHorizontal * 4),
                                child: Swiper(
                                  viewportFraction: 0.65,
                                  scale: 0.8,
                                  itemCount: 2,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (BuildContext ctxt, int index) {
                                    return Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                      child: Container(
                                        child: Column(
                                          children: [
                                            Stack(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  25))),
                                                  width: SizeConfig
                                                          .blockSizeVertical *
                                                      35,
                                                  child: Image.asset(
                                                    'assets/videoImage.png',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Positioned(
                                                  top: 5.0,
                                                  left: SizeConfig
                                                          .blockSizeVertical *
                                                      10.8,
                                                  bottom: 5.0,
                                                  child: GestureDetector(
                                                    child: SvgPicture.asset(
                                                      'assets/playIcon.svg',
                                                      width: SizeConfig
                                                              .blockSizeVertical *
                                                          5,
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                    top: SizeConfig
                                                            .blockSizeVertical *
                                                        10,
                                                    left: SizeConfig
                                                            .blockSizeVertical *
                                                        2,
                                                    bottom: 18.0,
                                                    child: Container(
                                                      child: Text(
                                                        Strings.textTime,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: AppTheme
                                                                .whiteColor),
                                                      ),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(6),
                                                          color:
                                                              Color(0xFF0E3311)
                                                                  .withOpacity(
                                                                      0.5)),
                                                      padding:
                                                          EdgeInsets.all(3),
                                                    )),
/*
                                                Positioned(
                                                  child: Container(
                                                    width: SizeConfig
                                                            .blockSizeVertical *
                                                        40,
                                                    child: Slider(
                                                      mouseCursor:
                                                          MouseCursor.defer,
                                                      activeColor: AppTheme
                                                          .borderColor,
                                                      inactiveColor: Color(
                                                              0xFF0E3311)
                                                          .withOpacity(0.5),
                                                      onChanged: (v) {
                                                        */
/*  final Position = v * _duration.inMilliseconds;
                                                      _audioPlayer.seek(Duration(milliseconds: Position.round()));*/ /*

                                                      },
                                                      value: 2.3,
                                                      max: 5,
                                                      min: 1,
                                                    ),
                                                  ),
                                                  top: SizeConfig
                                                          .blockSizeVertical *
                                                      16.7,
                                                  bottom: 17.0,
                                                )
*/
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                left: SizeConfig
                                                        .blockSizeHorizontal *
                                                    1,
                                              ),
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    left: SizeConfig
                                                            .blockSizeHorizontal *
                                                        4,
                                                    top: SizeConfig
                                                            .blockSizeVertical *
                                                        1),
                                                child: Text(
                                                  Strings.text2,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600),
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
                            vertical: SizeConfig.blockSizeVertical * 2,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal:
                                        SizeConfig.blockSizeHorizontal * 4),
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
                                  margin: EdgeInsets.symmetric(
                                      horizontal:
                                          SizeConfig.blockSizeHorizontal * 4,
                                      vertical:
                                          SizeConfig.blockSizeVertical * 0.5)),
                              Container(
                                margin: EdgeInsets.only(
                                  left: SizeConfig.blockSizeHorizontal * 4,
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
                                  itemBuilder: (BuildContext ctxt, int index) {
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
                                                child: Text(
                                                  Strings.Borussia_Dortmund,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                        FontWeight.w600),
                                              ),
                                              Spacer(),
                                              notificationBell(),
                                            ],
                                          ),
                                          margin: EdgeInsets.only(
                                            right:
                                                SizeConfig.blockSizeHorizontal *
                                                    4.7,
                                            left:
                                                SizeConfig.blockSizeHorizontal *
                                                    5,
                                            bottom:
                                                SizeConfig.blockSizeVertical *
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
                                                          FontWeight.bold,
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
                                                    color: AppTheme.lightgrey,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              SizedBox(
                                                  width: SizeConfig
                                                          .blockSizeHorizontal *
                                                      4),
                                              directLinkBell(),
                                            ],
                                          ),
                                          margin: EdgeInsets.only(
                                            right:
                                                SizeConfig.blockSizeHorizontal *
                                                    5,
                                            left:
                                                SizeConfig.blockSizeHorizontal *
                                                    5,
                                            bottom:
                                                SizeConfig.blockSizeVertical *
                                                    2,
                                          ),
                                        )
                                      ],
                                    );
                                  }),
                            ],
                          ),
                          padding: EdgeInsets.only(
                              bottom: SizeConfig.blockSizeHorizontal * 2,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    right: SizeConfig.blockSizeHorizontal * 4,
                                    left: SizeConfig.blockSizeHorizontal * 4),
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
                                  margin: EdgeInsets.symmetric(
                                      horizontal:
                                          SizeConfig.blockSizeHorizontal * 4,
                                      vertical:
                                          SizeConfig.blockSizeVertical * 0.5)),
                              Container(
                                margin: EdgeInsets.only(
                                  left: SizeConfig.blockSizeHorizontal * 3,
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.supervised_user_circle_rounded,
                                      color: AppTheme.greyColor,
                                      size: 50,
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          child: Text(
                                            Strings.name1,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                            left:
                                                SizeConfig.blockSizeHorizontal *
                                                    1.5,
                                          ),
                                          child: Text(
                                            Strings.teamName,
                                            style: TextStyle(
                                                color: AppTheme.greyColor,
                                                fontSize: 14),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                        width:
                                            SizeConfig.blockSizeVertical * 2),
                                    Center(
                                        child: SvgPicture.asset(
                                      'assets/Check.svg',
                                      height:
                                          SizeConfig.blockSizeHorizontal * 10,
                                    )),
                                    SizedBox(
                                        width:
                                            SizeConfig.blockSizeHorizontal * 2),
                                    SvgPicture.asset(
                                        'assets/athletic-club-madrid.svg'),
                                    Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              left:
                                                  SizeConfig.blockSizeVertical *
                                                      1.5),
                                          child: Text(
                                            Strings.name2,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            Strings.name3,
                                            style: TextStyle(
                                                color: AppTheme.greyColor,
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
                              vertical: SizeConfig.blockSizeVertical * 2),
                          margin: EdgeInsets.only(
                              top: SizeConfig.blockSizeVertical * 2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Theme.of(context).cardColor,
                          ),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal:
                                      SizeConfig.blockSizeHorizontal * 4,
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
                                  margin: EdgeInsets.symmetric(
                                      horizontal:
                                          SizeConfig.blockSizeHorizontal * 4)),
                              Container(
                                child: Text(
                                  Strings.UEFA_Champions_League,
                                  style: TextStyle(
                                      fontSize: 16, color: AppTheme.greyColor),
                                ),
                                margin: EdgeInsets.only(
                                  left: SizeConfig.blockSizeHorizontal * 4,
                                ),
                              ),
                              ListView.builder(
                                  physics: ClampingScrollPhysics(),
                                  itemCount: 1,
                                  shrinkWrap: true,
                                  itemBuilder: (BuildContext ctxt, int index) {
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
                                                  Strings.Borussia_Dortmund,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                        FontWeight.w600),
                                              ),
                                              Spacer(),
                                              notificationBell(),
                                            ],
                                          ),
                                          margin: EdgeInsets.only(
                                            right:
                                                SizeConfig.blockSizeHorizontal *
                                                    4.7,
                                            left:
                                                SizeConfig.blockSizeHorizontal *
                                                    5,
                                            bottom:
                                                SizeConfig.blockSizeVertical *
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
                                                          FontWeight.bold,
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
                                                    color: AppTheme.lightgrey,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              SizedBox(
                                                  width: SizeConfig
                                                          .blockSizeHorizontal *
                                                      4),
                                              directLinkBell(),
                                            ],
                                          ),
                                          margin: EdgeInsets.only(
                                            right:
                                                SizeConfig.blockSizeHorizontal *
                                                    5,
                                            left:
                                                SizeConfig.blockSizeHorizontal *
                                                    5,
                                            bottom:
                                                SizeConfig.blockSizeVertical *
                                                    2,
                                          ),
                                        )
                                      ],
                                    );
                                  }),
                            ],
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: SizeConfig.blockSizeVertical * 2),
                          margin: EdgeInsets.only(
                              top: SizeConfig.blockSizeVertical * 2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Theme.of(context).cardColor,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          )),
        ]));
  }

  Widget Espn(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 1),
      child: Row(
        children: [
          Stack(
            children: [
              SvgPicture.asset(
                'assets/Rectangle.svg',
                width: SizeConfig.blockSizeHorizontal * 7.7,
              ),
              Positioned(
                top: 5.0,
                left: 2.0,
                bottom: 5.0,
                child: GestureDetector(
                  child: SvgPicture.asset(
                    'assets/Shape.svg',
                    width: SizeConfig.blockSizeHorizontal * 6.8,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            width: 5.0,
          ),
          Text(
            Strings.Espn,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          SizedBox(
            width: 5.0,
          ),
          Text(
            Strings.time2,
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
