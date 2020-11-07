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
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(30)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
/*          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(
                  top: SizeConfig.blockSizeVertical * 2,
                  right: SizeConfig.blockSizeVertical * 2,
                  left: SizeConfig.blockSizeVertical * 2),
              child: SvgPicture.asset('assets/Indicator.svg'),
            ),
          )*/
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top:  SizeConfig.blockSizeVertical * 4,left: 16, right: 16),
                  child: Text(
                    Strings.selectSport,
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
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
                        right: SizeConfig.blockSizeVertical * 2, top: 8),
                    child: SvgPicture.asset('assets/crossIcon.svg'),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(SizeConfig.blockSizeVertical * 2),
            height: SizeConfig.blockSizeVertical * 20,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: sportsList.length,
              itemBuilder: (context, index) {
                final item = sportsList[index];
                return Container(
                  height: 120,
                  width: 120,
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
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) =>
                                      CircularProgressIndicator(
                                          value: downloadProgress.progress),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
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
                              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 11),
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
