
import 'package:arena_sports_app/CommonWidgets/FlutterSlider.dart';
import 'package:arena_sports_app/CommonWidgets/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class Estadisticas extends StatefulWidget {
  @override
  _EstadisticasState createState() => _EstadisticasState();
}

class _EstadisticasState extends State<Estadisticas> {
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
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
        margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 1),
        width: SizeConfig.blockSizeHorizontal * 100,
        color: Colors.transparent,
        child: ListView(
          children: <Widget>[
        Container(
        padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal*1,right: SizeConfig.blockSizeHorizontal*1),
        margin: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal*1.85,vertical: SizeConfig.blockSizeVertical*1.75),
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
         child:Column(children: <Widget>[

           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: <Widget>[
               Container(
                   margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal*1,top: SizeConfig.blockSizeVertical*1.75),
                   child: Text("Barcelona",style: TextStyle(fontWeight: FontWeight.w600,fontSize: SizeConfig.blockSizeVertical*2.1),)),
               Container(
                   margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal*1,top: SizeConfig.blockSizeVertical*1.75),
                   child: Text("Bayern Munich",style: TextStyle(fontWeight: FontWeight.w600,fontSize: SizeConfig.blockSizeVertical*2.1),)),
             ],),
           Container(
             margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*1,left: SizeConfig.blockSizeHorizontal*2,right: SizeConfig.blockSizeHorizontal*2.5),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: <Widget>[
                 Container(
                     margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal*1,top: SizeConfig.blockSizeVertical*1),
                     child: Text("75' Messi",style: TextStyle(fontWeight: FontWeight.normal,fontSize: SizeConfig.blockSizeVertical*1.9,color: Colors.black26))),
                 Container(
                     margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal*1,top: SizeConfig.blockSizeVertical*1),
                     child: Text("LevandosKi 10'",style: TextStyle(fontWeight: FontWeight.normal,fontSize: SizeConfig.blockSizeVertical*1.9,color: Colors.black26),)),
               ],),
           ),
           Container(
             margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal*2,right: SizeConfig.blockSizeHorizontal*2.5),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: <Widget>[
                 Container(
                     margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal*1,top: SizeConfig.blockSizeVertical*0.5),
                     child: Text("71' Messi",style: TextStyle(fontWeight: FontWeight.normal,fontSize: SizeConfig.blockSizeVertical*1.9,color: Colors.black26))),
                 Container(
                     margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal*1,top: SizeConfig.blockSizeVertical*0.5),
                     child: Text("LevandosKi 10'",style: TextStyle(fontWeight: FontWeight.normal,fontSize: SizeConfig.blockSizeVertical*1.9,color: Colors.black26),)),
               ],),
           ),
           Container(
             margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal*2,right: SizeConfig.blockSizeHorizontal*2.5),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.end,
               children: <Widget>[
                 Container(
                     margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal*1,top: SizeConfig.blockSizeVertical*0.5),
                     child: Text("LevandosKi 10'",style: TextStyle(fontWeight: FontWeight.normal,fontSize: SizeConfig.blockSizeVertical*1.9,color: Colors.black26),)),
               ],),
           ),
    Container(
    margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*1,bottom: SizeConfig.blockSizeVertical*1.2),
    child:
    ListView.builder(
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: 5,
    itemBuilder: (context, position) {
      return Container(
          margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*0.75),
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
                  barcolor: Colors.red,
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
                  barcolor: Colors.lightBlue,
                ),)
            ],),
        ],)
      ],))
      ;
    }))
         ],))
          ],
        ));
  }
}
