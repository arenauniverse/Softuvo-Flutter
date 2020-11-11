
import 'package:arena_sports_app/CommonWidgets/SizeConfig.dart';
import 'package:arena_sports_app/CommonWidgets/dividerWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../theme.dart';


class DetailH2H extends StatefulWidget {
  @override
  _DetailH2HState createState() => _DetailH2HState();
}

class _DetailH2HState extends State<DetailH2H> {
  var count = 0;
  TextStyle styles = TextStyle(fontWeight: FontWeight.w400, fontSize: 15);
  TextStyle boldStyles = TextStyle(fontWeight: FontWeight.w700, fontSize: 15);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context)
  {
    SizeConfig().init(context);
    return Container(
        color: Colors.transparent,
        child:ListView(
            children: <Widget>[
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    Container(
                      margin: EdgeInsets.only(top:SizeConfig.blockSizeVertical*0.75,
                          left: SizeConfig.blockSizeHorizontal * 3,right: SizeConfig.blockSizeHorizontal * 3),
                      child: Text(
                        "ULTIMOS 5 PARTIDOS",
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 16),
                      ),
                    ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top:SizeConfig.blockSizeVertical*0.75,
                            left: SizeConfig.blockSizeHorizontal * 3,right: SizeConfig.blockSizeHorizontal * 3),
                        child: Text(
                          "Ver todos",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: SizeConfig.blockSizeVertical*1.7,color: AppTheme.blueColor),
                        ),
                      )
                    ],),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "BAR",
                            style: boldStyles,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height:
                                SizeConfig.blockSizeVertical * 4,
                                width:
                                SizeConfig.blockSizeVertical * 4,
                                margin: EdgeInsets.only(right: SizeConfig.blockSizeHorizontal*2),
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
                                SizeConfig.blockSizeVertical * 4,
                                width:
                                SizeConfig.blockSizeVertical * 4,
                                margin: EdgeInsets.only(right: SizeConfig.blockSizeHorizontal*2),
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
                                SizeConfig.blockSizeVertical * 4,
                                width:
                                SizeConfig.blockSizeVertical * 4,
                                margin: EdgeInsets.only(right: SizeConfig.blockSizeHorizontal*2),
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
                                SizeConfig.blockSizeVertical * 4,
                                width:
                                SizeConfig.blockSizeVertical * 4,
                                margin: EdgeInsets.only(right: SizeConfig.blockSizeHorizontal*2),
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
                            ],
                          ),
                          Text(
                            "5to",
                            style: boldStyles,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal * 4,right: SizeConfig.blockSizeHorizontal * 4,top: SizeConfig.blockSizeVertical*1.5
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "BAR",
                            style: boldStyles,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height:
                                SizeConfig.blockSizeVertical * 4,
                                width:
                                SizeConfig.blockSizeVertical * 4,
                                margin: EdgeInsets.only(right: SizeConfig.blockSizeHorizontal*2),
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
                                SizeConfig.blockSizeVertical * 4,
                                width:
                                SizeConfig.blockSizeVertical * 4,
                                margin: EdgeInsets.only(right: SizeConfig.blockSizeHorizontal*2),
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
                                SizeConfig.blockSizeVertical * 4,
                                width:
                                SizeConfig.blockSizeVertical * 4,
                                margin: EdgeInsets.only(right: SizeConfig.blockSizeHorizontal*2),
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
                                SizeConfig.blockSizeVertical * 4,
                                width:
                                SizeConfig.blockSizeVertical * 4,
                                margin: EdgeInsets.only(right: SizeConfig.blockSizeHorizontal*2),
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
                            ],
                          ),
                          Text(
                            "5to",
                            style: boldStyles,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.blockSizeVertical * 1.25,
                ),
                margin: EdgeInsets.symmetric(
                    horizontal: SizeConfig.blockSizeHorizontal * 1.5,vertical: SizeConfig.blockSizeVertical*1.5
                ),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 2.0, // soften the shadow
                        spreadRadius: 1.0, //extend the shadow
                      )
                    ],
                    color: Colors.white,
                    borderRadius: new BorderRadius.all(
                      Radius.circular(12.0),
                    )),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                          margin: EdgeInsets.only(top:SizeConfig.blockSizeVertical*0.75,
                              left: SizeConfig.blockSizeHorizontal * 3,right: SizeConfig.blockSizeHorizontal * 3),
                          child: Text(
                            "HEAT TO HEAT",
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "BAR",
                            style: boldStyles,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height:
                                SizeConfig.blockSizeVertical * 4,
                                width:
                                SizeConfig.blockSizeVertical * 4,
                                margin: EdgeInsets.only(right: SizeConfig.blockSizeHorizontal*2),
                                decoration: new BoxDecoration(
                                  color: AppTheme.greyColor,
                                  shape: BoxShape.rectangle,
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
                                SizeConfig.blockSizeVertical * 4,
                                width:
                                SizeConfig.blockSizeVertical * 4,
                                margin: EdgeInsets.only(right: SizeConfig.blockSizeHorizontal*2),
                                decoration: new BoxDecoration(
                                  color: AppTheme.greyColor,
                                  shape: BoxShape.rectangle,
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
                                SizeConfig.blockSizeVertical * 4,
                                width:
                                SizeConfig.blockSizeVertical * 4,
                                margin: EdgeInsets.only(right: SizeConfig.blockSizeHorizontal*2),
                                decoration: new BoxDecoration(
                                  color: AppTheme.greyColor,
                                  shape: BoxShape.rectangle,
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
                                SizeConfig.blockSizeVertical * 4,
                                width:
                                SizeConfig.blockSizeVertical * 4,
                                margin: EdgeInsets.only(right: SizeConfig.blockSizeHorizontal*2),
                                decoration: new BoxDecoration(
                                  color: AppTheme.greyColor,
                                  shape: BoxShape.rectangle,
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
                                SizeConfig.blockSizeVertical * 4,
                                width:
                                SizeConfig.blockSizeVertical * 4,
                                decoration: new BoxDecoration(
                                  color: AppTheme.greyColor,
                                  shape: BoxShape.rectangle,
                                ),
                                child: Center(
                                    child: Text(
                                      "P",
                                      style: TextStyle(
                                          color: AppTheme.whiteColor),
                                    )),
                              ),
                            ],
                          ),
                          Text(
                            "5to",
                            style: boldStyles,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal * 4, right: SizeConfig.blockSizeHorizontal * 4,top: SizeConfig.blockSizeVertical*1.75
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "BAR",
                            style: boldStyles,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height:
                                SizeConfig.blockSizeVertical * 4,
                                width:
                                SizeConfig.blockSizeVertical * 4,
                                margin: EdgeInsets.only(right: SizeConfig.blockSizeHorizontal*2),
                                decoration: new BoxDecoration(
                                  color: AppTheme.greyColor,
                                  shape: BoxShape.rectangle,
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
                                SizeConfig.blockSizeVertical * 4,
                                width:
                                SizeConfig.blockSizeVertical * 4,
                                margin: EdgeInsets.only(right: SizeConfig.blockSizeHorizontal*2),
                                decoration: new BoxDecoration(
                                  color: AppTheme.greyColor,
                                  shape: BoxShape.rectangle,
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
                                SizeConfig.blockSizeVertical * 4,
                                width:
                                SizeConfig.blockSizeVertical * 4,
                                margin: EdgeInsets.only(right: SizeConfig.blockSizeHorizontal*2),
                                decoration: new BoxDecoration(
                                  color: AppTheme.greyColor,
                                  shape: BoxShape.rectangle,
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
                                SizeConfig.blockSizeVertical * 4,
                                width:
                                SizeConfig.blockSizeVertical * 4,
                                margin: EdgeInsets.only(right: SizeConfig.blockSizeHorizontal*2),
                                decoration: new BoxDecoration(
                                  color: AppTheme.greyColor,
                                  shape: BoxShape.rectangle,
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
                                SizeConfig.blockSizeVertical * 4,
                                width:
                                SizeConfig.blockSizeVertical * 4,
                                decoration: new BoxDecoration(
                                  color: AppTheme.greyColor,
                                  shape: BoxShape.rectangle,
                                ),
                                child: Center(
                                    child: Text(
                                      "P",
                                      style: TextStyle(
                                          color: AppTheme.whiteColor),
                                    )),
                              ),
                            ],
                          ),
                          Text(
                            "5to",
                            style: boldStyles,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.blockSizeVertical * 1.25,
                ),
                margin: EdgeInsets.symmetric(
                    horizontal: SizeConfig.blockSizeHorizontal * 1.5,vertical: SizeConfig.blockSizeVertical*1.5
                ),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 2.0, // soften the shadow
                        spreadRadius: 1.0, //extend the shadow
                      )
                    ],
                    color: Colors.white,
                    borderRadius: new BorderRadius.all(
                      Radius.circular(12.0),
                    )),
              ),

            ])
    );

  }

}
