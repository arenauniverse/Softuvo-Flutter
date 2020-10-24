import 'package:arena_sports_app/CommonWidgets/SizeConfig.dart';
import 'package:arena_sports_app/CommonWidgets/dividerWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme.dart';

class FeedHomeView extends StatefulWidget {
  @override
  _FeedHomeViewState createState() => _FeedHomeViewState();
}

class _FeedHomeViewState extends State<FeedHomeView> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.blockSizeVertical * 82,
      width: SizeConfig.blockSizeHorizontal,
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
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
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
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
                margin: EdgeInsets.only(
                  left: SizeConfig.blockSizeHorizontal * 2,
                ),
                child: Text(
                  "UEFA Champions League",
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
                              SizedBox(
                                  width: SizeConfig.blockSizeHorizontal * 2),
                              Container(
                                width: SizeConfig.blockSizeHorizontal * 30,
                                child: Text(
                                  "Barcelona",
                                  style: TextStyle(
                                      color: AppTheme.blackColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              ),
                              Spacer(),
                              Container(
                                padding: EdgeInsets.all(4.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: AppTheme.greyColor,
                                ),
                                child: Text(
                                  "2",
                                  style: TextStyle(
                                      color: AppTheme.blackColor,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              SizedBox(
                                  width: SizeConfig.blockSizeHorizontal * 2),
                              Text(
                                "62’",
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
                              SizedBox(
                                  width: SizeConfig.blockSizeHorizontal * 2),
                              Container(
                                width: SizeConfig.blockSizeHorizontal * 30,
                                child: Text(
                                  "Borussia Dortmund",
                                  style: TextStyle(
                                      color: AppTheme.blackColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              ),
                              SizedBox(
                                  width: SizeConfig.blockSizeHorizontal * 7),
                              SvgPicture.asset('assets/circleIcon.svg'),
                              SizedBox(
                                  width: SizeConfig.blockSizeHorizontal * 2),
                              SvgPicture.asset('assets/circleIcon.svg'),
                              SizedBox(
                                  width: SizeConfig.blockSizeHorizontal * 2),
                              SvgPicture.asset('assets/circleIcon.svg'),
                              SizedBox(
                                  width: SizeConfig.blockSizeHorizontal * 2),
                              SvgPicture.asset('assets/circleIcon.svg'),
                              SizedBox(
                                  width: SizeConfig.blockSizeHorizontal * 3),
                              Text(
                                "21:00",
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
                              SizedBox(
                                  width: SizeConfig.blockSizeHorizontal * 2),
                              Container(
                                width: SizeConfig.blockSizeHorizontal * 30,
                                child: Text(
                                  "Atalanta",
                                  style: TextStyle(
                                      color: AppTheme.blackColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              ),
                              SizedBox(
                                  width: SizeConfig.blockSizeHorizontal * 18),
                              Container(
                                padding: EdgeInsets.all(4.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: AppTheme.greyColor,
                                ),
                                child: Text(
                                  "2",
                                  style: TextStyle(
                                      color: AppTheme.blackColor,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              SizedBox(
                                  width: SizeConfig.blockSizeHorizontal * 2),
                              Text(
                                "Terminado",
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
          padding: EdgeInsets.only(
              left: SizeConfig.blockSizeHorizontal * 2,
              right: SizeConfig.blockSizeHorizontal * 2,
              bottom: SizeConfig.blockSizeHorizontal * 2,
              top: SizeConfig.blockSizeVertical * 2),
          margin: EdgeInsets.only(
              left: SizeConfig.blockSizeHorizontal * 3,
              right: SizeConfig.blockSizeHorizontal * 3,
              top: SizeConfig.blockSizeVertical * 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppTheme.whiteColor),
        ),
      ),
    );
  }
}
