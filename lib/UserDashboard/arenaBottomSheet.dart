import 'package:arena_sports_app/CommonWidgets/SizeConfig.dart';
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
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.bottomSheetBackgroundColor,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        ),
        height: SizeConfig.blockSizeVertical * 60,
        width: SizeConfig.blockSizeHorizontal * 100,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: SizeConfig.blockSizeVertical * 2,
                  right: SizeConfig.blockSizeHorizontal * 5),
              child: Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    child: Stack(
                      children: [
                        SvgPicture.asset('assets/closeIcon.svg'),
                        Positioned(
                          top: 5.0,
                          left: 8.0,
                          bottom: 5.0,
                          child: GestureDetector(
                            child: SvgPicture.asset(
                              'assets/cross.svg',
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
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
                  top: SizeConfig.blockSizeVertical * 3,
                  right: SizeConfig.blockSizeHorizontal * 4),
              child: Row(
                children: [
                  Text("Mi Perfil",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                  Spacer(),
                  GestureDetector(
                    child: Text(
                      "Configurar",
                      style: TextStyle(
                          color: AppTheme.blueColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                    onTap: () {
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
                    top: SizeConfig.blockSizeVertical * 3,
                    right: SizeConfig.blockSizeHorizontal * 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: AppTheme.whiteColor,
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
                        "Fernando Martinez \n\n12/01/1954",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      margin: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal * 4,
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
