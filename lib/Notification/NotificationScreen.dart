import 'package:arena_sports_app/CommonWidgets/ChannelWidget.dart';
import 'package:arena_sports_app/CommonWidgets/Messages.dart';
import 'package:arena_sports_app/CommonWidgets/SlideRightRoute.dart';
import 'package:arena_sports_app/CommonWidgets/Strings.dart';
import 'package:arena_sports_app/CommonWidgets/buttons.dart';
import 'package:arena_sports_app/CommonWidgets/cammonMethods.dart';
import 'package:arena_sports_app/CommonWidgets/dividerWidget.dart';
import 'package:arena_sports_app/News/NewsDetails_View.dart';
import 'package:arena_sports_app/News/NewsView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../SizeConfig.dart';
import '../theme.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 5,
        child: NestedScrollView(
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
                          Tab(text: "Multimedia"),
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
                      width: SizeConfig.blockSizeVertical * 3,
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
                    child: Image.asset('assets/upload_icon.png'),
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
                                                    Container(
                                                        padding:
                                                            EdgeInsets.all(3),
                                                        child: Image.asset(
                                                          "assets/esFlag.png",
                                                          width: SizeConfig
                                                                  .blockSizeVertical *
                                                              2.5,
                                                        )),
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
                              height: 30,
                              width: 90,
                              margin: EdgeInsets.all(17),
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  color: Colors.black87,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: Row(
                                children: [
                                  Container(
                                      padding: EdgeInsets.all(3),
                                      child: Image.asset(
                                        'assets/arena_logo_small.png',
                                      )),
                                  Container(
                                    padding: EdgeInsets.all(3),
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
                                SizedBox(
                                    height: SizeConfig.blockSizeVertical * 2),
                              ]),
                            ),
                          ),
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
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 2,),
                      margin: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeVertical * 1.5, vertical: SizeConfig.blockSizeVertical * 1.5),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Theme.of(context).cardColor,),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                right: SizeConfig.blockSizeHorizontal * 4,
                                left: SizeConfig.blockSizeHorizontal * 4),
                            child: Row(
                              children: [
                                SvgPicture.asset('assets/Borusia Dourmunt.svg', width: SizeConfig.blockSizeHorizontal * 6,),
                                SizedBox(width: SizeConfig.blockSizeHorizontal * 2),
                                Container(child: Text(Strings.Borussia_Dortmund, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),),
                                Spacer(),
                                dropdownIcon(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 2,),
                      margin: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeVertical * 1.5, vertical: SizeConfig.blockSizeVertical * 1.5),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Theme.of(context).cardColor,),
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
                                  vertical: SizeConfig.blockSizeVertical *
                                      0.5)),
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
                                        right: SizeConfig
                                            .blockSizeHorizontal *
                                            4.7,
                                        left: SizeConfig
                                            .blockSizeHorizontal *
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
                                        right: SizeConfig
                                            .blockSizeHorizontal *
                                            5,
                                        left: SizeConfig
                                            .blockSizeHorizontal *
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
                    ),
                    ],
                ),
              ),
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
                                SizedBox(
                                    height: SizeConfig.blockSizeVertical * 2),
                              ]),
                            ),
                          ),
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
                  ],
                ),
              ),
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
                                SizedBox(
                                    height: SizeConfig.blockSizeVertical * 2),
                              ]),
                            ),
                          ),
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
                  ],
                ),
              ),
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
                                SizedBox(
                                    height: SizeConfig.blockSizeVertical * 2),
                              ]),
                            ),
                          ),
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
                  ],
                ),
              ),
            ],
          ),
        ),
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
