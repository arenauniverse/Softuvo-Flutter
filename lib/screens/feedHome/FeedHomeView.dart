import 'package:arena_sports_app/CommonWidgets/SizeConfig.dart';
import 'package:arena_sports_app/CommonWidgets/Strings.dart';
import 'package:arena_sports_app/CommonWidgets/dividerWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../theme.dart';

class FeedHomeView extends StatefulWidget {
  @override
  _FeedHomeViewState createState() => _FeedHomeViewState();
}

class _FeedHomeViewState extends State<FeedHomeView> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                  left: SizeConfig.blockSizeHorizontal * 2,
                  right: SizeConfig.blockSizeHorizontal * 2),
              child: Text(
                Strings.liveMatches,
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
              ),
            ),
            Container(
                child: GetDivider(),
                margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.blockSizeHorizontal * 1,
                  vertical: SizeConfig.blockSizeVertical * 0.5,
                )),
            Container(
              margin: EdgeInsets.only(
                  left: SizeConfig.blockSizeHorizontal * 2,
                  top: SizeConfig.blockSizeVertical * 1),
              child: Text(
                Strings.UEFA_Champions_League,
                style: TextStyle(fontSize: 16, color: AppTheme.greyColor),
              ),
            ),
            ListView.builder(
                physics: ClampingScrollPhysics(),
                itemCount: 4,
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
                              width: 20,
                            ),
                            SizedBox(width: SizeConfig.blockSizeHorizontal * 2),
                            Container(
                              width: SizeConfig.blockSizeHorizontal * 30,
                              child: Text(
                                Strings.barcelona,
                                style: TextStyle(
                                    color: AppTheme.blackColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                            ),
                            Spacer(),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 6.0, vertical: 3.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: AppTheme.greyColor,
                              ),
                              child: Text(
                                Strings.scores,
                                style: TextStyle(
                                    color: AppTheme.blackColor,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(width: SizeConfig.blockSizeHorizontal * 2),
                            Text(
                              Strings.numbers,
                              style: TextStyle(color: AppTheme.borderColor),
                            ),
                            Spacer(),
                            SvgPicture.asset('assets/notification.svg'),
                          ],
                        ),
                        margin: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 2,
                            right: SizeConfig.blockSizeHorizontal * 2),
                      ),
                      Container(
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/Borusia Dourmunt.svg'),
                            SizedBox(width: SizeConfig.blockSizeHorizontal * 2),
                            Container(
                              width: SizeConfig.blockSizeHorizontal * 30,
                              child: Text(
                                Strings.Borussia_Dortmund,
                                style: TextStyle(
                                    color: AppTheme.blackColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                            ),
                            SizedBox(width: SizeConfig.blockSizeHorizontal * 7),
                            SvgPicture.asset('assets/circleIcon.svg'),
                            SizedBox(width: SizeConfig.blockSizeHorizontal * 2),
                            SvgPicture.asset('assets/circleIcon.svg'),
                            SizedBox(width: SizeConfig.blockSizeHorizontal * 2),
                            SvgPicture.asset('assets/circleIcon.svg'),
                            SizedBox(width: SizeConfig.blockSizeHorizontal * 2),
                            SvgPicture.asset('assets/circleIcon.svg'),
                            SizedBox(width: SizeConfig.blockSizeHorizontal * 3),
                            Text(
                              Strings.time,
                              style: TextStyle(
                                  color: AppTheme.blackColor,
                                  fontWeight: FontWeight.w600),
                            ),
                            Spacer(),
                            SvgPicture.asset('assets/notification.svg'),
                          ],
                        ),
                        margin: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 2,
                            right: SizeConfig.blockSizeHorizontal * 2),
                      ),
                      Container(
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/Atalanta.svg'),
                            SizedBox(width: SizeConfig.blockSizeHorizontal * 2),
                            Container(
                              width: SizeConfig.blockSizeHorizontal * 30,
                              child: Text(
                                Strings.Atalanta,
                                style: TextStyle(
                                    color: AppTheme.blackColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                            ),
                            SizedBox(
                                width: SizeConfig.blockSizeHorizontal * 18),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 6.0, vertical: 3.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: AppTheme.greyColor,
                              ),
                              child: Text(
                                Strings.scores,
                                style: TextStyle(
                                    color: AppTheme.blackColor,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(width: SizeConfig.blockSizeHorizontal * 2),
                            Text(
                              Strings.Finished,
                              style: TextStyle(
                                color: AppTheme.greenColor,
                              ),
                            ),
                          ],
                        ),
                        margin: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 2,
                            right: SizeConfig.blockSizeHorizontal * 2),
                      )
                    ],
                  );
                }),
          ],
        ),
        padding: EdgeInsets.symmetric(
            vertical: SizeConfig.blockSizeVertical * 2,
            horizontal: SizeConfig.blockSizeVertical * 1),
        margin: EdgeInsets.symmetric(
          vertical: SizeConfig.blockSizeVertical * 2,
          horizontal: SizeConfig.blockSizeHorizontal * 3,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppTheme.whiteColor),
      ),
    );
  }
}
