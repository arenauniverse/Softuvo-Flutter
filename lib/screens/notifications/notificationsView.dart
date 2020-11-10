import 'package:arena_sports_app/CommonWidgets/SizeConfig.dart';
import 'package:arena_sports_app/CommonWidgets/Strings.dart';
import 'package:arena_sports_app/CommonWidgets/buttons.dart';
import 'package:arena_sports_app/CommonWidgets/dividerWidget.dart';
import 'package:arena_sports_app/screens/notifications/notificationsModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../theme.dart';

bool status = true;

class NotificationsView extends StatefulWidget {
  @override
  _NotificationsViewState createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  bool toggleStatus = false;
  TextStyle boldStyle = TextStyle(
      fontSize: 18, color: AppTheme.blackColor, fontWeight: FontWeight.w700);
  TextStyle normalStyle = TextStyle(
      fontSize: 15, color: AppTheme.toggleColor, fontWeight: FontWeight.normal);
  TextStyle textStyle = TextStyle(
      fontSize: 15, color: AppTheme.blackColor, fontWeight: FontWeight.w400);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.blockSizeVertical * 80,
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
            child: Text(
              Strings.automaticNotifications,
              style: boldStyle,
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 8),
              child: Text(
                Strings.notificationText,
                style: normalStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    height: SizeConfig.blockSizeVertical * 50,
                    margin: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockSizeVertical * 3,
                        horizontal: SizeConfig.blockSizeVertical * 2),
                    child: ListView.builder(
                      padding: EdgeInsets.all(0),
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Text(
                                    getNotificationList[index]
                                        .notificationTitle,
                                    style: textStyle,
                                  ),
                                  Spacer(),
                                  getNotificationList[index].toggleButton,
                                ],
                              ),
                            ),
                            getNotificationList[index].divider
                          ],
                        );
                      },
                      itemCount: getNotificationList.length,
                    ),
                  ),
                  Button(text: Strings.save, onTap: () {}, context: context)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  var getNotificationList = [
    NotificationModel(
        toggleButton: toggleButton(
          status: status,
          onChanged: (val) {
            status = val;
          },
        ),
        notificationTitle: Strings.allEvents,
        divider: GetDivider()),
    NotificationModel(
        toggleButton: toggleButton(
          status: status,
          onChanged: (val) {
            print("val" + val.toString());
            status = val;
          },
        ),
        notificationTitle: Strings.goals,
        divider: GetDivider()),
    NotificationModel(
        toggleButton: toggleButton(
          status: status,
          onChanged: (val) {
            status = val;
          },
        ),
        notificationTitle: Strings.start_endMatch,
        divider: GetDivider()),
    NotificationModel(
        toggleButton: toggleButton(
          status: status,
          onChanged: (val) {
            status = val;
          },
        ),
        notificationTitle: Strings.data,
        divider: GetDivider()),
    NotificationModel(
        toggleButton: toggleButton(
          status: status,
          onChanged: (val) {
            status = val;
          },
        ),
        notificationTitle: Strings.redCards,
        divider: GetDivider()),
    NotificationModel(
        toggleButton: toggleButton(
          status: status,
          onChanged: (val) {
            status = val;
          },
        ),
        notificationTitle: Strings.Transfers,
        divider: GetDivider()),
  ];
}
