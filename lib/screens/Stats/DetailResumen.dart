
import 'package:arena_sports_app/CommonWidgets/SizeConfig.dart';
import 'package:arena_sports_app/CommonWidgets/dividerWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../theme.dart';


class DetailResumen extends StatefulWidget {
  @override
  _DetailResumenState createState() => _DetailResumenState();
}

class _DetailResumenState extends State<DetailResumen> {
  var count = 0;
  TextStyle styles = TextStyle(fontWeight: FontWeight.w400, fontSize: SizeConfig.blockSizeVertical*1.7);
  TextStyle boldStyles = TextStyle(fontWeight: FontWeight.w700, fontSize: SizeConfig.blockSizeVertical*1.7);
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
                    )
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "CLASSIFICATION",
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: SizeConfig.blockSizeVertical*1.95),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        child: GetDivider(),
                        margin: EdgeInsets.symmetric(
                            horizontal:
                            SizeConfig.blockSizeHorizontal * 3,
                            vertical: SizeConfig.blockSizeVertical * 1)),
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                                child: Center(
                                  child: Text(
                                    "N",textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: SizeConfig.blockSizeVertical*1.65,fontWeight: FontWeight.w400),
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
                                "EQUIPO",textAlign: TextAlign.start,
                                style:  TextStyle(fontWeight: FontWeight.w500, fontSize: SizeConfig.blockSizeVertical*1.7)
                              ),
                            ),
                            Container(
                              width: SizeConfig.blockSizeHorizontal * 8,
                              child: Text(
                                "PJ",
                                style:  TextStyle(fontWeight: FontWeight.w400, fontSize: SizeConfig.blockSizeVertical*1.7),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              width: SizeConfig.blockSizeHorizontal * 8,
                              child: Text(
                                "PG",
                                style:  TextStyle(fontWeight: FontWeight.w400, fontSize: SizeConfig.blockSizeVertical*1.7),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              width: SizeConfig.blockSizeHorizontal * 8,
                              child: Text(
                                "PP",
                                style:  TextStyle(fontWeight: FontWeight.w400, fontSize: SizeConfig.blockSizeVertical*1.7),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              width: SizeConfig.blockSizeHorizontal * 8,
                              child: Text(
                                "PE",
                                style:  TextStyle(fontWeight: FontWeight.w400, fontSize: SizeConfig.blockSizeVertical*1.7),
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
                          height: SizeConfig.blockSizeVertical * 12,
                          child: ListView.builder(
                            padding: EdgeInsets.only(top: 2),
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder:
                                (BuildContext context, int index) {
                              return classification(context);
                            },
                            itemCount: 2,
                          ),
                        )
                      ],
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
                  width: SizeConfig.blockSizeHorizontal * 100,
                  padding: EdgeInsets.only(
                      left: SizeConfig.blockSizeHorizontal * 3,
                      right: SizeConfig.blockSizeHorizontal * 1.75),
                  margin: EdgeInsets.symmetric(
                      horizontal: SizeConfig.blockSizeHorizontal * 1.85,
                      vertical: SizeConfig.blockSizeVertical * 0.75),
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
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(
                                top: SizeConfig.blockSizeVertical * 1.75),
                            child: Text(
                              "INFORMACION DEL PARTIDO",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: SizeConfig.blockSizeVertical * 1.85),
                            )),
                        Container(
                          margin: EdgeInsets.only(
                              top: SizeConfig.blockSizeVertical * 1.5),
                          width: SizeConfig.blockSizeHorizontal * 100,
                          height: SizeConfig.blockSizeVertical * 0.13,
                          color: Colors.black12,
                          child: SizedBox(),
                        ),
                        Container(
                            margin: EdgeInsets.only(
                                top: SizeConfig.blockSizeVertical * 1.5),
                            child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 3,
                                itemBuilder: (context, position) {
                                  return Container(
                                    margin: EdgeInsets.only(
                                        top: SizeConfig.blockSizeVertical * 1),
                                    width: SizeConfig.blockSizeHorizontal * 100,
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          width:
                                          SizeConfig.blockSizeHorizontal * 82,
                                          child: Row(
                                            children: <Widget>[
                                              Container(
                                                  width: SizeConfig
                                                      .blockSizeHorizontal *
                                                      20,
                                                  child: Text(
                                                    "Arbitro: ",
                                                    style: TextStyle(
                                                        fontSize: SizeConfig
                                                            .blockSizeVertical *
                                                            1.9,
                                                        fontWeight: FontWeight.w500,
                                                        color: Colors.black26),
                                                  )),
                                              Container(
                                                  width: SizeConfig
                                                      .blockSizeHorizontal *
                                                      60,
                                                  child: Text(
                                                    "Felix Brych",
                                                    style: TextStyle(
                                                        fontSize: SizeConfig
                                                            .blockSizeVertical *
                                                            1.9,
                                                        fontWeight: FontWeight.w500,
                                                        color: Colors.black87),
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }))
                      ]))
            ])
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
                  style: TextStyle(fontSize: SizeConfig.blockSizeVertical*1.75,fontWeight: FontWeight.w500),
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
                  width: SizeConfig.blockSizeHorizontal * 5,
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
}
