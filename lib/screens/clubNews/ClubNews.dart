import 'package:arena_sports_app/CommonWidgets/ChannelWidget.dart';
import 'package:arena_sports_app/CommonWidgets/Messages.dart';
import 'package:arena_sports_app/CommonWidgets/SizeConfig.dart';
import 'package:arena_sports_app/CommonWidgets/SlideRightRoute.dart';
import 'package:arena_sports_app/CommonWidgets/Strings.dart';
import 'package:arena_sports_app/CommonWidgets/buttons.dart';
import 'package:arena_sports_app/CommonWidgets/cammonMethods.dart';
import 'package:arena_sports_app/CommonWidgets/dividerWidget.dart';
import 'package:arena_sports_app/screens/news/NewsDetails_View.dart';
import 'package:arena_sports_app/screens/news/NewsView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_svg/svg.dart';

import '../../theme.dart';

class ClubNewsView extends StatefulWidget {
  @override
  _ClubNewsViewState createState() => _ClubNewsViewState();
}

class _ClubNewsViewState extends State<ClubNewsView> {
  TabController _tabController;
  TextStyle styles = TextStyle(fontWeight: FontWeight.w400, fontSize: 15);
  TextStyle boldStyles = TextStyle(fontWeight: FontWeight.w700, fontSize: 15);
  int progressvalue = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 5,
        child: NestedScrollView(
          physics: ClampingScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: SizeConfig.blockSizeVertical * 35,
                bottom: PreferredSize(
                    preferredSize: Size.fromHeight(50.0),
                    child: Container(
                      color: Colors.white,
                      child: TabBar(
                        // isScrollable: true,
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        labelPadding: EdgeInsets.all(0.0),
                        indicatorPadding: EdgeInsets.all(0.0),
                        tabs: [
                          Tab(text: "Noticias"),
                          Tab(text: "Torneo"),
                          Tab(text: "Plantilla"),
                          Tab(text: "H2H"),
                          Tab(text: "Info"),
                        ],
                      ),
                    )),
                pinned: true,
                primary: true,
                forceElevated: true,
                leading: new IconButton(
                  icon: Image.asset('assets/back_btn.png'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                actions: <Widget>[
                  GestureDetector(
                    onTap: implementNotification,
                    child: Image.asset(
                      'assets/notification_bell.png',
                      width: SizeConfig.blockSizeVertical * 2.5,
                    ),
                  ),
                  Container(padding: const EdgeInsets.all(5.0)),
                  GestureDetector(
                    onTap: implementNotification,
                    child: Image.asset(
                      'assets/fav_unselected.png',
                      width: SizeConfig.blockSizeVertical * 3,
                    ),
                  ),
                  Container(padding: const EdgeInsets.all(5.0)),
                  GestureDetector(
                    onTap: implementNotification,
                    child: Image.asset(
                      'assets/upload_icon.png',
                      width: SizeConfig.blockSizeVertical * 2.5,
                    ),
                  ),
                  Container(padding: const EdgeInsets.all(5.0))
                ],
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  background: Container(
                    margin: EdgeInsets.only(bottom: 50),
                    child: Stack(
                      children: <Widget>[
                        //Image.network("https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350", fit: BoxFit.fitWidth,),
                        Container(
                          height: SizeConfig.blockSizeVertical * 70,
                          width: SizeConfig.blockSizeVertical * 100,
                          child: Image.asset(
                            'assets/ground_cover.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.all(17),
                            padding: EdgeInsets.all(3),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Row(
                                children: [
                                  Align(
                                    child: Container(
                                        padding: EdgeInsets.all(3),
                                        child: SvgPicture.asset(
                                          "assets/Barcelona.svg",
                                          width: 50,
                                        )),
                                    alignment: Alignment.bottomLeft,
                                  ),
                                  Container(
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(3),
                                            child: Text(
                                              "Barcelona FC",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Theme.of(context)
                                                      .backgroundColor),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                                padding: EdgeInsets.all(3),
                                                child: Row(
                                                  children: [
                                                    /* Container(
                                                        padding:
                                                            EdgeInsets.all(3),
                                                        child: Image.asset(
                                                          "assets/esFlag.png",
                                                          width: SizeConfig
                                                                  .blockSizeVertical *
                                                              2.5,
                                                        )),*/
                                                    Container(
                                                      padding:
                                                          EdgeInsets.all(3),
                                                      child: Text(
                                                        "La Liga, España",
                                                        style: TextStyle(
                                                            color: Theme.of(
                                                                    context)
                                                                .backgroundColor),
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                              width: SizeConfig.blockSizeVertical * 12,
                              height: SizeConfig.blockSizeVertical * 4,
                              margin: EdgeInsets.all(17),
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  color: Colors.black87,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                      padding: EdgeInsets.all(3),
                                      child: Image.asset(
                                        'assets/arena_logo_small.png',
                                      )),
                                  Container(
                                    child: Text(
                                      "My arena",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .backgroundColor),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                  // Image.network("https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350", fit: BoxFit.cover,)
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  onTap: () {
                                    Navigator.push(context,
                                        SlideRightRoute(page: NewsView()));
                                  },
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: GetDivider(),
                            margin: EdgeInsets.symmetric(
                                vertical: SizeConfig.blockSizeVertical * 0.5,
                                horizontal: SizeConfig.blockSizeHorizontal * 4),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NewsDetailsView()),
                              );
                            },
                            child: Container(
                              child: Column(children: [
                                Image.asset(
                                  'assets/Imagenew.png',
                                  fit: BoxFit.fitWidth,
                                  //width: SizeConfig.blockSizeHorizontal * 120,
                                ),
                                SizedBox(
                                    height: SizeConfig.blockSizeVertical * 2),
                                Container(
                                  margin: EdgeInsets.only(
                                      right: SizeConfig.blockSizeHorizontal * 4,
                                      left: SizeConfig.blockSizeHorizontal * 4),
                                  child: Text(Strings.aboutPlayer,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      )),
                                )
                              ]),
                            ),
                          ),
                          Container(
                            child: ChannelWidget(),
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
                                    left: SizeConfig.blockSizeHorizontal * 4,
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
                                      Strings.text,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
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
                                  right: SizeConfig.blockSizeHorizontal * 4,
                                  left: SizeConfig.blockSizeHorizontal * 4,
                                  top: SizeConfig.blockSizeVertical * 0.5,
                                  bottom: SizeConfig.blockSizeVertical * 0.5)),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    left: SizeConfig.blockSizeHorizontal * 5,
                                    right: SizeConfig.blockSizeHorizontal * 3),
                                child: Text(
                                  Strings.textTime,
                                  style: TextStyle(color: AppTheme.greyColor),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  Strings.text1,
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ),
                              SvgPicture.asset(
                                'assets/newsImage.png',
                                width: SizeConfig.blockSizeHorizontal * 8,
                              ),
                            ],
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockSizeVertical * 2,
                      ),
                      margin: EdgeInsets.symmetric(
                          horizontal: SizeConfig.blockSizeVertical * 1.5,
                          vertical: SizeConfig.blockSizeVertical * 1.5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Theme.of(context).cardColor,
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                right: SizeConfig.blockSizeHorizontal * 4,
                                left: SizeConfig.blockSizeHorizontal * 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  Strings.socialNetwork,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: GetDivider(),
                            margin: EdgeInsets.symmetric(
                                horizontal: SizeConfig.blockSizeHorizontal * 4),
                          ),
/*                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NewsDetailsView()),
                              );
                            },
                            child: Container(
                              child: Column(children: [
                                SizedBox(
                                    height: SizeConfig.blockSizeVertical * 2),
                              ]),
                            ),
                          )*/
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    left: SizeConfig.blockSizeHorizontal * 4,
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
                                      Strings.text,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top:
                                              SizeConfig.blockSizeVertical * 1),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            "assets/twitter.png",
                                            width:
                                                SizeConfig.blockSizeVertical *
                                                    4,
                                          ),
                                          SizedBox(
                                            width: 5.0,
                                          ),
                                          Text(
                                            "@barcelona_es",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: AppTheme.blueColor),
                                          ),
                                          SizedBox(
                                            width: 5.0,
                                          ),
                                          Text(
                                            Strings.time2,
                                            style: TextStyle(
                                                color: AppTheme.greyColor),
                                          ),
                                        ],
                                      ),
                                    ),
                                    //   ChannelWidget(),
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
                                  bottom: SizeConfig.blockSizeVertical * 0.5)),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    left: SizeConfig.blockSizeHorizontal * 5,
                                    right: SizeConfig.blockSizeHorizontal * 3),
                                child: Text(
                                  Strings.textTime,
                                  style: TextStyle(color: AppTheme.greyColor),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  Strings.text1,
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ),
                              SvgPicture.asset(
                                'assets/newsImage.png',
                                width: SizeConfig.blockSizeHorizontal * 8,
                              ),
                            ],
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockSizeVertical * 2,
                      ),
                      margin: EdgeInsets.symmetric(
                          horizontal: SizeConfig.blockSizeVertical * 1.5,
                          vertical: SizeConfig.blockSizeVertical * 1.5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Theme.of(context).cardColor,
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: ClampingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockSizeVertical * 2,
                      ),
                      margin: EdgeInsets.symmetric(
                          horizontal: SizeConfig.blockSizeVertical * 1.5,
                          vertical: SizeConfig.blockSizeVertical * 1.5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Theme.of(context).cardColor,
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                right: SizeConfig.blockSizeHorizontal * 4,
                                left: SizeConfig.blockSizeHorizontal * 4),
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/league.png",
                                  height: SizeConfig.blockSizeVertical * 4,
                                ),
                                SizedBox(
                                    width: SizeConfig.blockSizeHorizontal * 2),
                                Container(
                                  child: Text(
                                    "La Liga",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  size: SizeConfig.blockSizeVertical * 3,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: SizeConfig.blockSizeHorizontal * 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              "La Liga",
                              style: TextStyle(
                                fontSize: 16,
                                color: AppTheme.greyColor,
                              ),
                            ),
                          ),
                          ListView.builder(
                              itemCount: 1,
                              physics: ClampingScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (BuildContext ctxt, int index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          child: Column(
                                            children: [
                                              SvgPicture.asset(
                                                'assets/Barcelona.svg',
                                                width: SizeConfig
                                                        .blockSizeHorizontal *
                                                    6,
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: SizeConfig
                                                            .blockSizeVertical *
                                                        1),
                                                child: SvgPicture.asset(
                                                  'assets/Bayern_Munich.svg',
                                                  width: SizeConfig
                                                          .blockSizeHorizontal *
                                                      6.5,
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
                                                Strings.barcelona,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: SizeConfig
                                                            .blockSizeVertical *
                                                        1),
                                                child: Text(
                                                  Strings.Bayern_Munich,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15),
                                                ),
                                              )
                                            ],
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: SizeConfig
                                                      .blockSizeHorizontal *
                                                  10),
                                          child: Column(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 6.0,
                                                    vertical: 3.0),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
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
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: SizeConfig
                                                            .blockSizeVertical *
                                                        1),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 6.0,
                                                    vertical: 3.0),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  color: AppTheme.greyColor,
                                                ),
                                                child: Text(
                                                  Strings.sixscores,
                                                  style: TextStyle(
                                                      color:
                                                          AppTheme.blackColor,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: SizeConfig
                                                      .blockSizeHorizontal *
                                                  4),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                Strings.numbers,
                                                style: TextStyle(
                                                    color:
                                                        AppTheme.borderColor),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: SizeConfig
                                                            .blockSizeVertical *
                                                        1),
                                                child: Text(
                                                  Strings.Direct_TV,
                                                  style: TextStyle(
                                                      color: AppTheme.lightgrey,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: SizeConfig
                                                      .blockSizeHorizontal *
                                                  9),
                                          child: Column(
                                            children: [
                                              notificationBell(),
                                              Container(
                                                child: directLinkBell(),
                                                margin: EdgeInsets.only(
                                                    top: SizeConfig
                                                            .blockSizeVertical *
                                                        1),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Container(
                                        child: GetDivider(),
                                        margin: EdgeInsets.symmetric(
                                            horizontal:
                                                SizeConfig.blockSizeHorizontal *
                                                    4,
                                            vertical:
                                                SizeConfig.blockSizeHorizontal *
                                                    1)),
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
                                                child: SvgPicture.asset(
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
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: SizeConfig
                                                            .blockSizeVertical *
                                                        1),
                                                child: Text(
                                                  Strings.Atalanta,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15),
                                                ),
                                              )
                                            ],
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: SizeConfig
                                                      .blockSizeHorizontal *
                                                  22.5),
                                          child: Column(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 6.0,
                                                    vertical: 3.0),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  color: AppTheme.greyColor,
                                                ),
                                                child: Text(
                                                  "1",
                                                  style: TextStyle(
                                                      color:
                                                          AppTheme.blackColor,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: SizeConfig
                                                            .blockSizeVertical *
                                                        1),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 6.0,
                                                    vertical: 3.0),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
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
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: SizeConfig
                                                      .blockSizeHorizontal *
                                                  4),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                Strings.Finished,
                                                style: TextStyle(
                                                    color: AppTheme.greenColor),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: SizeConfig
                                                            .blockSizeVertical *
                                                        1),
                                                child: Text(
                                                  Strings.Espn,
                                                  style: TextStyle(
                                                      color: AppTheme.lightgrey,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                        child: GetDivider(),
                                        margin: EdgeInsets.symmetric(
                                            horizontal:
                                                SizeConfig.blockSizeHorizontal *
                                                    4,
                                            vertical:
                                                SizeConfig.blockSizeHorizontal *
                                                    1)),
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
                                                child: SvgPicture.asset(
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
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: SizeConfig
                                                            .blockSizeVertical *
                                                        1),
                                                child: Text(
                                                  Strings.Atalanta,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15),
                                                ),
                                              )
                                            ],
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: SizeConfig
                                                      .blockSizeHorizontal *
                                                  22.5),
                                          child: Column(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 6.0,
                                                    vertical: 3.0),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  color: AppTheme.greyColor,
                                                ),
                                                child: Text(
                                                  "1",
                                                  style: TextStyle(
                                                      color:
                                                          AppTheme.blackColor,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: SizeConfig
                                                            .blockSizeVertical *
                                                        1),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 6.0,
                                                    vertical: 3.0),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
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
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: SizeConfig
                                                      .blockSizeHorizontal *
                                                  4),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                Strings.Finished,
                                                style: TextStyle(
                                                    color: AppTheme.greenColor),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: SizeConfig
                                                            .blockSizeVertical *
                                                        1),
                                                child: Text(
                                                  Strings.Espn,
                                                  style: TextStyle(
                                                      color: AppTheme.lightgrey,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              }),
                        ],
                      ),
                      padding: EdgeInsets.only(
                          bottom: SizeConfig.blockSizeHorizontal * 2,
                          top: SizeConfig.blockSizeVertical * 2),
                      margin: EdgeInsets.only(
                          right: SizeConfig.blockSizeHorizontal * 3,
                          left: SizeConfig.blockSizeHorizontal * 3),
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
                                horizontal: SizeConfig.blockSizeHorizontal * 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "CLASSIFICATION",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 16),
                                ),
                                GestureDetector(
                                  child: Text(
                                    "Ver completa",
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
                                  vertical: SizeConfig.blockSizeVertical * 2)),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                      child: Center(
                                        child: Text(
                                          "N",
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ),
                                      margin: EdgeInsets.only(
                                          left: SizeConfig.blockSizeHorizontal *
                                              2),
                                      width:
                                          SizeConfig.blockSizeHorizontal * 8),
                                  Container(
                                    width: SizeConfig.blockSizeHorizontal * 42,
                                    child: Text(
                                      "EQUIPO",
                                      style: boldStyles,
                                    ),
                                  ),
                                  Container(
                                    width: SizeConfig.blockSizeHorizontal * 8,
                                    child: Text(
                                      "PJ",
                                      style: TextStyle(fontSize: 15),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    width: SizeConfig.blockSizeHorizontal * 8,
                                    child: Text(
                                      "PG",
                                      style: TextStyle(fontSize: 15),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    width: SizeConfig.blockSizeHorizontal * 8,
                                    child: Text(
                                      "PP",
                                      style: TextStyle(fontSize: 15),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    width: SizeConfig.blockSizeHorizontal * 8,
                                    child: Text(
                                      "PE",
                                      style: TextStyle(fontSize: 15),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    width: SizeConfig.blockSizeHorizontal * 8,
                                    child: Text(
                                      "PT",
                                      style: boldStyles,
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                height: SizeConfig.blockSizeVertical * 20,
                                child: ListView.builder(
                                  padding: EdgeInsets.only(top: 2),
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return classification(context);
                                  },
                                  itemCount: 4,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockSizeVertical * 2,
                      ),
                      margin: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockSizeVertical * 1.5,
                        horizontal: SizeConfig.blockSizeHorizontal * 3,
                      ),
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
                                horizontal: SizeConfig.blockSizeHorizontal * 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "ESTADISTICAS",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 16),
                                ),
                                GestureDetector(
                                  child: Text(
                                    "Ver completa",
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          "assets/estadistics.png",
                                          width:
                                              SizeConfig.blockSizeVertical * 15,
                                        ),
                                      ],
                                    ),
                                    margin: EdgeInsets.only(
                                        left:
                                            SizeConfig.blockSizeHorizontal * 3),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          left: SizeConfig.blockSizeHorizontal *
                                              3,
                                          right:
                                              SizeConfig.blockSizeHorizontal *
                                                  3),
                                      child: Column(
                                        children: [
                                          Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  "Ganados",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          AppTheme.toggleColor,
                                                      fontSize: 15),
                                                ),
                                                Spacer(),
                                                Text(
                                                  "100",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 15),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: SizeConfig
                                                        .blockSizeVertical *
                                                    1),
                                            height:
                                                SizeConfig.blockSizeVertical *
                                                    1,
                                            width:
                                                SizeConfig.blockSizeVertical *
                                                    26,
                                            child: FAProgressBar(
                                              currentValue: progressvalue,
                                              progressColor: AppTheme.blueColor,
                                              backgroundColor: AppTheme
                                                  .bottomSheetBackgroundColor,
                                              size: 4,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Empatados",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    color: AppTheme.toggleColor,
                                                    fontSize: 15),
                                              ),
                                              Spacer(),
                                              Text(
                                                "20",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 15),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: SizeConfig
                                                        .blockSizeVertical *
                                                    1),
                                            height:
                                                SizeConfig.blockSizeVertical *
                                                    1,
                                            width:
                                                SizeConfig.blockSizeVertical *
                                                    26,
                                            child: FAProgressBar(
                                              currentValue: progressvalue,
                                              progressColor:
                                                  AppTheme.yellowColor,
                                              backgroundColor: AppTheme
                                                  .bottomSheetBackgroundColor,
                                              size: 4,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Perdidos",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    color: AppTheme.toggleColor,
                                                    fontSize: 15),
                                              ),
                                              Spacer(),
                                              Text(
                                                "7",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 15),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            height:
                                                SizeConfig.blockSizeVertical *
                                                    1,
                                            width:
                                                SizeConfig.blockSizeVertical *
                                                    26,
                                            child: FAProgressBar(
                                              currentValue: progressvalue,
                                              progressColor:
                                                  AppTheme.borderColor,
                                              backgroundColor: AppTheme
                                                  .bottomSheetBackgroundColor,
                                              size: 4,
                                            ),
                                          ),
                                        ],
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockSizeVertical * 2,
                      ),
                      margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.blockSizeHorizontal * 3,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Theme.of(context).cardColor,
                      ),
                    ),
                    Container(
                      height: SizeConfig.blockSizeVertical * 2,
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: SizeConfig.blockSizeHorizontal * 4),
                            child: Text(
                              "ARQUEROS",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 16),
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
                            margin: EdgeInsets.symmetric(
                                horizontal: SizeConfig.blockSizeHorizontal * 4,
                                vertical: SizeConfig.blockSizeVertical * 0.5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width:
                                          SizeConfig.blockSizeHorizontal * 10,
                                      child: Image.asset(
                                        'assets/userAvatar.png',
                                        width:
                                            SizeConfig.blockSizeHorizontal * 6,
                                      ),
                                    ),
                                    Container(
                                      width: SizeConfig.blockSizeVertical * 30,
                                      margin: EdgeInsets.only(
                                          left: SizeConfig.blockSizeHorizontal *
                                              3),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Neto",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15),
                                          ),
                                          Container(
                                              child: Text(
                                                "Araxá, Brazil",
                                                style: TextStyle(
                                                  color: AppTheme.toggleColor,
                                                ),
                                              ),
                                              margin: EdgeInsets.only(
                                                  top: SizeConfig
                                                          .blockSizeVertical *
                                                      0.2))
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      child: Text(
                                        "13",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15),
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                    child: GetDivider(),
                                    margin: EdgeInsets.symmetric(
                                        vertical: SizeConfig.blockSizeVertical *
                                            0.5)),
                                Row(
                                  children: [
                                    Container(
                                      width:
                                          SizeConfig.blockSizeHorizontal * 10,
                                      child: Image.asset(
                                        'assets/playerAvatar.png',
                                        width:
                                            SizeConfig.blockSizeHorizontal * 6,
                                      ),
                                    ),
                                    Container(
                                      width: SizeConfig.blockSizeVertical * 30,
                                      margin: EdgeInsets.only(
                                          left: SizeConfig.blockSizeHorizontal *
                                              3),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Marc-André ter Stegen",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: SizeConfig
                                                        .blockSizeVertical *
                                                    0.2),
                                            child: Text(
                                              "Mönchengladbach, Germany",
                                              style: TextStyle(
                                                color: AppTheme.toggleColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      child: Text(
                                        "1",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockSizeVertical * 2,
                      ),
                      margin: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockSizeVertical * 2,
                        horizontal: SizeConfig.blockSizeHorizontal * 3,
                      ),
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
                                horizontal: SizeConfig.blockSizeHorizontal * 4),
                            child: Text(
                              "DEFENSORES",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 16),
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
                            margin: EdgeInsets.symmetric(
                                horizontal: SizeConfig.blockSizeHorizontal * 4,
                                vertical: SizeConfig.blockSizeVertical * 0.5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width:
                                          SizeConfig.blockSizeHorizontal * 10,
                                      child: Image.asset(
                                        'assets/playerAvatar.png',
                                        width:
                                            SizeConfig.blockSizeHorizontal * 6,
                                      ),
                                    ),
                                    Container(
                                      width: SizeConfig.blockSizeVertical * 30,
                                      margin: EdgeInsets.only(
                                          left: SizeConfig.blockSizeHorizontal *
                                              3),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Neto",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Container(
                                              child: Text(
                                                "Araxá, Brazil",
                                                style: TextStyle(
                                                    color: AppTheme.toggleColor,
                                                    fontSize: 15),
                                              ),
                                              margin: EdgeInsets.only(
                                                  top: SizeConfig
                                                          .blockSizeVertical *
                                                      0.2))
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      child: Text(
                                        "18",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15),
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                    child: GetDivider(),
                                    margin: EdgeInsets.symmetric(
                                        vertical: SizeConfig.blockSizeVertical *
                                            0.5)),
                                Row(
                                  children: [
                                    Container(
                                      width:
                                          SizeConfig.blockSizeHorizontal * 10,
                                      child: Image.asset(
                                        'assets/userAvatar.png',
                                        width:
                                            SizeConfig.blockSizeHorizontal * 6,
                                      ),
                                    ),
                                    Container(
                                      width: SizeConfig.blockSizeVertical * 30,
                                      margin: EdgeInsets.only(
                                          left: SizeConfig.blockSizeHorizontal *
                                              3),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Marc-André ter Stegen",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: SizeConfig
                                                        .blockSizeVertical *
                                                    0.2),
                                            child: Text(
                                              "Mönchengladbach, Germany",
                                              style: TextStyle(
                                                color: AppTheme.toggleColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      child: Text(
                                        "2",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15),
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                    child: GetDivider(),
                                    margin: EdgeInsets.symmetric(
                                        vertical: SizeConfig.blockSizeVertical *
                                            0.5)),
                                Row(
                                  children: [
                                    Container(
                                      width:
                                          SizeConfig.blockSizeHorizontal * 10,
                                      child: Image.asset(
                                        'assets/userAvatar.png',
                                        width:
                                            SizeConfig.blockSizeHorizontal * 6,
                                      ),
                                    ),
                                    Container(
                                      width: SizeConfig.blockSizeVertical * 30,
                                      margin: EdgeInsets.only(
                                          left: SizeConfig.blockSizeHorizontal *
                                              3),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Júnior Firpo",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: SizeConfig
                                                        .blockSizeVertical *
                                                    0.2),
                                            child: Text(
                                              "Santo Domingo, Dominican Republic",
                                              style: TextStyle(
                                                color: AppTheme.toggleColor,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      child: Text(
                                        "24",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockSizeVertical * 2,
                      ),
                      margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.blockSizeHorizontal * 3,
                      ),
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
                                horizontal: SizeConfig.blockSizeHorizontal * 4),
                            child: Text(
                              "MEDIOCAMPISTAS",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 16),
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
                            margin: EdgeInsets.symmetric(
                                horizontal: SizeConfig.blockSizeHorizontal * 4,
                                vertical: SizeConfig.blockSizeVertical * 0.5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width:
                                          SizeConfig.blockSizeHorizontal * 10,
                                      child: Image.asset(
                                        'assets/userAvatar.png',
                                        width:
                                            SizeConfig.blockSizeHorizontal * 6,
                                      ),
                                    ),
                                    Container(
                                      width: SizeConfig.blockSizeVertical * 30,
                                      margin: EdgeInsets.only(
                                          left: SizeConfig.blockSizeHorizontal *
                                              3),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Rafinha",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Container(
                                              child: Text(
                                                "São Paulo, Brazil",
                                                style: TextStyle(
                                                    color: AppTheme.toggleColor,
                                                    fontSize: 15),
                                              ),
                                              margin: EdgeInsets.only(
                                                  top: SizeConfig
                                                          .blockSizeVertical *
                                                      0.2))
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      child: Text(
                                        "12",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15),
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                    child: GetDivider(),
                                    margin: EdgeInsets.symmetric(
                                        vertical: SizeConfig.blockSizeVertical *
                                            0.5)),
                                Row(
                                  children: [
                                    Container(
                                      width:
                                          SizeConfig.blockSizeHorizontal * 10,
                                      child: Image.asset(
                                        'assets/userAvatar.png',
                                        width:
                                            SizeConfig.blockSizeHorizontal * 6,
                                      ),
                                    ),
                                    Container(
                                      width: SizeConfig.blockSizeVertical * 30,
                                      margin: EdgeInsets.only(
                                          left: SizeConfig.blockSizeHorizontal *
                                              3),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Carles Aleñá",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: SizeConfig
                                                        .blockSizeVertical *
                                                    0.2),
                                            child: Text(
                                              "Mataró, Spain",
                                              style: TextStyle(
                                                color: AppTheme.toggleColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      child: Text(
                                        "6",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15),
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                    child: GetDivider(),
                                    margin: EdgeInsets.symmetric(
                                        vertical: SizeConfig.blockSizeVertical *
                                            0.5)),
                                Row(
                                  children: [
                                    Container(
                                      width:
                                          SizeConfig.blockSizeHorizontal * 10,
                                      child: Image.asset(
                                        'assets/playerAvatar.png',
                                        width:
                                            SizeConfig.blockSizeHorizontal * 6,
                                      ),
                                    ),
                                    Container(
                                      width: SizeConfig.blockSizeVertical * 30,
                                      margin: EdgeInsets.only(
                                          left: SizeConfig.blockSizeHorizontal *
                                              3),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Júnior Firpo",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: SizeConfig
                                                        .blockSizeVertical *
                                                    0.2),
                                            child: Text(
                                              "Santo Domingo, Dominican Republic",
                                              style: TextStyle(
                                                color: AppTheme.toggleColor,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      child: Text(
                                        "5",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockSizeVertical * 2,
                      ),
                      margin: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockSizeVertical * 2,
                        horizontal: SizeConfig.blockSizeHorizontal * 3,
                      ),
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
                                horizontal: SizeConfig.blockSizeHorizontal * 4),
                            child: Text(
                              "DELANTORES",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 16),
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
                            margin: EdgeInsets.symmetric(
                                horizontal: SizeConfig.blockSizeHorizontal * 4,
                                vertical: SizeConfig.blockSizeVertical * 0.5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width:
                                          SizeConfig.blockSizeHorizontal * 10,
                                      child: Image.asset(
                                        'assets/userAvatar.png',
                                        width:
                                            SizeConfig.blockSizeHorizontal * 6,
                                      ),
                                    ),
                                    Container(
                                      width: SizeConfig.blockSizeVertical * 30,
                                      margin: EdgeInsets.only(
                                          left: SizeConfig.blockSizeHorizontal *
                                              3),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Antoine Griezmann",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Container(
                                              child: Text(
                                                "Mâcon, France",
                                                style: TextStyle(
                                                    color: AppTheme.toggleColor,
                                                    fontSize: 15),
                                              ),
                                              margin: EdgeInsets.only(
                                                  top: SizeConfig
                                                          .blockSizeVertical *
                                                      0.2))
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      child: Text(
                                        "7",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15),
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                    child: GetDivider(),
                                    margin: EdgeInsets.symmetric(
                                        vertical: SizeConfig.blockSizeVertical *
                                            0.5)),
                                Row(
                                  children: [
                                    Container(
                                      width:
                                          SizeConfig.blockSizeHorizontal * 10,
                                      child: Image.asset(
                                        'assets/messi.png',
                                        width:
                                            SizeConfig.blockSizeHorizontal * 6,
                                      ),
                                    ),
                                    Container(
                                      width: SizeConfig.blockSizeVertical * 30,
                                      margin: EdgeInsets.only(
                                          left: SizeConfig.blockSizeHorizontal *
                                              3),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Lionel Messi",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: SizeConfig
                                                        .blockSizeVertical *
                                                    0.2),
                                            child: Text(
                                              "Rosario, Argentina",
                                              style: TextStyle(
                                                color: AppTheme.toggleColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      child: Text(
                                        "10",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15),
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                    child: GetDivider(),
                                    margin: EdgeInsets.symmetric(
                                        vertical: SizeConfig.blockSizeVertical *
                                            0.5)),
                                Row(
                                  children: [
                                    Container(
                                      width:
                                          SizeConfig.blockSizeHorizontal * 10,
                                      child: Image.asset(
                                        'assets/playerAvatar.png',
                                        width:
                                            SizeConfig.blockSizeHorizontal * 6,
                                      ),
                                    ),
                                    Container(
                                      width: SizeConfig.blockSizeVertical * 30,
                                      margin: EdgeInsets.only(
                                          left: SizeConfig.blockSizeHorizontal *
                                              3),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Luis Suárez",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: SizeConfig
                                                        .blockSizeVertical *
                                                    0.2),
                                            child: Text(
                                              "Salto, Uruguay",
                                              style: TextStyle(
                                                color: AppTheme.toggleColor,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      child: Text(
                                        "9",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockSizeVertical * 2,
                      ),
                      margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.blockSizeHorizontal * 3,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Theme.of(context).cardColor,
                      ),
                    ),
                    Container(height: SizeConfig.blockSizeVertical * 2),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Container(
                                  child: Image.asset(
                                "assets/Barcelona.png",
                                width: SizeConfig.blockSizeVertical * 10,
                              )),
                              Container(
                                height: SizeConfig.blockSizeVertical * 1.5,
                              ),
                              Text(
                                Strings.barcelona,
                                style: boldStyles,
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Comparar",
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                              Container(
                                height: SizeConfig.blockSizeVertical * 2,
                              ),
                              Text(
                                "La Liga",
                                style: TextStyle(
                                    color: AppTheme.toggleColor,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                  child: Image.asset(
                                "assets/shield.png",
                                width: SizeConfig.blockSizeVertical * 11,
                              )),
                              Container(
                                height: SizeConfig.blockSizeVertical * 1.5,
                              ),
                              Text(
                                "Seleccionar",
                                style: boldStyles,
                              )
                            ],
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockSizeVertical * 2,
                        horizontal: SizeConfig.blockSizeVertical * 4,
                      ),
                      margin: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockSizeVertical * 2,
                        horizontal: SizeConfig.blockSizeHorizontal * 3,
                      ),
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
                                horizontal: SizeConfig.blockSizeHorizontal * 4),
                            child: Text(
                              "ULTIMOS 5 PARTIDOS",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 16),
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
                            margin: EdgeInsets.symmetric(
                              horizontal: SizeConfig.blockSizeHorizontal * 4,
                            ),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "BAR",
                                      style: boldStyles,
                                    ),
                                    Container(
                                      height:
                                          SizeConfig.blockSizeVertical * 2.5,
                                    ),
                                    Text(
                                      "RLM",
                                      style: TextStyle(
                                          color: Color(0xFF111111)
                                              .withOpacity(0.2),
                                          fontWeight: FontWeight.w700),
                                    )
                                  ],
                                ),
                                Spacer(),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          height:
                                              SizeConfig.blockSizeVertical * 4,
                                          width:
                                              SizeConfig.blockSizeVertical * 4,
                                          decoration: new BoxDecoration(
                                            color: AppTheme.yellowColor,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                              child: Text(
                                            "E",
                                            style: TextStyle(
                                                color: AppTheme.whiteColor),
                                          )),
                                        ),
                                        Container(
                                          height:
                                              SizeConfig.blockSizeVertical * 1,
                                        ),
                                        Container(
                                          height:
                                              SizeConfig.blockSizeVertical * 4,
                                          width:
                                              SizeConfig.blockSizeVertical * 4,
                                          decoration: new BoxDecoration(
                                            color: Color(0XFFF2C94C)
                                                .withOpacity(0.2),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                              child: Text(
                                            "E",
                                            style: TextStyle(
                                                color: AppTheme.whiteColor),
                                          )),
                                        )
                                      ],
                                    ),
                                    Container(
                                      width: SizeConfig.blockSizeVertical * 1,
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height:
                                              SizeConfig.blockSizeVertical * 4,
                                          width:
                                              SizeConfig.blockSizeVertical * 4,
                                          decoration: new BoxDecoration(
                                            color: AppTheme.borderColor,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                              child: Text(
                                            "P",
                                            style: TextStyle(
                                                color: AppTheme.whiteColor),
                                          )),
                                        ),
                                        Container(
                                          height:
                                              SizeConfig.blockSizeVertical * 1,
                                        ),
                                        Container(
                                          height:
                                              SizeConfig.blockSizeVertical * 4,
                                          width:
                                              SizeConfig.blockSizeVertical * 4,
                                          decoration: new BoxDecoration(
                                            color: Color(0XFFF2C94C)
                                                .withOpacity(0.2),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                              child: Text(
                                            "E",
                                            style: TextStyle(
                                                color: AppTheme.whiteColor),
                                          )),
                                        )
                                      ],
                                    ),
                                    Container(
                                      width: SizeConfig.blockSizeVertical * 1,
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height:
                                              SizeConfig.blockSizeVertical * 4,
                                          width:
                                              SizeConfig.blockSizeVertical * 4,
                                          decoration: new BoxDecoration(
                                            color: AppTheme.borderColor,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                              child: Text(
                                            "P",
                                            style: TextStyle(
                                                color: AppTheme.whiteColor),
                                          )),
                                        ),
                                        Container(
                                          height:
                                              SizeConfig.blockSizeVertical * 1,
                                        ),
                                        Container(
                                          height:
                                              SizeConfig.blockSizeVertical * 4,
                                          width:
                                              SizeConfig.blockSizeVertical * 4,
                                          decoration: new BoxDecoration(
                                            color: Color(0xFFEB5757C)
                                                .withOpacity(0.2),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                              child: Text(
                                            "P",
                                            style: TextStyle(
                                                color: AppTheme.whiteColor),
                                          )),
                                        )
                                      ],
                                    ),
                                    Container(
                                      width: SizeConfig.blockSizeVertical * 1,
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height:
                                              SizeConfig.blockSizeVertical * 4,
                                          width:
                                              SizeConfig.blockSizeVertical * 4,
                                          decoration: new BoxDecoration(
                                            color: AppTheme.greenColor,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                              child: Text(
                                            "G",
                                            style: TextStyle(
                                                color: AppTheme.whiteColor),
                                          )),
                                        ),
                                        Container(
                                          height:
                                              SizeConfig.blockSizeVertical * 1,
                                        ),
                                        Container(
                                          height:
                                              SizeConfig.blockSizeVertical * 4,
                                          width:
                                              SizeConfig.blockSizeVertical * 4,
                                          decoration: new BoxDecoration(
                                            color: Color(0xFFEB5757C)
                                                .withOpacity(0.2),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                              child: Text(
                                            "E",
                                            style: TextStyle(
                                                color: AppTheme.whiteColor),
                                          )),
                                        )
                                      ],
                                    ),
                                    Container(
                                      width: SizeConfig.blockSizeVertical * 1,
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height:
                                              SizeConfig.blockSizeVertical * 4,
                                          width:
                                              SizeConfig.blockSizeVertical * 4,
                                          decoration: new BoxDecoration(
                                            color: AppTheme.borderColor,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                              child: Text(
                                            "P",
                                            style: TextStyle(
                                                color: AppTheme.whiteColor),
                                          )),
                                        ),
                                        Container(
                                          height:
                                              SizeConfig.blockSizeVertical * 1,
                                        ),
                                        Container(
                                          height:
                                              SizeConfig.blockSizeVertical * 4,
                                          width:
                                              SizeConfig.blockSizeVertical * 4,
                                          decoration: new BoxDecoration(
                                            color: Color(0XFF27AE60)
                                                .withOpacity(0.2),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                              child: Text(
                                            "E",
                                            style: TextStyle(
                                                color: AppTheme.whiteColor),
                                          )),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  children: [
                                    Text(
                                      "5to",
                                      style: boldStyles,
                                    ),
                                    Container(
                                      height:
                                          SizeConfig.blockSizeVertical * 2.5,
                                    ),
                                    Text(
                                      "2to",
                                      style: TextStyle(
                                          color: Color(0xFF111111)
                                              .withOpacity(0.2),
                                          fontWeight: FontWeight.w700),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockSizeVertical * 2,
                      ),
                      margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.blockSizeHorizontal * 3,
                      ),
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
                                horizontal: SizeConfig.blockSizeHorizontal * 4),
                            child: Text(
                              "ESTADISTICAS",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 16),
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
                              right: SizeConfig.blockSizeHorizontal * 4,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                        child: Text(
                                      "25",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15),
                                    )),
                                    Spacer(),
                                    Container(
                                        child: Text(
                                      "Tiros a porteria",
                                      style: TextStyle(
                                          color: AppTheme.toggleColor,
                                          fontSize: 15),
                                    )),
                                    Spacer(),
                                    Container(
                                        child: Text(
                                      "10",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15),
                                    )),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical:
                                              SizeConfig.blockSizeVertical * 1),
                                      height: SizeConfig.blockSizeVertical * 1,
                                      width: SizeConfig.blockSizeVertical * 20,
                                      child: FAProgressBar(
                                        currentValue: progressvalue,
                                        progressColor: AppTheme.blueColor,
                                        backgroundColor:
                                            AppTheme.bottomSheetBackgroundColor,
                                        size: 4,
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      height: SizeConfig.blockSizeVertical * 1,
                                      width: SizeConfig.blockSizeVertical * 20,
                                      child: FAProgressBar(
                                        currentValue: progressvalue,
                                        progressColor: AppTheme.borderColor,
                                        backgroundColor:
                                            AppTheme.bottomSheetBackgroundColor,
                                        size: 4,
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                        child: Text(
                                      "3",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15),
                                    )),
                                    Spacer(),
                                    Container(
                                        child: Text(
                                      "Tiros a porteria",
                                      style: TextStyle(
                                          color: AppTheme.toggleColor,
                                          fontSize: 15),
                                    )),
                                    Spacer(),
                                    Container(
                                        child: Text(
                                      "7",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15),
                                    )),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical:
                                              SizeConfig.blockSizeVertical * 1),
                                      height: SizeConfig.blockSizeVertical * 1,
                                      width: SizeConfig.blockSizeVertical * 20,
                                      child: FAProgressBar(
                                        currentValue: progressvalue,
                                        progressColor: AppTheme.blueColor,
                                        backgroundColor:
                                            AppTheme.bottomSheetBackgroundColor,
                                        size: 4,
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      height: SizeConfig.blockSizeVertical * 1,
                                      width: SizeConfig.blockSizeVertical * 20,
                                      child: FAProgressBar(
                                        currentValue: progressvalue,
                                        progressColor: AppTheme.borderColor,
                                        backgroundColor:
                                            AppTheme.bottomSheetBackgroundColor,
                                        size: 4,
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                        child: Text(
                                      "8",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15),
                                    )),
                                    Spacer(),
                                    Container(
                                        child: Text(
                                      "Tiros a porteria",
                                      style: TextStyle(
                                          color: AppTheme.toggleColor,
                                          fontSize: 15),
                                    )),
                                    Spacer(),
                                    Container(
                                        child: Text(
                                      "2",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15),
                                    )),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical:
                                              SizeConfig.blockSizeVertical * 1),
                                      height: SizeConfig.blockSizeVertical * 1,
                                      width: SizeConfig.blockSizeVertical * 20,
                                      child: FAProgressBar(
                                        currentValue: progressvalue,
                                        progressColor: AppTheme.blueColor,
                                        backgroundColor:
                                            AppTheme.bottomSheetBackgroundColor,
                                        size: 4,
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      height: SizeConfig.blockSizeVertical * 1,
                                      width: SizeConfig.blockSizeVertical * 20,
                                      child: FAProgressBar(
                                        currentValue: progressvalue,
                                        progressColor: AppTheme.borderColor,
                                        backgroundColor:
                                            AppTheme.bottomSheetBackgroundColor,
                                        size: 4,
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                        child: Text(
                                      "8",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15),
                                    )),
                                    Spacer(),
                                    Container(
                                        child: Text(
                                      "Tiros a porteria",
                                      style: TextStyle(
                                          color: AppTheme.toggleColor,
                                          fontSize: 15),
                                    )),
                                    Spacer(),
                                    Container(
                                        child: Text(
                                      "9",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15),
                                    )),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical:
                                              SizeConfig.blockSizeVertical * 1),
                                      height: SizeConfig.blockSizeVertical * 1,
                                      width: SizeConfig.blockSizeVertical * 20,
                                      child: FAProgressBar(
                                        currentValue: progressvalue,
                                        progressColor: AppTheme.blueColor,
                                        backgroundColor:
                                            AppTheme.bottomSheetBackgroundColor,
                                        size: 4,
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      height: SizeConfig.blockSizeVertical * 1,
                                      width: SizeConfig.blockSizeVertical * 20,
                                      child: FAProgressBar(
                                        currentValue: progressvalue,
                                        progressColor: AppTheme.borderColor,
                                        backgroundColor:
                                            AppTheme.bottomSheetBackgroundColor,
                                        size: 4,
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                        child: Text(
                                      "9",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15),
                                    )),
                                    Spacer(),
                                    Container(
                                        child: Text(
                                      "Tiros a porteria",
                                      style: TextStyle(
                                          color: AppTheme.toggleColor,
                                          fontSize: 15),
                                    )),
                                    Spacer(),
                                    Container(
                                        child: Text(
                                      "100",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15),
                                    )),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical:
                                              SizeConfig.blockSizeVertical * 1),
                                      height: SizeConfig.blockSizeVertical * 1,
                                      width: SizeConfig.blockSizeVertical * 20,
                                      child: FAProgressBar(
                                        currentValue: progressvalue,
                                        progressColor: AppTheme.blueColor,
                                        backgroundColor:
                                            AppTheme.bottomSheetBackgroundColor,
                                        size: 4,
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      height: SizeConfig.blockSizeVertical * 1,
                                      width: SizeConfig.blockSizeVertical * 20,
                                      child: FAProgressBar(
                                        currentValue: progressvalue,
                                        progressColor: AppTheme.borderColor,
                                        backgroundColor:
                                            AppTheme.bottomSheetBackgroundColor,
                                        size: 4,
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                        child: Text(
                                      "3",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15),
                                    )),
                                    Spacer(),
                                    Container(
                                        child: Text(
                                      "Tiros a porteria",
                                      style: TextStyle(
                                          color: AppTheme.toggleColor,
                                          fontSize: 15),
                                    )),
                                    Spacer(),
                                    Container(
                                        child: Text(
                                      "7",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15),
                                    )),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical:
                                              SizeConfig.blockSizeVertical * 1),
                                      height: SizeConfig.blockSizeVertical * 1,
                                      width: SizeConfig.blockSizeVertical * 20,
                                      child: FAProgressBar(
                                        currentValue: progressvalue,
                                        progressColor: AppTheme.blueColor,
                                        backgroundColor:
                                            AppTheme.bottomSheetBackgroundColor,
                                        size: 4,
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      height: SizeConfig.blockSizeVertical * 1,
                                      width: SizeConfig.blockSizeVertical * 20,
                                      child: FAProgressBar(
                                        currentValue: progressvalue,
                                        progressColor: AppTheme.borderColor,
                                        backgroundColor:
                                            AppTheme.bottomSheetBackgroundColor,
                                        size: 4,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Image.asset("assets/graph.png"),
                            margin: EdgeInsets.only(
                                left: SizeConfig.blockSizeHorizontal * 3,
                                top: SizeConfig.blockSizeVertical * 4,
                                right: SizeConfig.blockSizeHorizontal * 3),
                          )
                        ],
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockSizeVertical * 2,
                      ),
                      margin: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockSizeVertical * 2,
                        horizontal: SizeConfig.blockSizeHorizontal * 3,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Theme.of(context).cardColor,
                      ),
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: SizeConfig.blockSizeVertical * 25,
                    ),
                    Container(
                      child: Text(
                        "Coming Soon \nWaiting for Figma Designs",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget classification(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
              child: Center(
                child: Text(
                  "1",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 2),
              width: SizeConfig.blockSizeHorizontal * 8),
          Container(
            width: SizeConfig.blockSizeHorizontal * 42,
            child: Row(
              children: [
                Image.asset(
                  "assets/Barcelona.png",
                  width: SizeConfig.blockSizeHorizontal * 6,
                ),
                Container(
                  margin: EdgeInsets.only(left: 5),
                  child: Text(
                    "Barcelona",
                    style: boldStyles,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: SizeConfig.blockSizeHorizontal * 8,
            child: Text(
              "6",
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: SizeConfig.blockSizeHorizontal * 8,
            child: Text(
              "32",
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: SizeConfig.blockSizeHorizontal * 8,
            child: Text(
              "18",
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: SizeConfig.blockSizeHorizontal * 8,
            child: Text(
              "14",
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: SizeConfig.blockSizeHorizontal * 8,
            child: Text(
              "32",
              style: boldStyles,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }

  void implementNotification() {
    toast(msg: Messages.underDevelopment, context: context);
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
