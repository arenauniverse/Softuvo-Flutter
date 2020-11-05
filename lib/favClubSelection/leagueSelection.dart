import 'package:arena_sports_app/CommonWidgets/SizeConfig.dart';
import 'package:arena_sports_app/CommonWidgets/Strings.dart';
import 'package:arena_sports_app/CommonWidgets/dividerWidget.dart';
import 'package:arena_sports_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'bottomNavigationLeague.dart';

List favList = [];

class LeagueSelection extends StatefulWidget {
  LeagueSelection({Key key}) : super(key: key);

  @override
  _LeagueSelectionState createState() => _LeagueSelectionState();
}

class _LeagueSelectionState extends State<LeagueSelection> {
  TextStyle style = TextStyle(fontWeight: FontWeight.w500, fontSize: 14);
  ScrollController scrollController = ScrollController();
  List<ListViewModel> listViewData = [];
  var myCustomForm = OnBoard();

  @override
  void initState() {
    for (int i = 0; i < 12; i++) {
      listViewData.add(ListViewModel(
          title: Strings.ArgentinaLeague,
          isSelected: false,
          image: Image.asset(
            "assets/league.png",
            height: SizeConfig.blockSizeVertical * 6,
          ),
          type: "league"));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Container(
        margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2.3),
        child: CustomScrollView(slivers: [
          SliverAppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            automaticallyImplyLeading: false,
            pinned: true,
            floating: true,
            centerTitle: true,
            title: Text(
              Strings.selectTeam,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            actions: [
              GestureDetector(
                child: Container(
                    child: Text(
                      Strings.skip,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppTheme.blueColor,
                          fontSize: 15),
                    ),
                    margin: EdgeInsets.only(
                        right: SizeConfig.blockSizeHorizontal * 4,
                        top: SizeConfig.blockSizeVertical * 2)),
                onTap: () {
                  favList.clear();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                Column(
                  children: [
/*                    Container(
                      margin: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical * 2,
                      ),
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
                                  horizontal:
                                      SizeConfig.blockSizeHorizontal * 4,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset('assets/todosIcon.svg',
                                        height:
                                            SizeConfig.blockSizeVertical * 2.5),
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
                                  horizontal:
                                      SizeConfig.blockSizeHorizontal * 3.5,
                                ),
                                margin: EdgeInsets.symmetric(
                                  horizontal:
                                      SizeConfig.blockSizeHorizontal * 1,
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
                                        height:
                                            SizeConfig.blockSizeVertical * 2.5),
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
                                  horizontal:
                                      SizeConfig.blockSizeHorizontal * 3.5,
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
                                        height:
                                            SizeConfig.blockSizeVertical * 2.5),
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
                                  horizontal:
                                      SizeConfig.blockSizeHorizontal * 2,
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
                                        height:
                                            SizeConfig.blockSizeVertical * 2.5),
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
                    )*/
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.blockSizeHorizontal * 3,
                      ),
                      child: GridView.count(
                        controller: scrollController,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 3,
                        children: List.generate(listViewData.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              if (listViewData.elementAt(index).isSelected ==
                                  false) {
                                setState(() {
                                  listViewData.elementAt(index).isSelected =
                                      true;
                                  //if (listViewData.elementAt(index).isSelected) {
                                  var selectedData =
                                      listViewData.elementAt(index);
                                  favList.add(selectedData);
                                  //  OnBoard().createState().build(context);
                                  //  }
                                });
                              } else {
                                setState(() {
                                  listViewData.elementAt(index).isSelected =
                                      false;
                                  //if (listViewData.elementAt(index).isSelected = false) {
                                  var selectedData =
                                      listViewData.elementAt(index);
                                  favList.remove(selectedData);
                                  //  favList.removeAt(index);
                                  //  }
                                });
                              }
                            },
                            child: Container(
                                margin: EdgeInsets.symmetric(
                                    vertical:
                                        SizeConfig.blockSizeVertical * 1.5,
                                    horizontal:
                                        SizeConfig.blockSizeHorizontal * 2.5),
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
                                    borderRadius: BorderRadius.circular(16),
                                    color: Theme.of(context).cardColor),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Visibility(
                                      child: Align(
                                        child: Container(
                                          child: SvgPicture.asset(
                                              'assets/Check1.svg'),
                                          margin: EdgeInsets.only(right: 6.0),
                                        ),
                                        alignment: Alignment.topRight,
                                      ),
                                      visible: listViewData
                                          .elementAt(index)
                                          .isSelected,
                                    ),
                                    listViewData[index].image,
                                    Text(
                                      listViewData[index].title,
                                      style: style,
                                    )
                                  ],
                                ),
                                height: SizeConfig.blockSizeVertical * 8,
                                width: SizeConfig.blockSizeVertical * 8),
                          );
                        }),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class ListViewModel {
  final String title;
  final Image image;
  bool isSelected;
  final String type;
  ListViewModel({
    this.type,
    this.title,
    this.isSelected,
    this.image,
  });
}
