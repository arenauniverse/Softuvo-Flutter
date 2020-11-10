
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../CommonWidgets/FlutterSlider.dart';
import '../../CommonWidgets/SizeConfig.dart';

class EstadisticasDetail extends StatefulWidget {
  @override
  _EstadisticasDetailState createState() => _EstadisticasDetailState();
}

class _EstadisticasDetailState extends State<EstadisticasDetail> {
  var count = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
        width: SizeConfig.blockSizeHorizontal * 100,
        height: SizeConfig.blockSizeVertical*100,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(child: Column(children: [

            ],),),
          ),
        ));
  }
}
