
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../SizeConfig.dart';


class Alineacion extends StatefulWidget {
  @override
  _AlineacionState createState() => _AlineacionState();
}

class _AlineacionState extends State<Alineacion> {
  var count = 0;

  @override
  void initState()
  {
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
      margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*1),
      width: SizeConfig.blockSizeHorizontal*100,
        color: Colors.transparent,
        child:
        ListView(children: <Widget>[
          Row(children: <Widget>[
            Container(
                width: SizeConfig.blockSizeHorizontal*43,alignment: Alignment.center,
                padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal*3,right: SizeConfig.blockSizeHorizontal*1.75,top: SizeConfig.blockSizeVertical*1.25,bottom: SizeConfig.blockSizeVertical*1.25),
                margin: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal*1.85,vertical: SizeConfig.blockSizeVertical*0.75),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 2.0, // soften the shadow
                        spreadRadius: 1.0, //extend the shadow
                      )
                    ],
                    color: Colors.black,
                    borderRadius: new BorderRadius.all(
                      Radius.circular(8.0),
                    )),
                child:Text("Barcelona",textAlign:TextAlign.center,style: TextStyle(fontSize: SizeConfig.blockSizeVertical*2.1,
                    fontWeight: FontWeight.w500,color: Colors.white),)),
            Container(
                width: SizeConfig.blockSizeHorizontal*43,alignment: Alignment.center,
                padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal*3,right: SizeConfig.blockSizeHorizontal*1.75,top: SizeConfig.blockSizeVertical*1.25,bottom: SizeConfig.blockSizeVertical*1.25),
                margin: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal*0.75,vertical: SizeConfig.blockSizeVertical*0.75),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 2.0, // soften the shadow
                        spreadRadius: 1.0, //extend the shadow
                      )
                    ],
                    color: Colors.black,
                    borderRadius: new BorderRadius.all(
                      Radius.circular(8.0),
                    )),
                child:Text("Bayern Munich",textAlign:TextAlign.center,style: TextStyle(fontSize: SizeConfig.blockSizeVertical*2.1,
                    fontWeight: FontWeight.w500,color: Colors.white),))

          ],),
                    Container(
                        width: SizeConfig.blockSizeHorizontal*100,
                        padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal*3,right: SizeConfig.blockSizeHorizontal*1.75,bottom: SizeConfig.blockSizeVertical*2),
                        margin: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal*0.75,vertical: SizeConfig.blockSizeVertical*0.75),
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
                        SingleChildScrollView(child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[

                            Container(
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
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                  margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*1.25),
                                                  child: Text("ARQUEROS",style: TextStyle(fontWeight: FontWeight.bold,fontSize: SizeConfig.blockSizeVertical*2.15),)),
                                              Container(
                                                margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*1.25),
                                                width: SizeConfig.blockSizeHorizontal*100,
                                                height: SizeConfig.blockSizeVertical*0.13,
                                                color: Colors.black12,
                                                child: SizedBox(),),
                                              Container(
                                                margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*1),
                                                width: SizeConfig.blockSizeHorizontal*100,
                                                child: ListView.builder(
                                                    physics: NeverScrollableScrollPhysics(),
                                                    shrinkWrap: true,
                                                    itemCount: 2,
                                                    itemBuilder: (context, position) {
                                                      return Container(
                                                          margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*1.75),
                                                          width: SizeConfig.blockSizeHorizontal*100,
                                                          child:Column(children: <Widget>[
                                                            Row(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: <Widget>[
                                                                CircleAvatar(
                                                                  child:  CachedNetworkImage(
                                                                    imageUrl: "",  fit: BoxFit.cover,
                                                                    placeholder: (context, url) =>  Container(
                                                                      // padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical*25,left: SizeConfig.blockSizeHorizontal*4,right: SizeConfig.blockSizeVertical*4),
                                                                      child: Icon(Icons.error),
                                                                    ),
                                                                    errorWidget: (context, url, error) => Icon(Icons.error),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width:SizeConfig.blockSizeHorizontal*63,
                                                                  child: Column(
                                                                    mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: <Widget>[
                                                                      Container(
                                                                          margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*0.5,left: SizeConfig.blockSizeHorizontal*3),
                                                                          child: Text("Neto",style: TextStyle(fontWeight: FontWeight.bold,fontSize: SizeConfig.blockSizeVertical*2),)),
                                                                      Container(
                                                                          margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*0.5,left: SizeConfig.blockSizeHorizontal*3),
                                                                          child: Text("Araxa,Brazil",style: TextStyle(fontWeight: FontWeight.normal,fontSize: SizeConfig.blockSizeVertical*2,color: Colors.black26),)),
                                                                    ],),
                                                                ),
                                                                Container(
                                                                    margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*1.5,left: SizeConfig.blockSizeHorizontal*3),
                                                                    child: Text("13",style: TextStyle(fontWeight: FontWeight.bold,fontSize: SizeConfig.blockSizeVertical*2.5),)),

                                                              ],),
                                                            Container(
                                                              margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*1.25),
                                                              width: SizeConfig.blockSizeHorizontal*79,
                                                              height: SizeConfig.blockSizeVertical*0.09,
                                                              color: Colors.black12,
                                                              child: SizedBox(),),

                                                          ],)
                                                      );

                                                    }),
                                              )

                                            ],)
                                      );

                                    }))



                          ],),
          ),
                  )
          ],)
    );

  }

}
