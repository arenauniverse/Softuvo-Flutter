import 'package:arena_sports_app/CommonWidgets/SizeConfig.dart';
import 'package:arena_sports_app/CommonWidgets/Strings.dart';
import 'package:arena_sports_app/CommonWidgets/bottomSheet.dart';
import 'package:arena_sports_app/screens/scorers/scorersModel.dart';
import 'package:flutter/material.dart';

class ScorersView extends StatefulWidget {
  @override
  _ScorersViewState createState() => _ScorersViewState();
}

class _ScorersViewState extends State<ScorersView> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.blockSizeVertical * 60,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: ShowBottomSheet().crossIcon(context)),
          ),
          Text(Strings.scorers,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
          Container(
            margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
            height: SizeConfig.blockSizeVertical * 50,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    child: Row(
                  children: [
                    Text(getNotificationList[index].id.toString()),
                    getNotificationList[index].image,
                    Text(getNotificationList[index].name),
                    Text(getNotificationList[index].jerseyNumber.toString()),
                  ],
                ));
              },
              itemCount: getNotificationList.length,
            ),
          ),
        ],
      ),
    );
    ;
  }
}

var getNotificationList = [
  ScorersModel(
      image: Image.asset(
        "assets/avatar.png",
        width: SizeConfig.blockSizeVertical * 4,
      ),
      id: 1,
      jerseyNumber: 24,
      name: "L. Messi"),
  ScorersModel(
      image: Image.asset("assets/avatar.png",
          width: SizeConfig.blockSizeVertical * 4),
      id: 2,
      jerseyNumber: 54,
      name: "K. Benzema"),
  ScorersModel(
      image: Image.asset("assets/avatar.png",
          width: SizeConfig.blockSizeVertical * 4),
      id: 3,
      jerseyNumber: 4,
      name: "L. Suarez"),
  ScorersModel(
      image: Image.asset("assets/avatar.png",
          width: SizeConfig.blockSizeVertical * 4),
      id: 4,
      jerseyNumber: 23,
      name: "L. Messi"),
  ScorersModel(
      image: Image.asset("assets/avatar.png",
          width: SizeConfig.blockSizeVertical * 4),
      id: 5,
      jerseyNumber: 2,
      name: "K. Benzema"),
  ScorersModel(
      image: Image.asset("assets/avatar.png",
          width: SizeConfig.blockSizeVertical * 4),
      id: 6,
      jerseyNumber: 8,
      name: "L. Suarez"),
];
