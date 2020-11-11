
import 'package:arena_sports_app/CommonWidgets/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';


class DetailNoticias extends StatefulWidget {
  @override
  _DetailNoticiasState createState() => _DetailNoticiasState();
}

class _DetailNoticiasState extends State<DetailNoticias> {
  var count = 0;

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

            ])
    );

  }

}
