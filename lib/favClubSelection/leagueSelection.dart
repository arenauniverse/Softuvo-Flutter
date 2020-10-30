import 'package:arena_sports_app/CommonWidgets/SizeConfig.dart';
import 'package:arena_sports_app/CommonWidgets/Strings.dart';
import 'package:arena_sports_app/CommonWidgets/dividerWidget.dart';
import 'package:arena_sports_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LeagueSelection extends StatefulWidget {
  @override
  _LeagueSelectionState createState() => _LeagueSelectionState();
}

class _LeagueSelectionState extends State<LeagueSelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          automaticallyImplyLeading: false,
          pinned: true,
          floating: true,
          centerTitle: true,
          title: Text(
            Strings.selectLeagues,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          actions: [
            Container(
                child: Text(
                  Strings.skip,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppTheme.blueColor,
                      fontSize: 15),
                ),
                margin: EdgeInsets.only(
                    right: SizeConfig.blockSizeHorizontal * 4,
                    top: SizeConfig.blockSizeVertical * 2.3))
          ],
        ),
        SliverList(
            delegate: SliverChildListDelegate(
          <Widget>[
            Container(
              height: SizeConfig.blockSizeVertical * 8,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(
                          left: SizeConfig.blockSizeHorizontal * 3,
                        ),
                        height: SizeConfig.blockSizeVertical * 4.5,
                        width: SizeConfig.blockSizeVertical * 12,
                        decoration: BoxDecoration(
                            color: AppTheme.blueColor,
                            borderRadius: BorderRadius.circular(8.0)),
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.blockSizeHorizontal * 4,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/todosIcon.svg',
                                height: SizeConfig.blockSizeVertical * 2.5),
                            Spacer(),
                            Text(
                              Strings.everybody,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: AppTheme.whiteColor),
                            )
                          ],
                        )),
                    Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.blockSizeHorizontal * 3.5,
                        ),
                        margin: EdgeInsets.symmetric(
                          horizontal: SizeConfig.blockSizeHorizontal * 1,
                        ),
                        height: SizeConfig.blockSizeVertical * 4.5,
                        width: SizeConfig.blockSizeVertical * 12,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: AppTheme.blueColor,
                              width: 1.3,
                            )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/football.svg',
                                height: SizeConfig.blockSizeVertical * 2.5),
                            Spacer(),
                            Text(Strings.football,
                                style: TextStyle(
                                  color: AppTheme.blueColor,
                                  fontWeight: FontWeight.w500,
                                ))
                          ],
                        )),
                    Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.blockSizeHorizontal * 3.5,
                        ),
                        height: SizeConfig.blockSizeVertical * 4.5,
                        width: SizeConfig.blockSizeVertical * 12,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: AppTheme.blueColor,
                              width: 1.3,
                            )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/tennis.svg',
                                height: SizeConfig.blockSizeVertical * 2.5),
                            Spacer(),
                            Text(Strings.Tennis,
                                style: TextStyle(
                                  color: AppTheme.blueColor,
                                  fontWeight: FontWeight.w500,
                                ))
                          ],
                        )),
                    Container(
                        margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 1,
                            right: SizeConfig.blockSizeHorizontal * 3),
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.blockSizeHorizontal * 2,
                        ),
                        height: SizeConfig.blockSizeVertical * 4.5,
                        width: SizeConfig.blockSizeVertical * 12,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: AppTheme.blueColor,
                              width: 1.3,
                            )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/basquet.svg',
                                height: SizeConfig.blockSizeVertical * 2.5),
                            Spacer(),
                            Text(Strings.Basketball,
                                style: TextStyle(
                                  color: AppTheme.blueColor,
                                  fontWeight: FontWeight.w500,
                                ))
                          ],
                        ))
                  ],
                ),
              ),
            ),
            Container(
              height : SizeConfig.blockSizeVertical * 80,
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.blockSizeHorizontal * 5),
              child: GridView.count(
                crossAxisCount: 3,
                children: List.generate(12, (index) {
                  return Container(
                    margin: EdgeInsets.symmetric(
                      vertical: SizeConfig.blockSizeVertical * 1,
                        horizontal: SizeConfig.blockSizeHorizontal * 2),
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
                      width: SizeConfig.blockSizeVertical * 13);
                }),
              ),
            )
          ],
        )),
      ]),
    );
  }
}
