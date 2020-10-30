
import 'package:arena_sports_app/CommonWidgets/ChannelWidget.dart';
import 'package:arena_sports_app/CommonWidgets/Messages.dart';
import 'package:arena_sports_app/CommonWidgets/Strings.dart';
import 'package:arena_sports_app/CommonWidgets/cammonMethods.dart';
import 'package:arena_sports_app/CommonWidgets/dividerWidget.dart';
import 'package:arena_sports_app/feedHome/VideoPlayerView.dart';
import 'package:flutter/material.dart';
import 'package:arena_sports_app/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../SizeConfig.dart';
import 'NewsDetails_View.dart';

class NewsView extends StatefulWidget {
  @override
  _NewsViewState createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(
          "Noticias",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              toast(msg: Messages.underDevelopment, context: context);
            },
            child: Container(
              padding: EdgeInsets.only(
                  top: SizeConfig.blockSizeVertical * 3,
                  right: SizeConfig.blockSizeHorizontal * 3),
              child: Text("Filtrar",
                  style: TextStyle(
                      fontSize: 13,
                      color: AppTheme.blueColor,
                      fontWeight: FontWeight.w600)),
            ),
          )
        ],
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
// Get.back();
          },
          child: Container(
              padding: EdgeInsets.all(2),
              child: Icon(
                Icons.arrow_back_ios,
                size: 30.0,
              )),
        ),
        centerTitle: true,
      ),
        body:SingleChildScrollView(
    child:(
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
                                        onTap:(){
                                          Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) =>VideoPlayerView(videoUrl:"http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4")));

                                        },
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
              margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 1.5,left: SizeConfig.blockSizeVertical * 1.5, right: SizeConfig.blockSizeVertical *1.5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).cardColor,
              ),
            ))));
  }

}


