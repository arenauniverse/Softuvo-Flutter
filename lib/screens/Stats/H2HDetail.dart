
import 'package:arena_sports_app/CommonWidgets/CircleNetworkImage.dart';
import 'package:arena_sports_app/CommonWidgets/FlutterSlider.dart';
import 'package:arena_sports_app/CommonWidgets/SizeConfig.dart';
import 'package:arena_sports_app/CommonWidgets/Strings.dart';
import 'package:arena_sports_app/CommonWidgets/dividerWidget.dart';
import 'package:arena_sports_app/constants/AppColors.dart';
import 'package:arena_sports_app/constants/StringConstant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../theme.dart';


class H2HDetail extends StatefulWidget {
  @override
  _H2HDetailState createState() => _H2HDetailState();
}

class _H2HDetailState extends State<H2HDetail> {
  var count = 0;
  TextStyle styles = TextStyle(fontWeight: FontWeight.w400, fontSize: 15);
  TextStyle boldStyles = TextStyle(fontWeight: FontWeight.w700, fontSize: 15);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        width: SizeConfig.blockSizeHorizontal * 100,
        height: SizeConfig.blockSizeVertical*100,
        color: Colors.transparent,
        child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 2.0, // soften the shadow
                  spreadRadius: 1.0, //extend the shadow
                )
              ],
            ),
            margin: EdgeInsets.only(
                top: SizeConfig.blockSizeVertical * 4,bottom: SizeConfig.blockSizeVertical*1,
                left: SizeConfig.blockSizeHorizontal * 2,right: SizeConfig.blockSizeHorizontal * 2),
            child: SingleChildScrollView(
              child: Column(
                  children: <Widget>[
                Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.bottomsheet.withOpacity(0.4),
                            borderRadius: new BorderRadius.all(
                              Radius.circular(4.0),
                            )),
                        margin: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 2),
                        alignment: Alignment.center,
                        width: SizeConfig.blockSizeHorizontal * 10,
                        height: SizeConfig.blockSizeVertical * 0.625,
                        child: SizedBox(),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                          width: SizeConfig.blockSizeHorizontal * 9,
                          height: SizeConfig.blockSizeHorizontal * 8,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            shape: BoxShape.circle,
                          ),
                          margin: EdgeInsets.only(
                              top: SizeConfig.blockSizeVertical * 1.25,
                              right: SizeConfig.blockSizeHorizontal * 3),
                          child: Icon(
                            Icons.close,
                            color: Colors.black38,
                          )),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                          margin: EdgeInsets.only(
                              left: SizeConfig.blockSizeHorizontal * 1,
                              top: SizeConfig.blockSizeVertical * 2),
                          child: Text(
                            "H2H",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: SizeConfig.blockSizeVertical * 2.05,
                              color: Colors.black,
                              fontFamily: StringConstants.font,
                            ),
                          )),
                    ),
                  ],
                ),

                Container(
                  width: SizeConfig.blockSizeHorizontal*100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Container(
                                    child: SvgPicture.asset(
                                      "assets/valencia.svg",
                                      width: SizeConfig.blockSizeVertical * 10,
                                    )),
                                Container(
                                  height: SizeConfig.blockSizeVertical * 1.5,
                                ),
                                Text(
                                  Strings.valencia,
                                  style: TextStyle(fontSize: SizeConfig.blockSizeVertical*2,fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                            Spacer(),
                            Container(
                              child: Column(
                                children: [
                                  Text(
                                    "14 Nov - 14:00",
                                    style: TextStyle(fontWeight: FontWeight.w700,fontSize: SizeConfig.blockSizeVertical*1.8,color: Colors.black),
                                  ),
                                  Container(
                                    height: SizeConfig.blockSizeVertical * 2,
                                  ),
                                  Text(
                                    "Direct TV",
                                    style: TextStyle(
                                        color: AppColors.title,fontSize: SizeConfig.blockSizeVertical*1.65,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            Column(
                              children: [
                                Container(
                                    child: SvgPicture.asset(
                                      'assets/realMardrid.svg',width: SizeConfig.blockSizeHorizontal*12,height: SizeConfig.blockSizeVertical*10,)),
                                Container(
                                  height: SizeConfig.blockSizeVertical * 1.5,
                                ),
                                Text(
                                  "Real Madrid",
                                  style: TextStyle(fontSize: SizeConfig.blockSizeVertical*2,fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ],
                        ),
                        margin: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 3,
                          left: SizeConfig.blockSizeHorizontal * 6,
                          right: SizeConfig.blockSizeHorizontal * 6,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Theme.of(context).cardColor,
                        ),
                      ),
                Container(
                    margin: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical*1.2),
                    child:
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, position) {
                          return Container(
                              margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*0.75,left: SizeConfig.blockSizeHorizontal*3,right: SizeConfig.blockSizeHorizontal*3),
                              child:
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal*1,bottom: SizeConfig.blockSizeVertical*1.25),
                                      child: Text("LevandosKi 10'",style: TextStyle(fontWeight: FontWeight.normal,fontSize: SizeConfig.blockSizeVertical*1.9,color: Colors.black26),)),
                                  Column(
                                    children: [
                                      Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Container(
                                                margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal*2,right: SizeConfig.blockSizeHorizontal*2),
                                                child: Text("3", style: TextStyle(
                                                    fontWeight: FontWeight.bold, fontSize: SizeConfig.blockSizeVertical * 2, color: Colors.black),)),
                                            Container(
                                                margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal*2,right: SizeConfig.blockSizeHorizontal*2),
                                                child: Text("7", style: TextStyle(
                                                    fontWeight: FontWeight.bold, fontSize: SizeConfig
                                                    .blockSizeVertical * 2, color: Colors.black),)),
                                          ]),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(
                                            width: SizeConfig.blockSizeHorizontal * 43.1,
                                            child:
                                            FlutterSlider(
                                              values: [50],
                                              max: 100,
                                              min: 0,
                                              handlerHeight: 15.0,
                                              disabled: true,
                                              barcolor: Colors.red,trackBar: FlutterSliderTrackBar(activeTrackBar: BoxDecoration(borderRadius: BorderRadius.circular(SizeConfig.blockSizeVertical*1)),
                                                activeTrackBarHeight: SizeConfig.blockSizeVertical*0.6,inactiveTrackBarHeight: SizeConfig.blockSizeVertical*0.6,
                                                inactiveTrackBar: BoxDecoration(borderRadius: BorderRadius.circular(SizeConfig.blockSizeVertical*1))
                                            ),
                                            ),),
                                          Container(
                                            width: SizeConfig.blockSizeHorizontal * 43.1,
                                            child:
                                            FlutterSlider(
                                              values: [50],
                                              max: 100,
                                              min: 0,
                                              handlerHeight: 15.0,
                                              disabled: true,
                                              barcolor: Colors.lightBlue,trackBar: FlutterSliderTrackBar(activeTrackBar: BoxDecoration(borderRadius: BorderRadius.circular(SizeConfig.blockSizeVertical*1)),
                                                activeTrackBarHeight: SizeConfig.blockSizeVertical*0.6,inactiveTrackBarHeight: SizeConfig.blockSizeVertical*0.6,
                                                inactiveTrackBar: BoxDecoration(borderRadius: BorderRadius.circular(SizeConfig.blockSizeVertical*1))
                                            ),
                                            ),)
                                        ],),
                                    ],)
                                ],))
                          ;
                        })),



                Container(
                  margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*2),
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal*6,vertical: SizeConfig.blockSizeVertical*2),
                  child:Image.asset("assets/graph.png"),)
              ]),
            )),
      ),
    );
  }
}
