import 'package:arena_sports_app/SizeConfig.dart';
import 'package:arena_sports_app/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

class MyProfileView extends StatefulWidget {
  @override
  _MyProfileViewState createState() => _MyProfileViewState();
}

class _MyProfileViewState extends State<MyProfileView> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: AppTheme.backGroundColor,
        appBar: AppBar(
          backgroundColor: AppTheme.whiteColor,
          title: Text(
            "Mi Perfil",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
          actions: [
            GestureDetector(
              child: Container(
                padding: EdgeInsets.only(
                    top: SizeConfig.blockSizeVertical * 3,
                    right: SizeConfig.blockSizeHorizontal * 3),
                child: Text("Salir",
                    style: TextStyle(
                        color: AppTheme.blueColor,
                        fontWeight: FontWeight.w600)),
              ),
            )
          ],
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios,
              size: 20.0,
            ),
          ),
          /*Container(
          padding: EdgeInsets.only(
              top: SizeConfig.blockSizeVertical * 3,
              right: SizeConfig.blockSizeHorizontal * 3),
          child: SvgPicture.asset('assets/backArrow.svg'),
        )*/
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Stack(
                  children: <Widget>[
                    Container(
                      child: CircleAvatar(
                        radius: 51,
                        backgroundColor: AppTheme.borderColor,
                        child: CircleAvatar(
                          backgroundColor: AppTheme.greyColor,
                          radius: 50,
                          child: SvgPicture.asset('assets/dummyUser.svg'),
                          /*backgroundImage: AssetImage('assets/dummyUser.svg'),*/
                        ),
                      ),
                      margin: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 4),
                      color: Colors.transparent,
                    ),
                    Positioned(
                      child: Container(
                        margin: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 14.25),
                        width: SizeConfig.blockSizeHorizontal * 29,
                        //height: SizeConfig.blockSizeVertical * 25,
                        alignment: Alignment.centerRight,
                        child: CircleAvatar(
                          radius: 15.0,
                          backgroundColor: AppTheme.whiteColor,
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                            child: Icon(
                              Icons.camera_alt_outlined,
                              size: 14,
                              color: AppTheme.whiteColor,
                            ),
                            radius: 14.0,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
                child: Text(
                  "Fernando Martinez",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.blackColor),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 1),
                child: Text(
                  "@fernando",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: AppTheme.blackColor),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: AppTheme.whiteColor,
                ),
                height: SizeConfig.blockSizeVertical * 21,
                width: SizeConfig.blockSizeHorizontal * 93,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.blockSizeHorizontal * 3,
                      vertical: SizeConfig.blockSizeVertical * 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("PERFIL",
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 15.0)),
                      SizedBox(height: SizeConfig.blockSizeVertical * 2.5),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            Text("Mi informacion"),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: AppTheme.blackColor,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical * 1),
                      Divider(
                        color: AppTheme.blackColor,
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical * 1),
                      GestureDetector(
                        child: Row(
                          children: [
                            Text("Contraseña"),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: AppTheme.blackColor,
                            )
                          ],
                        ),
                        onTap: () {},
                      )
                    ],
                  ),
                ),
              ),
              /* SizedBox(
                height: SizeConfig.blockSizeVertical * 1.5,
              ),*/
              Container(
                margin:
                    EdgeInsets.only(top: SizeConfig.blockSizeVertical * 1.5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: AppTheme.whiteColor,
                ),
                height: SizeConfig.blockSizeVertical * 29,
                width: SizeConfig.blockSizeHorizontal * 93,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.blockSizeHorizontal * 3,
                      vertical: SizeConfig.blockSizeVertical * 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("GENERAL",
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 15.0)),
                      SizedBox(height: SizeConfig.blockSizeVertical * 2.5),
                      GestureDetector(
                        child: Row(
                          children: [
                            Text("Notificaciones"),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: AppTheme.blackColor,
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical * 1),
                      Divider(
                        color: AppTheme.blackColor,
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical * 1),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            Text("Dark Mode"),
                            Spacer(),
                            Container(
                              child: FlutterSwitch(
                                activeColor: AppTheme.blueColor,
                                inactiveColor: AppTheme.toggleColor,
                                width: 50.0,
                                height: 28.0,
                                toggleSize: 18.0,
                                value: status,
                                borderRadius: 20.0,
                                padding: 5.0,
                                onToggle: (val) {
                                  setState(() {
                                    status = val;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical * 1),
                      Divider(
                        color: AppTheme.blackColor,
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical * 1),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            Text("My App"),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: AppTheme.blackColor,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              /*SizedBox(
                height: SizeConfig.blockSizeVertical * 1.5,
              ),*/
              Container(
                margin:
                    EdgeInsets.only(top: SizeConfig.blockSizeVertical * 1.5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: AppTheme.whiteColor,
                ),
                height: SizeConfig.blockSizeVertical * 50,
                width: SizeConfig.blockSizeHorizontal * 93,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.blockSizeHorizontal * 3,
                      vertical: SizeConfig.blockSizeVertical * 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Legal",
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 15.0)),
                      SizedBox(height: SizeConfig.blockSizeVertical * 2.5),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            Text("Ajustes de privacidad"),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: AppTheme.blackColor,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical * 1),
                      Divider(
                        color: AppTheme.blackColor,
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical * 1),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            Text("Política de privacidad"),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: AppTheme.blackColor,
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical * 1),
                      Divider(
                        color: AppTheme.blackColor,
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical * 1),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            Text("Terminos y condiciones"),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: AppTheme.blackColor,
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical * 1),
                      Divider(
                        color: AppTheme.blackColor,
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical * 1),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            Text("Licencias"),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: AppTheme.blackColor,
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical * 1),
                      Divider(
                        color: AppTheme.blackColor,
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical * 1),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            Text("Aviso"),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: AppTheme.blackColor,
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical * 1),
                      Divider(
                        color: AppTheme.blackColor,
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical * 1),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            Text("Soporte"),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: AppTheme.blackColor,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 1.5,
              ),
            ],
          ),
        ));
  }
}
