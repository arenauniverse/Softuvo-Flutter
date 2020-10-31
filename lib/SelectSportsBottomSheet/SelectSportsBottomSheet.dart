import 'package:arena_sports_app/CommonWidgets/SizeConfig.dart';
import 'package:arena_sports_app/CommonWidgets/Strings.dart';
import 'package:arena_sports_app/SelectSportsBottomSheet/Sports.dart';
import 'package:arena_sports_app/favClubSelection/leagueSelection.dart';
import 'package:arena_sports_app/myProfile/myProfileView.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme.dart';

class SelectSportsBottomSheet extends StatefulWidget {
  @override
  _SelectSportsBottomSheetState createState() =>
      _SelectSportsBottomSheetState();
}

class _SelectSportsBottomSheetState extends State<SelectSportsBottomSheet> {
  TextStyle style = TextStyle(fontWeight: FontWeight.w500);
  List<Sports> sportsList = new List();

  @override
  void initState() {
    sportsList.add(Sports("http://via.placeholder.com/50x50", "Todos", 2));
    sportsList.add(Sports("http://via.placeholder.com/50x50", "Futbol", 3));
    sportsList.add(Sports("http://via.placeholder.com/50x50", "Tennis", 4));
    sportsList.add(Sports("http://via.placeholder.com/50x50", "BasquetBol", 4));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.blockSizeVertical * 45,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(30)),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(
                  top: SizeConfig.blockSizeVertical * 2,
                  right: SizeConfig.blockSizeVertical * 2,
                  left: SizeConfig.blockSizeVertical * 2),
              child: SvgPicture.asset('assets/Indicator.svg'),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    Strings.selectSport,
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        right: SizeConfig.blockSizeVertical * 2),
                    child: SvgPicture.asset('assets/crossIcon.svg'),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.0),
            height: SizeConfig.blockSizeVertical*20,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              // Let the ListView know how many items it needs to build.
              itemCount: sportsList.length,
              // Provide a builder function. This is where the magic happens.
              // Convert each item into a widget based on the type of item it is.
              itemBuilder: (context, index) {
                final item = sportsList[index];
                return Container(
                  height: 120,
                  width:  120,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),

                    ),
                    child: Column(
                      children: [
                      Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        margin: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 2,
                            right: SizeConfig.blockSizeVertical * 2,
                            left: SizeConfig.blockSizeVertical * 2),
                        child: CachedNetworkImage(
                          imageUrl: item.imageUrl,
                          progressIndicatorBuilder: (context, url, downloadProgress) =>
                              CircularProgressIndicator(value: downloadProgress.progress),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                      ),
                    ),

                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            margin: EdgeInsets.only(
                                top: SizeConfig.blockSizeVertical * 2,
                                right: SizeConfig.blockSizeVertical * 2,
                                left: SizeConfig.blockSizeVertical * 2),
                            child: Text(
                              item.sportsName,
                              textScaleFactor: 1.2,
                            ),
                          ),
                        ),
                  ],
                    ),
                  ),
                );

              },
            ),
          ),
        ],
      ),
    );
  }
}
