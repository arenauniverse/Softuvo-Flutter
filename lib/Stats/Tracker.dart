
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../SizeConfig.dart';

class Tracker extends StatefulWidget {
  @override
  _TrackerState createState() => _TrackerState();
}

class _TrackerState extends State<Tracker> {
  var count = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black, // navigation bar color
      statusBarColor: Colors.transparent, // status bar color
    ));
  }

  @override
  Widget build(BuildContext context)
  {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*1.5),
        color: Colors.transparent,
        child:ListView(
            children: <Widget>[
              Container(
                  width: SizeConfig.blockSizeHorizontal*100,
                  padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal*3,right: SizeConfig.blockSizeHorizontal*1.75),
                  margin: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal*1.85,vertical: SizeConfig.blockSizeVertical*0.75),
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
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*1.25),
                          child: Text("LINEA DE TIEMPO",style: TextStyle(fontWeight: FontWeight.bold,fontSize: SizeConfig.blockSizeVertical*1.85),)),
                      Container(
                        margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*1.5),
                        width: SizeConfig.blockSizeHorizontal*100,
                        height: SizeConfig.blockSizeVertical*0.13,
                        color: Colors.black12,
                        child: SizedBox(),),
                      Container(
                          margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*1),
                          child:
                          ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 10,
                              itemBuilder: (context, position) {
                                return Container(
                                    margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*1.75),
                                    width: SizeConfig.blockSizeHorizontal*100,
                                    child:
                                    Column(children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Container(
                                            width: SizeConfig.blockSizeHorizontal*37.75,
                                            child: Row(children: <Widget>[
                                              Container(
                                                  width: SizeConfig.blockSizeHorizontal*26,
                                                  child:Text(
                                                    "L.Suarez",style: TextStyle(fontSize: SizeConfig.blockSizeVertical*1.8,fontWeight: FontWeight.w500),
                                                  )),
                                              Container(
                                                  alignment: Alignment.centerRight,
                                                  child: Image.asset("assets/images/football_black.png",width: SizeConfig.blockSizeHorizontal*5,height: SizeConfig.blockSizeHorizontal*5,))
                                            ],),
                                          ),
                                          Container(
                                              width: SizeConfig.blockSizeHorizontal*8,
                                              child:Text(
                                                "60'",style: TextStyle(fontSize: SizeConfig.blockSizeVertical*1.9,fontWeight: FontWeight.w400,color: Colors.black26),
                                              )),
                                          Container(
                                            width: SizeConfig.blockSizeHorizontal*37.75,
                                            child: Row(children: <Widget>[
                                              Container(
                                                  alignment: Alignment.center,
                                                  width: SizeConfig.blockSizeHorizontal*11,
                                                  child: Container(width: SizeConfig.blockSizeHorizontal*3,height: SizeConfig.blockSizeVertical*2,color: Colors.yellow,)),
                                              Container(
                                                  alignment: Alignment.centerRight,
                                                  width: SizeConfig.blockSizeHorizontal*26,
                                                  child:Text(
                                                    "L.Levandoski",style: TextStyle(fontSize: SizeConfig.blockSizeVertical*1.8,fontWeight: FontWeight.w500),
                                                  )),
                                            ],),
                                          ),
                                        ],),
                                      Container(
                                        margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*1.75),
                                        width: SizeConfig.blockSizeHorizontal*100,
                                        height: SizeConfig.blockSizeVertical*0.13,
                                        color: Colors.black12,
                                        child: SizedBox(),),

                                    ],)
                                );

                              }))



                    ],)),


            ])
    );

  }

}
