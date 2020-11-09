import 'package:arena_sports_app/CommonWidgets/SizeConfig.dart';
import 'package:arena_sports_app/constants/StringConstant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Alineacion.dart';
import 'Estadisticas.dart';
import 'InfoScreen.dart';
import 'Tracker.dart';


class Sample extends StatefulWidget {
  @override
  _SampleState createState() => _SampleState();
}

class _SampleState extends State<Sample> with SingleTickerProviderStateMixin {
  var count = 0;
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black, // navigation bar color
      statusBarColor: Colors.transparent, // status bar color
    ));
    _tabController = TabController(vsync: this, length: 5, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      /*appBar: AppBar(
        brightness: Brightness.light,
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Container(
          decoration:  BoxDecoration(
              color:Colors.pink,
              borderRadius: new BorderRadius.all(
                 Radius.circular(5.0),
              )
          ),
          padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical*0.225,horizontal: SizeConfig.blockSizeHorizontal*1.75),
          child: Text("EN VIVO",style: TextStyle(fontWeight: FontWeight.w400,fontSize: SizeConfig.blockSizeVertical*1.825),),),
      ),*/
      body: Container(
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
            margin: EdgeInsets.symmetric(
                vertical: SizeConfig.blockSizeVertical * 4,
                horizontal: SizeConfig.blockSizeHorizontal * 3),
            child: SingleChildScrollView(
              child: Stack(alignment: Alignment.topRight, children: <Widget>[
                Container(
                    width: SizeConfig.blockSizeHorizontal * 9,
                    height: SizeConfig.blockSizeHorizontal * 8,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      shape: BoxShape.circle,
                    ),
                    margin: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical * 2.35,
                        right: SizeConfig.blockSizeHorizontal * 3),
                    child: Icon(
                      Icons.close,
                      color: Colors.black38,
                    )),
                Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.black38,
                          borderRadius: new BorderRadius.all(
                            Radius.circular(4.0),
                          )),
                      margin: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 2.25),
                      alignment: Alignment.center,
                      width: SizeConfig.blockSizeHorizontal * 12,
                      height: SizeConfig.blockSizeVertical * 0.5,
                      child: SizedBox(),
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius: new BorderRadius.all(
                              Radius.circular(5.0),
                            )),
                        margin: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 3.75),
                        padding: EdgeInsets.symmetric(
                            vertical: SizeConfig.blockSizeVertical * 0.225,
                            horizontal: SizeConfig.blockSizeHorizontal * 1.75),
                        child: Text(
                          "EN VIVO",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: SizeConfig.blockSizeVertical * 1.825),
                        )),
                    Container(
                        margin: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 2.25),
                        alignment: Alignment.center,
                        child: Text(
                          StringConstants.LEAGUE,
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeVertical * 2.5,
                              fontWeight: FontWeight.bold),
                        )),
                    Container(
                        margin: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 1.5),
                        alignment: Alignment.center,
                        child: Text(
                          "Semi Final - Segundo Partido",
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeVertical * 1.925,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        )),
                    Stack(alignment: Alignment.center, children: <Widget>[
                      Container(
                        width: SizeConfig.blockSizeHorizontal * 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.only(
                                    top: SizeConfig.blockSizeVertical * 1.5),
                                alignment: Alignment.center,
                                child: Text(
                                  "2",
                                  style: TextStyle(
                                      fontSize:
                                          SizeConfig.blockSizeVertical * 3.25,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black),
                                )),
                            Container(
                                margin: EdgeInsets.only(
                                    top: SizeConfig.blockSizeVertical * 1.5),
                                alignment: Alignment.center,
                                child: Text(
                                  " : ",
                                  style: TextStyle(
                                      fontSize:
                                          SizeConfig.blockSizeVertical * 3.25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black26),
                                )),
                            Container(
                                margin: EdgeInsets.only(
                                    top: SizeConfig.blockSizeVertical * 1.5),
                                alignment: Alignment.center,
                                child: Text(
                                  "6",
                                  style: TextStyle(
                                      fontSize:
                                          SizeConfig.blockSizeVertical * 3.25,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black),
                                )),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                                width: SizeConfig.blockSizeHorizontal * 12,
                                height: SizeConfig.blockSizeHorizontal * 12,
                                margin: EdgeInsets.symmetric(
                                    horizontal:
                                        SizeConfig.blockSizeHorizontal * 2),
                                child:
                                    Image.asset("assets/images/barcelona.png")),
                            Container(
                                width: SizeConfig.blockSizeHorizontal * 12,
                                height: SizeConfig.blockSizeHorizontal * 12,
                                margin: EdgeInsets.symmetric(
                                    horizontal:
                                        SizeConfig.blockSizeHorizontal * 2),
                                child:
                                    Image.asset("assets/images/teamlogo.png")),
                          ],
                        ),
                      ),
                    ]),
                    Container(
                        margin: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 0.5),
                        alignment: Alignment.center,
                        child: Text(
                          "60'",
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeVertical * 2.15,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        )),
                    Container(
                        height: SizeConfig.blockSizeVertical * 13,
                        margin: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 2.5,
                        ),
                        child: Image.asset("assets/images/stadium.png")),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: SizeConfig.blockSizeHorizontal * 1),
                      alignment: Alignment.center,
                      child: _vowTabs(),
                    )
                  ],
                ),
              ]),
            )),
      ),
    );
  }

  Widget _vowTabs() {
    return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: <Widget>[
        Container(
            color: Colors.transparent,
            child: TabBar(
              onTap: (index) {
                setState(() {
                  count = 1;
                });
              },
              isScrollable: true,
              controller: _tabController,
              labelColor: Colors.black,
              indicatorColor: Colors.black87,
              indicatorWeight: 2.75,
              labelPadding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockSizeHorizontal * 3.2,
                vertical: SizeConfig.blockSizeVertical * 0.25,
              ),
              unselectedLabelColor: Colors.black54,
              tabs: <Widget>[
                Container(
                  child: Text(
                    "Info",
                    style: TextStyle(
                      fontSize: SizeConfig.blockSizeVertical * 1.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      right: SizeConfig.blockSizeHorizontal * 1.75),
                  child: Text(
                    "Alineacion",
                    style: TextStyle(
                      fontSize: SizeConfig.blockSizeVertical * 1.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: SizeConfig.blockSizeHorizontal * 0.25),
                  child: Text(
                    "Estadisticas",
                    style: TextStyle(
                      fontSize: SizeConfig.blockSizeVertical * 1.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "Tracker",
                    style: TextStyle(
                      fontSize: SizeConfig.blockSizeVertical * 1.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                    child: Text(
                  "H2H",
                  style: TextStyle(
                    fontSize: SizeConfig.blockSizeVertical * 1.5,
                    fontWeight: FontWeight.w500,
                  ),
                )),
              ],
            )),
        Container(
          height: SizeConfig.blockSizeVertical * 40,
          padding: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 1),
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              Info(),
              Alineacion(),
              Estadisticas(),
              Tracker(),
              SizedBox(),
            ],
          ),
        )
      ],
    );
  }
}
