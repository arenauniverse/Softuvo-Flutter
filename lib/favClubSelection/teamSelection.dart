import 'package:arena_sports_app/CommonWidgets/SizeConfig.dart';
import 'package:arena_sports_app/CommonWidgets/Strings.dart';
import 'package:arena_sports_app/CommonWidgets/textControllers.dart';
import 'package:arena_sports_app/constants/AppColors.dart';
import 'package:arena_sports_app/favClubSelection/leagueSelection.dart';
import 'package:arena_sports_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FavTeamSelection extends StatefulWidget {
  @override
  _FavTeamSelectionState createState() => _FavTeamSelectionState();
}

class _FavTeamSelectionState extends State<FavTeamSelection> {
  TextStyle style = TextStyle(fontWeight: FontWeight.w500, fontSize: 14);
  List<ListViewModel> listViewData = [];
  @override
  void initState() {
    for (int i = 0; i < 12; i++) {
      listViewData.add(ListViewModel(
          name: Strings.Arsenal,
          isSelected: false,
          image: Image.asset(
            "assets/UEFA.png",
            height: SizeConfig.blockSizeVertical * 6,
          ),
          type: "team"));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
              Strings.selectPlayer,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  favList.clear();
                  Navigator.pop(context);
                },
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
              )
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                      margin: EdgeInsets.only(
                          right: SizeConfig.blockSizeHorizontal * 5,
                          left: SizeConfig.blockSizeHorizontal * 5,
                          top: SizeConfig.blockSizeVertical * 1),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(0.5),
                          child: TextField(
                            controller: Controllers.searchTeam,
                            maxLines: 1,
                            decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 0.0),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 18.0, right: 18.0),
                                  child: Icon(
                                    Icons.search,
                                    color: AppTheme.toggleColor,
                                  ),
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Buscar otros equipos",
                                hintStyle:
                                    TextStyle(color: AppTheme.toggleColor),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black,
                                        width: 0.0,
                                        style: BorderStyle.none),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(50.0)))),
                            onChanged: (val) {},
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.whiteColor,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2.0,
                            spreadRadius: 0.0,
                            offset: Offset(
                                0.3, 0.3), // shadow direction: bottom right
                          )
                        ],
                      ),
                      height: SizeConfig.blockSizeVertical * 6,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.blockSizeHorizontal * 3,
                      ),
                      child: GridView.count(
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
                                      listViewData[index].name,
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
