import 'package:arena_sports_app/CommonWidgets/CircleNetworkImage.dart';
import 'package:arena_sports_app/CommonWidgets/FlutterSlider.dart';
import 'package:arena_sports_app/CommonWidgets/SizeConfig.dart';
import 'package:arena_sports_app/constants/AppColors.dart';
import 'package:arena_sports_app/constants/StringConstant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Alineacion.dart';
import 'Estadisticas.dart';
import 'InfoScreen.dart';
import 'Tracker.dart';

class EstadisticasDetail extends StatefulWidget {
  @override
  _EstadisticasDetailState createState() => _EstadisticasDetailState();
}

class _EstadisticasDetailState extends State<EstadisticasDetail>
    with SingleTickerProviderStateMixin {
  var count = 0;

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
              child: Column(children: <Widget>[
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
                            "Estadistica Jugador",
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
                  margin:
                      EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2.75),
                  child: showimage("", SizeConfig.blockSizeVertical * 6),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                      margin: EdgeInsets.only(
                          left: SizeConfig.blockSizeHorizontal * 1,
                          top: SizeConfig.blockSizeVertical * 1.5),
                      child: Text(
                        "Leonel Messi",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: SizeConfig.blockSizeVertical * 1.9,
                          color: Colors.black,
                          fontFamily: StringConstants.font,
                        ),
                      )),
                ),
                Container(
                    width: SizeConfig.blockSizeHorizontal * 100,
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 4,
                        itemBuilder: (context, position) {
                          return Container(
                            margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*1.75),
                            child: Column(
                            children: [
                              Container(
                                width:SizeConfig.blockSizeHorizontal*88,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                Container(
                                    margin: EdgeInsets.only(
                                        left: SizeConfig.blockSizeHorizontal * 1,
                                    ),
                                    child: Text(
                                      "Tiros al arco",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: SizeConfig.blockSizeVertical * 1.9,
                                        color: AppColors.title,
                                        fontFamily: StringConstants.font,
                                      ),
                                    )), Container(
                                      margin: EdgeInsets.only(
                                          right: SizeConfig.blockSizeHorizontal * 1,),
                                      child: Text(
                                        "00",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: SizeConfig.blockSizeVertical * 1.9,
                                          color: Colors.black,
                                          fontFamily: StringConstants.font,
                                        ),
                                      ))
                              ],),),
                              Container(
                                width: SizeConfig.blockSizeHorizontal * 88,
                                margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*0.15),
                                child:
                                FlutterSlider(
                                  values: [50],
                                  max: 100,
                                  min: 0,
                                  handlerHeight: 10.0,
                                  disabled: true,
                                  barcolor: AppColors.progresscolor,
                                  trackBar: FlutterSliderTrackBar(activeTrackBar: BoxDecoration(borderRadius: BorderRadius.circular(SizeConfig.blockSizeVertical*1)),
                                  activeTrackBarHeight: SizeConfig.blockSizeVertical*0.6,inactiveTrackBarHeight: SizeConfig.blockSizeVertical*0.6,
                                      inactiveTrackBar: BoxDecoration(borderRadius: BorderRadius.circular(SizeConfig.blockSizeVertical*1))
                                  ),
                                ),),
                            ],
                          ),);
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
