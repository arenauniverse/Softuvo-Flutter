
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../SizeConfig.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
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
        color: Colors.transparent,
        child:ListView(
          children: <Widget>[
               Container(
                padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal*3,right: SizeConfig.blockSizeHorizontal*1.75),
                margin: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal*1.85,vertical: SizeConfig.blockSizeVertical*1.75),
                  height: SizeConfig.blockSizeVertical*12,
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
                  child:
                  Row(children: <Widget>[
                  new CircularPercentIndicator(
                    radius: SizeConfig.blockSizeVertical*6,
                    lineWidth: 4.25,
                    percent: 0.32,
                    center: new Image.asset("assets/images/football.png",width: SizeConfig.blockSizeHorizontal*8,height: SizeConfig.blockSizeHorizontal*7),
                    backgroundColor: Colors.black12,
                    progressColor: Colors.blue,
                  ),
                  Container(
                      margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal*2),
                      child: Text("32",style: TextStyle(fontWeight: FontWeight.w800,fontSize: SizeConfig.blockSizeVertical*2),)),
                    Container(
                      width: SizeConfig.blockSizeHorizontal*44,
                        height: SizeConfig.blockSizeVertical*11,alignment: Alignment.center,
                      //  margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal*2),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal*2),
                                    child: Text("11",style: TextStyle(fontWeight: FontWeight.w700,fontSize: SizeConfig.blockSizeVertical*1.75),)),
                                Container(
                                    margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal*2),
                                    child: Text("Ataque",style: TextStyle(fontWeight: FontWeight.normal,fontSize: SizeConfig.blockSizeVertical*1.75,color: Colors.black26),)),
                                Container(
                                    margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal*2),
                                    child: Text("24",style: TextStyle(fontWeight: FontWeight.w700,fontSize: SizeConfig.blockSizeVertical*1.75),)),

                              ],
                            ),
                            Container(
                              width: SizeConfig.blockSizeHorizontal*44,
                              margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*0.75),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                      margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal*2),
                                      child: Text("54",style: TextStyle(fontWeight: FontWeight.w700,fontSize: SizeConfig.blockSizeVertical*1.75),)),
                                  Container(
                                      margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal*2),
                                      child: Text("Pases",style: TextStyle(fontWeight: FontWeight.normal,fontSize: SizeConfig.blockSizeVertical*1.75,color: Colors.black26),)),
                                  Container(
                                      margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal*2),
                                      child: Text("100",style: TextStyle(fontWeight: FontWeight.w700,fontSize: SizeConfig.blockSizeVertical*1.75),)),

                                ],
                              ),
                            ),
                            Container(
                              width: SizeConfig.blockSizeHorizontal*44,
                              margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*0.75),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                      margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal*2),
                                      child: Text("13",style: TextStyle(fontWeight: FontWeight.w700,fontSize: SizeConfig.blockSizeVertical*1.75),)),
                                  Container(
                                    alignment: Alignment.center,
                                      margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal*2),
                                      child: Text("Tiros",style: TextStyle(fontWeight: FontWeight.normal,fontSize: SizeConfig.blockSizeVertical*1.75,color: Colors.black26),)),
                                  Container(
                                      margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal*2),
                                      child: Text("40",style: TextStyle(fontWeight: FontWeight.w700,fontSize: SizeConfig.blockSizeVertical*1.75),)),

                                ],
                              ),
                            )
                          ],
                        )),
                    Container(
                        margin: EdgeInsets.only(right: SizeConfig.blockSizeHorizontal*2),
                        child: Text("68",style: TextStyle(fontWeight: FontWeight.w800,fontSize: SizeConfig.blockSizeVertical*2),)),
                    new CircularPercentIndicator(
                      radius: SizeConfig.blockSizeVertical*6,
                      lineWidth: 4.25,
                      percent: 0.62,
                      center: new Image.asset("assets/images/football.png",width: SizeConfig.blockSizeHorizontal*8,height: SizeConfig.blockSizeHorizontal*7),
                      backgroundColor: Colors.black12,
                      progressColor: Colors.red,
                    ),

                  ],),),
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
        itemCount: 5,
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
    child: Text("INFORMACION DEL PARTIDO",style: TextStyle(fontWeight: FontWeight.bold,fontSize: SizeConfig.blockSizeVertical*1.85),)),
    Container(
    margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*1.5),
    width: SizeConfig.blockSizeHorizontal*100,
    height: SizeConfig.blockSizeVertical*0.13,
    color: Colors.black12,
    child: SizedBox(),),
      Container(
          margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*1.5),
          child:
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, position) {
                return Container(
                    margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*1),
                    width: SizeConfig.blockSizeHorizontal*100,
                    child:
                      Row(
                        children: <Widget>[
                          Container(
                            width: SizeConfig.blockSizeHorizontal*82,
                            child: Row(children: <Widget>[
                              Container(
                                  width: SizeConfig.blockSizeHorizontal*20,
                                  child:Text(
                                    "Arbitro: ",style: TextStyle(fontSize: SizeConfig.blockSizeVertical*1.9,fontWeight: FontWeight.w500,color: Colors.black26),
                                  )),
                              Container(
                                  width: SizeConfig.blockSizeHorizontal*60,
                                  child:Text(
                                    "Felix Brych",style: TextStyle(fontSize: SizeConfig.blockSizeVertical*1.9,fontWeight: FontWeight.w500,color: Colors.black87),
                                  )),  ],),
                          ),

                        ],),
                );

              }))







    ]))


            ])
        );

  }

}
