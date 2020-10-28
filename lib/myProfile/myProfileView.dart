import 'package:arena_sports_app/CommonWidgets/dividerWidget.dart';
import 'package:arena_sports_app/SizeConfig.dart';
import 'package:arena_sports_app/Terms&Conditions/Terms&Conditions_View.dart';
import 'package:arena_sports_app/theme.dart';
import 'package:arena_sports_app/theme/DarkThemeProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:arena_sports_app/CommonWidgets/sharePreferenceData.dart';

class MyProfileView extends StatefulWidget {
  @override
  _MyProfileViewState createState() => _MyProfileViewState();
}

class _MyProfileViewState extends State<MyProfileView> {
 //
  bool status=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharedPreferenceData().getSelectedThemeMode().then((value)
    {
      setState(() {
        status =value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);
    FlutterStatusbarcolor.setStatusBarColor(
        Colors.white); //this change the status bar color to white
    FlutterStatusbarcolor.setNavigationBarColor(
        Colors.green); //this sets the navigation bar color to green
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
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
              Navigator.pop(context);
// Get.back();
            },
            child: Container(
                padding: EdgeInsets.all(2),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 30.0,
                )),
          ),
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
                        ),
                      ),
                      margin: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 4),
                      color: Colors.transparent,
                    ),
                    Positioned(
                      child: Container(
                        margin: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 12),
                        width: SizeConfig.blockSizeHorizontal * 26,
                        alignment: Alignment.centerRight,
                        child: CircleAvatar(
                          radius: 15.0,
                          backgroundColor: Theme.of(context).backgroundColor,
                          child: CircleAvatar(
                            backgroundColor: Theme.of(context).indicatorColor,
                            child: Icon(
                              Icons.camera_alt_outlined,
                              size: 14,
                              color: Theme.of(context).backgroundColor,
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
                    /* color: AppTheme.blackColor*/
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 1),
                child: Text(
                  "@fernando",
                  style: TextStyle(
                    fontWeight: FontWeight
                        .w600, /*color:Theme.of(context).indicatorColor*/
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Theme.of(context).cardColor,
                ),
                height: SizeConfig.blockSizeVertical * 20,
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
                              color: Theme.of(context).indicatorColor,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical * 1),
                      GetDivider(),
                      SizedBox(height: SizeConfig.blockSizeVertical * 1),
                      GestureDetector(
                        child: Row(
                          children: [
                            Text("Contraseña"),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: Theme.of(context).indicatorColor,
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
                  color: Theme.of(context).cardColor,
                ),
                height: SizeConfig.blockSizeVertical * 30,
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
                              color: Theme.of(context).indicatorColor,
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical * 1),
                      GetDivider(),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            Text("Dark Mode"),
                            Spacer(),
                            Transform.scale(
                              scale: 1.3,
                              child: Switch(
                                value: status,
                                onChanged: (val) {
                                  setState(() {
                                    status = val;
                                    themeChange.darkTheme = status;
                                    SharedPreferenceData().saveSelectedThemeMode(status);
                                    /* RevealRoute(
                                      page: MyProfileView(),
                                      maxRadius: 800,
                                      centerAlignment: Alignment.center);*/
                                  });
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      GetDivider(),
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
                              color: Theme.of(context).indicatorColor,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: SizeConfig.blockSizeVertical * 1.5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Theme.of(context).cardColor,
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
                      Text("LEGAL",
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
                              color: Theme.of(context).indicatorColor,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical * 1),
                      GetDivider(),
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
                              color: Theme.of(context).indicatorColor,
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical * 1),
                      GetDivider(),
                      SizedBox(height: SizeConfig.blockSizeVertical * 1),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TermsConditionsView()),
                          );
                        },
                        child: Row(
                          children: [
                            Text("Terminos y condiciones"),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: Theme.of(context).indicatorColor,
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical * 1),
                      GetDivider(),
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
                              color: Theme.of(context).indicatorColor,
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical * 1),
                      GetDivider(),
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
                              color: Theme.of(context).indicatorColor,
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical * 1),
                      GetDivider(),
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
                              color: Theme.of(context).indicatorColor,
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
