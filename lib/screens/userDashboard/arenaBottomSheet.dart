import 'package:arena_sports_app/CommonWidgets/SizeConfig.dart';
import 'package:arena_sports_app/CommonWidgets/Strings.dart';
import 'package:arena_sports_app/screens/clubNews/ClubNews.dart';
import 'package:arena_sports_app/screens/favClubSelection/bottomNavigationLeague.dart';
import 'package:arena_sports_app/screens/myProfile/myProfileView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../theme.dart';

class ArenaBottomSheet extends StatefulWidget {
  @override
  _ArenaBottomSheetState createState() => _ArenaBottomSheetState();
}
class _ArenaBottomSheetState extends State<ArenaBottomSheet> {
  List<SelectClubModel> listViewData = [];
  TextStyle style = TextStyle(fontWeight: FontWeight.w500, fontSize: 12);

  @override
  void initState() {
    for (int i = 0; i < 12; i++) {
      listViewData.add(SelectClubModel(
          title: Strings.barcelona,
          isSelected: false,
          image: Image.asset(
            "assets/Barcelona.png",
            height: SizeConfig.blockSizeVertical * 6,
          ),
          type: "league"));
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.blockSizeVertical * 85,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(30)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(width: 32.0, height: 0.0),
              /*Container(
                margin: EdgeInsets.only(
                  top: SizeConfig.blockSizeVertical * 2,
                ),
                child: SvgPicture.asset('assets/Indicator.svg'),
              ),*/
              GestureDetector(
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
            ],
          ),
          Container(
            width: SizeConfig.blockSizeHorizontal * 100,
            height: SizeConfig.blockSizeVertical * 78,
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 8),
                child: Column(
                  children: [
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
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 16)),
                          Spacer(),
                          GestureDetector(
                            child: Text(
                              Strings.Setup,
                              style: TextStyle(
                                  color: AppTheme.blueColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
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
                        height: SizeConfig.blockSizeVertical * 14,
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
                                  child:
                                      SvgPicture.asset('assets/dummyUser.svg'),
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
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 16)),
                          Spacer(),
                          GestureDetector(
                            child: Text(
                              Strings.Setup,
                              style: TextStyle(
                                  color: AppTheme.blueColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                              /*  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          MyProfileView()));*/
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: SizeConfig.blockSizeVertical * 20,
                      child: ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ClubNewsView()),
                                    );
                                  },
                                  child: Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical:
                                              SizeConfig.blockSizeVertical *
                                                  1.5,
                                          horizontal:
                                              SizeConfig.blockSizeHorizontal *
                                                  2.5),
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 3.0,
                                              spreadRadius: 0.0,
                                              offset: Offset(0.5,
                                                  0.5), // shadow direction: bottom right
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          color: Theme.of(context).cardColor),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "assets/Barcelona.png",
                                            height:
                                                SizeConfig.blockSizeVertical *
                                                    7,
                                          ),
                                          Text(
                                            Strings.Arsenal,
                                            style: style,
                                          )
                                        ],
                                      ),
                                      height: SizeConfig.blockSizeVertical * 14,
                                      width: SizeConfig.blockSizeVertical * 14),
                                ),
                              ],
                            ),
                          );
                        },
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
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
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 16)),
                          Spacer(),
                          GestureDetector(
                            child: Text(
                              Strings.Setup,
                              style: TextStyle(
                                  color: AppTheme.blueColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          RestartWidget(child: OnBoard())));
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: SizeConfig.blockSizeVertical * 20,
                      child: ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    /*     Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              NotificationScreen()),
                                    );*/
                                  },
                                  child: Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical:
                                              SizeConfig.blockSizeVertical *
                                                  1.5,
                                          horizontal:
                                              SizeConfig.blockSizeHorizontal *
                                                  2.5),
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 3.0,
                                              spreadRadius: 0.0,
                                              offset: Offset(0.5,
                                                  0.5), // shadow direction: bottom right
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          color: Theme.of(context).cardColor),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "assets/Barcelona.png",
                                            height:
                                                SizeConfig.blockSizeVertical *
                                                    7,
                                          ),
                                          Text(
                                            Strings.Arsenal,
                                            style: style,
                                          )
                                        ],
                                      ),
                                      height: SizeConfig.blockSizeVertical * 14,
                                      width: SizeConfig.blockSizeVertical * 14),
                                ),
                              ],
                            ),
                          );
                        },
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SelectClubModel {
  final String title;
  final Image image;
  bool isSelected;
  final String type;
  SelectClubModel({
    this.type,
    this.title,
    this.isSelected,
    this.image,
  });
}
