import 'package:arena_sports_app/CommonWidgets/SizeConfig.dart';
import 'package:arena_sports_app/CommonWidgets/Strings.dart';
import 'package:arena_sports_app/myProfile/myProfileView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme.dart';

class ArenaBottomSheet extends StatefulWidget {
  @override
  _ArenaBottomSheetState createState() => _ArenaBottomSheetState();
}

class _ArenaBottomSheetState extends State<ArenaBottomSheet> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(30)),
      ),
      height: SizeConfig.blockSizeVertical * 85,
      width: SizeConfig.blockSizeHorizontal * 100,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 2,
                      right: SizeConfig.blockSizeVertical * 2),
                  child: SvgPicture.asset('assets/crossIcon.svg'),
                ),
              ),
            ),
            SvgPicture.asset(
              'assets/qrCode.svg',
              width: SizeConfig.blockSizeHorizontal * 35,
            ),
            Container(
              margin: EdgeInsets.only(
                  left: SizeConfig.blockSizeHorizontal * 4,
                  right: SizeConfig.blockSizeHorizontal * 4,
                  top: SizeConfig.blockSizeVertical * 2),
              child: Row(
                children: [
                  Text(Strings.myProfile,
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                  Spacer(),
                  GestureDetector(
                    child: Text(
                      Strings.Setup,
                      style: TextStyle(
                          color: AppTheme.blueColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  MyProfileView()));
                    },
                  ),
                ],
              ),
            ),
            Container(
                height: SizeConfig.blockSizeVertical * 12,
                margin: EdgeInsets.only(
                    left: SizeConfig.blockSizeHorizontal * 4,
                    right: SizeConfig.blockSizeHorizontal * 4,
                    top: SizeConfig.blockSizeVertical * 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Theme.of(context).cardColor,
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal * 4,
                      ),
                      child: CircleAvatar(
                        radius: 36,
                        backgroundColor: AppTheme.borderColor,
                        child: CircleAvatar(
                          backgroundColor: AppTheme.greyColor,
                          radius: 35,
                          child: SvgPicture.asset('assets/dummyUser.svg'),
                          /*backgroundImage: AssetImage('assets/dummyUser.svg'),*/
                        ),
                      ),
                      color: Colors.transparent,
                    ),
                    Container(
                      child: Text(
                        Strings.playerDetails,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      margin: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal * 4,
                      ),
                    )
                  ],
                )),
            Container(
              margin: EdgeInsets.only(
                  left: SizeConfig.blockSizeHorizontal * 4,
                  right: SizeConfig.blockSizeHorizontal * 4,
                  top: SizeConfig.blockSizeVertical * 2),
              child: Row(
                children: [
                  Text(Strings.Myclubs,
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                  Spacer(),
                  GestureDetector(
                    child: Text(
                      Strings.Setup,
                      style: TextStyle(
                          color: AppTheme.blueColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  MyProfileView()));
                    },
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: ClampingScrollPhysics(),
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.blockSizeHorizontal * 4,
                  vertical: SizeConfig.blockSizeVertical * 2,
                ),
                child: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(
                            right: SizeConfig.blockSizeHorizontal * 5),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5.0,
                                spreadRadius: 0.0,
                                offset: Offset(
                                    2.0, 2.0), // shadow direction: bottom right
                              )
                            ],
                            borderRadius: BorderRadius.circular(16),
                            color: Theme.of(context).cardColor),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/UEFA.png"),
                            Text(Strings.Arsenal)
                          ],
                        ),
                        height: SizeConfig.blockSizeVertical * 13,
                        width: SizeConfig.blockSizeVertical * 13),
                    Container(
                        margin: EdgeInsets.only(
                            right: SizeConfig.blockSizeHorizontal * 5),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5.0,
                                spreadRadius: 0.0,
                                offset: Offset(
                                    2.0, 2.0), // shadow direction: bottom right
                              )
                            ],
                            borderRadius: BorderRadius.circular(16),
                            color: Theme.of(context).cardColor),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/UEFA.png"),
                            Text(Strings.barcelona)
                          ],
                        ),
                        height: SizeConfig.blockSizeVertical * 13,
                        width: SizeConfig.blockSizeVertical * 13),
                    Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5.0,
                                spreadRadius: 0.0,
                                offset: Offset(
                                    2.0, 2.0), // shadow direction: bottom right
                              )
                            ],
                            borderRadius: BorderRadius.circular(16),
                            color: Theme.of(context).cardColor),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/UEFA.png"),
                            Text(Strings.BocaJuniors)
                          ],
                        ),
                        height: SizeConfig.blockSizeVertical * 13,
                        width: SizeConfig.blockSizeVertical * 13),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: SizeConfig.blockSizeHorizontal * 4,
                  right: SizeConfig.blockSizeHorizontal * 4,
                  top: SizeConfig.blockSizeVertical * 1),
              child: Row(
                children: [
                  Text(Strings.Myfavourites,
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                  Spacer(),
                  GestureDetector(
                    child: Text(
                      Strings.Setup,
                      style: TextStyle(
                          color: AppTheme.blueColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  MyProfileView()));
                    },
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: ClampingScrollPhysics(),
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.blockSizeHorizontal * 4,
                  vertical: SizeConfig.blockSizeVertical * 2,
                ),
                child: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(
                            right: SizeConfig.blockSizeHorizontal * 5),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5.0,
                                spreadRadius: 0.0,
                                offset: Offset(
                                    2.0, 2.0), // shadow direction: bottom right
                              )
                            ],
                            borderRadius: BorderRadius.circular(16),
                            color: Theme.of(context).cardColor),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/UEFA.png"),
                            Text(Strings.Arsenal)
                          ],
                        ),
                        height: SizeConfig.blockSizeVertical * 13,
                        width: SizeConfig.blockSizeVertical * 13),
                    Container(
                        margin: EdgeInsets.only(
                            right: SizeConfig.blockSizeHorizontal * 5),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5.0,
                                spreadRadius: 0.0,
                                offset: Offset(
                                    2.0, 2.0), // shadow direction: bottom right
                              )
                            ],
                            borderRadius: BorderRadius.circular(16),
                            color: Theme.of(context).cardColor),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/UEFA.png"),
                            Text(Strings.barcelona)
                          ],
                        ),
                        height: SizeConfig.blockSizeVertical * 13,
                        width: SizeConfig.blockSizeVertical * 13),
                    Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5.0,
                                spreadRadius: 0.0,
                                offset: Offset(
                                    2.0, 2.0), // shadow direction: bottom right
                              )
                            ],
                            borderRadius: BorderRadius.circular(16),
                            color: Theme.of(context).cardColor),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/UEFA.png"),
                            Text(Strings.BocaJuniors)
                          ],
                        ),
                        height: SizeConfig.blockSizeVertical * 13,
                        width: SizeConfig.blockSizeVertical * 13),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
