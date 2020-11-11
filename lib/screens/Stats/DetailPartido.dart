import 'package:arena_sports_app/CommonWidgets/CircleNetworkImage.dart';
import 'package:arena_sports_app/CommonWidgets/FlutterSlider.dart';
import 'package:arena_sports_app/CommonWidgets/SizeConfig.dart';
import 'package:arena_sports_app/CommonWidgets/Strings.dart';
import 'package:arena_sports_app/constants/AppColors.dart';
import 'package:arena_sports_app/constants/StringConstant.dart';
import 'package:arena_sports_app/screens/Stats/DetailH2H.dart';
import 'package:arena_sports_app/screens/Stats/DetailNoticias.dart';
import 'package:arena_sports_app/screens/Stats/DetailResumen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../theme.dart';
import 'Alineacion.dart';
import 'Estadisticas.dart';
import 'InfoScreen.dart';
import 'Tracker.dart';

class DetailPartido extends StatefulWidget {
  @override
  _DetailPartidoState createState() => _DetailPartidoState();
}

class _DetailPartidoState extends State<DetailPartido>
    with SingleTickerProviderStateMixin {
  var count = 0;
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: 3, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        
        width: SizeConfig.blockSizeHorizontal * 100,
        height: SizeConfig.blockSizeVertical*100,
        color: Colors.white,
        child: Column(children: [
           Container(
             margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*6,left: SizeConfig.blockSizeHorizontal*5,right: SizeConfig.blockSizeHorizontal*5),
             child: Row(children: [
              Icon(Icons.arrow_back_ios_rounded,size: SizeConfig.blockSizeVertical*3,color: Colors.black,),
              Spacer(),
              Image.asset("assets/bell 2.png",width: SizeConfig.blockSizeVertical*3.25,height: SizeConfig.blockSizeVertical*3.25),
              Container(
                margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal*5),
                child: SvgPicture.asset(
                  'assets/signOut.svg'))
           ],),),
          Container(
            width: SizeConfig.blockSizeHorizontal*100,alignment: Alignment.center,
              margin: EdgeInsets.only(
                  left: SizeConfig.blockSizeHorizontal * 1,
                  top: SizeConfig.blockSizeVertical * 2),
              child: Text(
                "La Liga",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: SizeConfig.blockSizeVertical * 2.1,
                  color: Colors.black,
                  fontFamily: StringConstants.font,
                ),
              )),
          Container(
              width: SizeConfig.blockSizeHorizontal*100,alignment: Alignment.center,
              margin: EdgeInsets.only(
                  top: SizeConfig.blockSizeVertical * 1.5),
              child: Text(
                "Partido 4ta Fecha",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: SizeConfig.blockSizeVertical * 1.9,
                  color: AppColors.title,
                  fontFamily: StringConstants.font,
                ),
              )),
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
            margin: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockSizeHorizontal * 1,vertical: SizeConfig.blockSizeVertical*0.75),
            alignment: Alignment.topCenter,
            child: _vowTabs(),
          )
            ]),
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
              unselectedLabelColor: Colors.black45,
              tabs: <Widget>[
                Container(
                  child: Text(
                    "Resumen",
                    style: TextStyle(
                      fontSize: SizeConfig.blockSizeVertical * 1.625,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      right: SizeConfig.blockSizeHorizontal * 1.75),
                  child: Text(
                    "H2H",
                    style: TextStyle(
                      fontSize: SizeConfig.blockSizeVertical * 1.625,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: SizeConfig.blockSizeHorizontal * 0.25),
                  child: Text(
                    "Noticias",
                    style: TextStyle(
                      fontSize: SizeConfig.blockSizeVertical * 1.625,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            )),
        Container(
          height: SizeConfig.blockSizeVertical * 55.5,
          padding: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 1),
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              DetailResumen(),
              DetailH2H(),
              DetailNoticias(),
            ],
          ),
        )
      ],
    );
  }
}
