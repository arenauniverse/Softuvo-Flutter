
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

                ],
              ),
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.blockSizeVertical * 2,
              ),
              margin: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeVertical * 1.5,vertical: SizeConfig.blockSizeVertical * 1.5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).cardColor,
              ),
            ))));
  }

}


