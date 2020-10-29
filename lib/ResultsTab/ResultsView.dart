import 'package:arena_sports_app/CommonWidgets/Strings.dart';
import 'package:arena_sports_app/CommonWidgets/buttons.dart';
import 'package:arena_sports_app/CommonWidgets/dividerWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../SizeConfig.dart';
import '../theme.dart';

class ResultsView extends StatefulWidget {
  @override
  _ResultsViewState createState() => _ResultsViewState();
}

class _ResultsViewState extends State<ResultsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          backgroundColor: Theme.of(context).cardColor,
          pinned: true,
          floating: true,
          centerTitle: true,
          title: Text(
            Strings.Results,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          actions: [
            Container(
                child: SvgPicture.asset(
                  "assets/calender.svg",
                  height: SizeConfig.blockSizeVertical * 4.5,
                ),
                margin:
                    EdgeInsets.only(right: SizeConfig.blockSizeHorizontal * 4))
          ],
        ),
        SliverList(
            delegate: SliverChildListDelegate(
          <Widget>[
            Container(
              color: Theme.of(context).cardColor,
              height: SizeConfig.blockSizeVertical * 8,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(
                          left: SizeConfig.blockSizeHorizontal * 3,
                        ),
                        height: SizeConfig.blockSizeVertical * 4.5,
                        width: SizeConfig.blockSizeVertical * 12,
                        decoration: BoxDecoration(
                            color: AppTheme.blueColor,
                            borderRadius: BorderRadius.circular(8.0)),
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.blockSizeHorizontal * 4,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/todosIcon.svg',
                                height: SizeConfig.blockSizeVertical * 2.5),
                            Spacer(),
                            Text(
                              Strings.everybody,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: AppTheme.whiteColor),
                            )
                          ],
                        )),
                    Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.blockSizeHorizontal * 3.5,
                        ),
                        margin: EdgeInsets.symmetric(
                          horizontal: SizeConfig.blockSizeHorizontal * 1,
                        ),
                        height: SizeConfig.blockSizeVertical * 4.5,
                        width: SizeConfig.blockSizeVertical * 12,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: AppTheme.blueColor,
                              width: 1.3,
                            )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/football.svg',
                                height: SizeConfig.blockSizeVertical * 2.5),
                            Spacer(),
                            Text(Strings.football,
                                style: TextStyle(
                                  color: AppTheme.blueColor,
                                  fontWeight: FontWeight.w500,
                                ))
                          ],
                        )),
                    Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.blockSizeHorizontal * 3.5,
                        ),
                        height: SizeConfig.blockSizeVertical * 4.5,
                        width: SizeConfig.blockSizeVertical * 12,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: AppTheme.blueColor,
                              width: 1.3,
                            )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/tennis.svg',
                                height: SizeConfig.blockSizeVertical * 2.5),
                            Spacer(),
                            Text(Strings.Tennis,
                                style: TextStyle(
                                  color: AppTheme.blueColor,
                                  fontWeight: FontWeight.w500,
                                ))
                          ],
                        )),
                    Container(
                        margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 1,
                            right: SizeConfig.blockSizeHorizontal * 3),
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.blockSizeHorizontal * 2,
                        ),
                        height: SizeConfig.blockSizeVertical * 4.5,
                        width: SizeConfig.blockSizeVertical * 12,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: AppTheme.blueColor,
                              width: 1.3,
                            )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/basquet.svg',
                                height: SizeConfig.blockSizeVertical * 2.5),
                            Spacer(),
                            Text(Strings.Basketball,
                                style: TextStyle(
                                  color: AppTheme.blueColor,
                                  fontWeight: FontWeight.w500,
                                ))
                          ],
                        ))
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal * 8,
                        right: SizeConfig.blockSizeHorizontal * 8,
                        top: SizeConfig.blockSizeVertical * 2),
                    child: Row(
                      children: [
                        Container(
                          child: Text(
                            Strings.enVivo,
                            style: TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 16),
                          ),
                        ),
                        Spacer(),
                        Container(
                          child: Text(
                            Strings.see_all,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: AppTheme.blueColor),
                          ),
                        )
                      ],
                    )),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: SizeConfig.blockSizeHorizontal * 4),
                        child: Text(
                          Strings.Today,
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 16),
                        ),
                      ),
                      Container(
                          child: GetDivider(),
                          margin: EdgeInsets.symmetric(
                              horizontal: SizeConfig.blockSizeHorizontal * 4,
                              vertical: SizeConfig.blockSizeVertical * 0.5)),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: SizeConfig.blockSizeHorizontal * 1,
                                      height: SizeConfig.blockSizeVertical * 7,

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
                                                SvgPicture.asset(
                                                  'assets/Barcelona.svg',
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
                                                    Strings.barcelona,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 14),
                                                  ),
                                                ),
                                                SizedBox(
                                                    width: SizeConfig
                                                            .blockSizeHorizontal *
                                                        23.5),
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
                                                SizedBox(
                                                    width: SizeConfig
                                                            .blockSizeHorizontal *
                                                        3),
                                                Text(
                                                  Strings.numbers,
                                                  style: TextStyle(
                                                      color:
                                                          AppTheme.borderColor),
                                                ),
                                                Spacer(),
                                                notificationBell(),
                                              ],
                                            ),
                                            margin: EdgeInsets.only(
                                              right: SizeConfig
                                                      .blockSizeHorizontal *
                                                  3.5,
                                              left: SizeConfig
                                                      .blockSizeHorizontal *
                                                  4,
                                              bottom:
                                                  SizeConfig.blockSizeVertical *
                                                      1,
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/Bayern_Munich.svg',
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
                                                    Strings.Bayern_Munich,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 14),
                                                  ),
                                                ),
                                                SizedBox(
                                                    width: SizeConfig
                                                            .blockSizeHorizontal *
                                                        14.5),
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
                                                    Strings.sixscores,
                                                    style: TextStyle(
                                                        color:
                                                            AppTheme.blackColor,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                                SizedBox(
                                                    width: SizeConfig
                                                            .blockSizeHorizontal *
                                                        3),
                                                Text(
                                                  Strings.Direct_TV,
                                                  style: TextStyle(
                                                      color: AppTheme.lightgrey,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                Spacer(),
                                                directLinkBell(),
                                              ],
                                            ),
                                            margin: EdgeInsets.only(
                                              right: SizeConfig
                                                      .blockSizeHorizontal *
                                                  4,
                                              left: SizeConfig
                                                      .blockSizeHorizontal *
                                                  4,
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
                                            SizeConfig.blockSizeHorizontal * 4,
                                        vertical:
                                            SizeConfig.blockSizeHorizontal *
                                                1)),
                                Container(
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/Atalanta.svg',
                                        width:
                                            SizeConfig.blockSizeHorizontal * 6,
                                      ),
                                      SizedBox(
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  2),
                                      Container(
                                        child: Text(
                                          Strings.Atalanta,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                      ),
                                      SizedBox(
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  27),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 6.0, vertical: 3.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          color: AppTheme.greyColor,
                                        ),
                                        child: Text(
                                          "1",
                                          style: TextStyle(
                                              color: AppTheme.blackColor,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      SizedBox(
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  3),
                                      Text(
                                        Strings.Finished,
                                        style: TextStyle(
                                            color: AppTheme.greenColor),
                                      ),
                                    ],
                                  ),
                                  margin: EdgeInsets.only(
                                    right: SizeConfig.blockSizeHorizontal * 3.5,
                                    left: SizeConfig.blockSizeHorizontal * 4,
                                    bottom: SizeConfig.blockSizeVertical * 1,
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/paris.svg',
                                        width:
                                            SizeConfig.blockSizeHorizontal * 6,
                                      ),
                                      SizedBox(
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  2),
                                      Container(
                                        child: Text(
                                          Strings.Atalanta,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                      ),
                                      SizedBox(
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  27),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 6.0, vertical: 3.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          color: AppTheme.greyColor,
                                        ),
                                        child: Text(
                                          Strings.scores,
                                          style: TextStyle(
                                              color: AppTheme.blackColor,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      SizedBox(
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  3),
                                      Text(
                                        Strings.Espn,
                                        style: TextStyle(
                                            color: AppTheme.lightgrey),
                                      ),
                                    ],
                                  ),
                                  margin: EdgeInsets.only(
                                    right: SizeConfig.blockSizeHorizontal * 3.5,
                                    left: SizeConfig.blockSizeHorizontal * 4,
                                  ),
                                ),
                                Container(
                                    child: GetDivider(),
                                    margin: EdgeInsets.symmetric(
                                        horizontal:
                                            SizeConfig.blockSizeHorizontal * 4,
                                        vertical:
                                            SizeConfig.blockSizeHorizontal *
                                                1)),
                                Container(
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/Manchester.svg',
                                        width:
                                            SizeConfig.blockSizeHorizontal * 6,
                                      ),
                                      SizedBox(
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  2),
                                      Container(
                                        child: Text(
                                          Strings.manshester,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                      ),
                                      SizedBox(
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  25),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 6.0, vertical: 3.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          color: AppTheme.greyColor,
                                        ),
                                        child: Text(
                                          "1",
                                          style: TextStyle(
                                              color: AppTheme.blackColor,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      SizedBox(
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  3),
                                      Text(
                                        Strings.Finished,
                                        style: TextStyle(
                                            color: AppTheme.greenColor),
                                      ),
                                    ],
                                  ),
                                  margin: EdgeInsets.only(
                                    right: SizeConfig.blockSizeHorizontal * 3.5,
                                    left: SizeConfig.blockSizeHorizontal * 4,
                                    bottom: SizeConfig.blockSizeVertical * 1,
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/Lyon.svg',
                                        width:
                                            SizeConfig.blockSizeHorizontal * 6,
                                      ),
                                      SizedBox(
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  2),
                                      Container(
                                        child: Text(
                                          Strings.Lyon,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                      ),
                                      SizedBox(
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  33),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 6.0, vertical: 3.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          color: AppTheme.greyColor,
                                        ),
                                        child: Text(
                                          "1",
                                          style: TextStyle(
                                              color: AppTheme.blackColor,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      SizedBox(
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  3),
                                      Text(
                                        Strings.Finished,
                                        style: TextStyle(
                                            color: AppTheme.greenColor),
                                      ),
                                    ],
                                  ),
                                  margin: EdgeInsets.only(
                                    right: SizeConfig.blockSizeHorizontal * 3.5,
                                    left: SizeConfig.blockSizeHorizontal * 4,
                                    bottom: SizeConfig.blockSizeVertical * 1,
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
                      top: SizeConfig.blockSizeVertical * 1.5,
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
                        child: Text(
                          Strings.matchDate,
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 16),
                        ),
                      ),
                      Container(
                          child: GetDivider(),
                          margin: EdgeInsets.symmetric(
                              horizontal: SizeConfig.blockSizeHorizontal * 4,
                              vertical: SizeConfig.blockSizeHorizontal * 1)),
                      Container(
                        margin: EdgeInsets.only(
                          left: SizeConfig.blockSizeHorizontal * 4,
                        ),
                        child: Text(
                          Strings.spanishLeague,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/Barcelona.svg',
                                        width:
                                            SizeConfig.blockSizeHorizontal * 6,
                                      ),
                                      SizedBox(
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  2),
                                      Container(
                                        child: Text(
                                          Strings.barcelona,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                      ),
                                      SizedBox(
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  16),
                                      SvgPicture.asset('assets/circleIcon.svg'),
                                      SizedBox(
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  2),
                                      SvgPicture.asset('assets/circleIcon.svg'),
                                      SizedBox(
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  2),
                                      SvgPicture.asset('assets/circleIcon.svg'),
                                      SizedBox(
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  2),
                                      SvgPicture.asset('assets/circleIcon.svg'),
                                      SizedBox(
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  3),
                                      Text(
                                        Strings.time,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Spacer(),
                                      notificationBell(),
                                    ],
                                  ),
                                  margin: EdgeInsets.only(
                                    right: SizeConfig.blockSizeHorizontal * 3.5,
                                    left: SizeConfig.blockSizeHorizontal * 4,
                                    bottom: SizeConfig.blockSizeVertical * 1,
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/realMardrid.svg',
                                        width: SizeConfig.blockSizeHorizontal *
                                            6.5,
                                      ),
                                      SizedBox(
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  2),
                                      Container(
                                        child: Text(
                                          Strings.realMadrid,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                      ),
                                      SizedBox(
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  12),
                                      SvgPicture.asset('assets/circleIcon.svg'),
                                      SizedBox(
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  2),
                                      SvgPicture.asset('assets/circleIcon.svg'),
                                      SizedBox(
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  2),
                                      SvgPicture.asset('assets/circleIcon.svg'),
                                      SizedBox(
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  2),
                                      SvgPicture.asset('assets/circleIcon.svg'),
                                      SizedBox(
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  3),
                                      Text(
                                        Strings.Direct_TV,
                                        style: TextStyle(
                                            color: AppTheme.lightgrey,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Spacer(),
                                      directLinkBell()
                                    ],
                                  ),
                                  margin: EdgeInsets.only(
                                    right: SizeConfig.blockSizeHorizontal * 4,
                                    left: SizeConfig.blockSizeHorizontal * 4,
                                  ),
                                ),
                                Container(
                                    child: GetDivider(),
                                    margin: EdgeInsets.symmetric(
                                        horizontal:
                                            SizeConfig.blockSizeHorizontal * 4,
                                        vertical:
                                            SizeConfig.blockSizeHorizontal *
                                                1)),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: SizeConfig.blockSizeHorizontal * 4,
                                      bottom:
                                          SizeConfig.blockSizeHorizontal * 3),
                                  child: Text(
                                    Strings.US_OPEN,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: AppTheme.greyColor,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/Player.png',
                                        width:
                                            SizeConfig.blockSizeHorizontal * 6,
                                      ),
                                      SizedBox(
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  2),
                                      Container(
                                        child: Text(
                                          "D. Medvedev",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                      ),
                                      SizedBox(
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  26),
                                      Text(
                                        Strings.time,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Spacer(),
                                      notificationBell(),
                                    ],
                                  ),
                                  margin: EdgeInsets.only(
                                    right: SizeConfig.blockSizeHorizontal * 3.5,
                                    left: SizeConfig.blockSizeHorizontal * 4,
                                    bottom: SizeConfig.blockSizeVertical * 1,
                                  ),
                                ),

                                Container(
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/Player.png',
                                        width:
                                            SizeConfig.blockSizeHorizontal * 6,
                                      ),
                                      SizedBox(
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  2),
                                      Container(
                                        child: Text(
                                          "F. Tiafoe",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                      ),
                                      SizedBox(
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  33),
                                      Text(
                                        Strings.Espn,
                                        style: TextStyle(
                                            color: AppTheme.lightgrey),
                                      ),
                                      Spacer(),
                                      directLinkBell(),
                                    ],
                                  ),
                                  margin: EdgeInsets.only(
                                    right: SizeConfig.blockSizeHorizontal * 3.6,
                                    left: SizeConfig.blockSizeHorizontal * 4,
                                  ),
                                ),
                                Container(
                                    child: GetDivider(),
                                    margin: EdgeInsets.symmetric(
                                        horizontal:
                                            SizeConfig.blockSizeHorizontal * 4,
                                        vertical:
                                            SizeConfig.blockSizeHorizontal *
                                                1)),
                                Row(
                                  children: [
                                    Container(
                                      width: SizeConfig.blockSizeHorizontal * 1,
                                      height: SizeConfig.blockSizeVertical * 7,
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
                                                Image.asset(
                                                  'assets/Player.png',
                                                  width:
                                                  SizeConfig.blockSizeHorizontal * 6,
                                                ),
                                                SizedBox(
                                                    width:
                                                    SizeConfig.blockSizeHorizontal *
                                                        2),
                                                Container(
                                                  child: Text(
                                                    "D. Thiem",
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 14),
                                                  ),
                                                ),
                                                SizedBox(
                                                    width:
                                                    SizeConfig.blockSizeHorizontal *
                                                        13),
                                                SvgPicture.asset('assets/circleIcon.svg'),
                                                SizedBox(
                                                    width:
                                                    SizeConfig.blockSizeHorizontal *
                                                        4),
                                                Text(
                                                  Strings.scores,
                                                  style: TextStyle(
                                                      color: AppTheme.blackColor,
                                                      fontWeight: FontWeight.w600),
                                                ),
                                                SizedBox(
                                                    width:
                                                    SizeConfig.blockSizeHorizontal *
                                                        3),
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 6.0, vertical: 3.0),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(4),
                                                    color: AppTheme.greyColor,
                                                  ),
                                                  child: Text(
                                                    Strings.scores,
                                                    style: TextStyle(
                                                        color: AppTheme.blackColor,
                                                        fontWeight: FontWeight.w600),
                                                  ),
                                                ),
                                                SizedBox(
                                                    width:
                                                    SizeConfig.blockSizeHorizontal *
                                                        3),
                                                Text(
                                                  Strings.numbers,
                                                  style: TextStyle(
                                                      color: AppTheme.borderColor,
                                                      fontWeight: FontWeight.w600),
                                                ),
                                                Spacer(),
                                                notificationBell(),
                                              ],
                                            ),
                                            margin: EdgeInsets.only(
                                              right: SizeConfig.blockSizeHorizontal * 3.5,
                                              left: SizeConfig.blockSizeHorizontal * 4,
                                              bottom: SizeConfig.blockSizeVertical * 1,
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  'assets/Player.png',
                                                  width:
                                                  SizeConfig.blockSizeHorizontal * 6,
                                                ),
                                                SizedBox(
                                                    width:
                                                    SizeConfig.blockSizeHorizontal *
                                                        2),
                                                Container(
                                                  child: Text(
                                                    "D. Medvedev",
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 14),
                                                  ),
                                                ),
                                                SizedBox(
                                                    width:
                                                    SizeConfig.blockSizeHorizontal *
                                                        12),
                                                Text(
                                                  Strings.sixscores,
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w600),
                                                ),
                                                SizedBox(
                                                    width:
                                                    SizeConfig.blockSizeHorizontal *
                                                        3),
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 6.0, vertical: 3.0),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(4),
                                                    color: AppTheme.greyColor,
                                                  ),
                                                  child: Text(
                                                    Strings.scores,
                                                    style: TextStyle(
                                                        color: AppTheme.blackColor,
                                                        fontWeight: FontWeight.w600),
                                                  ),
                                                ),
                                                SizedBox(
                                                    width:
                                                    SizeConfig.blockSizeHorizontal *
                                                        3),
                                                Text(
                                                  Strings.Espn,
                                                  style: TextStyle(
                                                      color: AppTheme.lightgrey),
                                                ),
                                                Spacer(),
                                                directLinkBell(),
                                              ],
                                            ),
                                            margin: EdgeInsets.only(
                                              right: SizeConfig.blockSizeHorizontal * 3.5,
                                              left: SizeConfig.blockSizeHorizontal * 4,
                                              bottom: SizeConfig.blockSizeVertical * 1,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                    child: GetDivider(),
                                    margin: EdgeInsets.symmetric(
                                        horizontal:
                                            SizeConfig.blockSizeHorizontal * 4,
                                        vertical:
                                            SizeConfig.blockSizeHorizontal *
                                                1)),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: SizeConfig.blockSizeHorizontal * 4,
                                      bottom:
                                          SizeConfig.blockSizeHorizontal * 3),
                                  child: Text(
                                    Strings.NBA_Playoff,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: AppTheme.greyColor,
                                    ),
                                  ),
                                ),
                                Row(
                                   children: [
                                     Container(
                                       width: SizeConfig.blockSizeHorizontal * 1,
                                       height: SizeConfig.blockSizeVertical * 7,

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
                                                  SvgPicture.asset(
                                                    'assets/Manchester.svg',
                                                    width:
                                                    SizeConfig.blockSizeHorizontal * 6,
                                                  ),
                                                  SizedBox(
                                                      width:
                                                      SizeConfig.blockSizeHorizontal *
                                                          2),
                                                  Container(
                                                    child: Text(
                                                      "Toronto Raptors",
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 14),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      width:
                                                      SizeConfig.blockSizeHorizontal *
                                                          11),
                                                  Container(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: 6.0, vertical: 3.0),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(4),
                                                      color: AppTheme.greyColor,
                                                    ),
                                                    child: Text(
                                                      Strings.scores,
                                                      style: TextStyle(
                                                          color: AppTheme.blackColor,
                                                          fontWeight: FontWeight.w600),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      width:
                                                      SizeConfig.blockSizeHorizontal *
                                                          3),
                                                  Text(
                                                    "03’ 1 PT",
                                                    style: TextStyle(
                                                        color: AppTheme.borderColor,
                                                        fontWeight: FontWeight.w600),
                                                  ),
                                                  Spacer(),
                                                  notificationBell(),
                                                ],
                                              ),
                                              margin: EdgeInsets.only(
                                                right: SizeConfig.blockSizeHorizontal * 3.5,
                                                left: SizeConfig.blockSizeHorizontal * 4,
                                                bottom: SizeConfig.blockSizeVertical * 1,
                                              ),
                                            ),
                                            Container(
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/Manchester.svg',
                                                    width:
                                                    SizeConfig.blockSizeHorizontal * 6,
                                                  ),
                                                  SizedBox(
                                                      width:
                                                      SizeConfig.blockSizeHorizontal *
                                                          2),
                                                  Container(
                                                    child: Text(
                                                      "Boston Celtics",
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 14),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      width:
                                                      SizeConfig.blockSizeHorizontal *
                                                          13),
                                                  Container(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: 6.0, vertical: 3.0),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(4),
                                                      color: AppTheme.greyColor,
                                                    ),
                                                    child: Text(
                                                      Strings.scores,
                                                      style: TextStyle(
                                                          color: AppTheme.blackColor,
                                                          fontWeight: FontWeight.w600),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      width:
                                                      SizeConfig.blockSizeHorizontal *
                                                          3),
                                                  Text(
                                                    Strings.Espn,
                                                    style: TextStyle(
                                                        color: AppTheme.lightgrey),
                                                  ),
                                                  Spacer(),
                                                  directLinkBell(),
                                                ],
                                              ),
                                              margin: EdgeInsets.only(
                                                right: SizeConfig.blockSizeHorizontal * 3.5,
                                                left: SizeConfig.blockSizeHorizontal * 4,
                                                bottom: SizeConfig.blockSizeVertical * 1,
                                              ),
                                            )
                                          ],
                                       ),
                                     )
                                   ],
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
                      top: SizeConfig.blockSizeVertical * 1.5,
                      right: SizeConfig.blockSizeHorizontal * 3,
                      left: SizeConfig.blockSizeHorizontal * 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Theme.of(context).cardColor,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 3,
                )
              ],
            )
          ],
        )),
      ]),
    );
  }
}
