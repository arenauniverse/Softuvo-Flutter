import 'dart:io';
import 'package:arena_sports_app/CommonWidgets/Dialogs.dart';
import 'package:arena_sports_app/CommonWidgets/Messages.dart';
import 'package:arena_sports_app/CommonWidgets/SizeConfig.dart';
import 'package:arena_sports_app/CommonWidgets/Strings.dart';
import 'package:arena_sports_app/CommonWidgets/cammonMethods.dart';
import 'package:arena_sports_app/screens/favClubSelection/favModels.dart';
import 'package:arena_sports_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../Repos.dart';
import 'bottomNavigationLeague.dart';

List favList = [];
List<ListViewModel> listViewData = [];

class LeagueSelection extends StatefulWidget {
  LeagueSelection({Key key}) : super(key: key);

  @override
  _LeagueSelectionState createState() => _LeagueSelectionState();
}

class _LeagueSelectionState extends State<LeagueSelection> {
  TextStyle style = TextStyle(fontWeight: FontWeight.w500, fontSize: 14);
  ScrollController scrollController = ScrollController();
  List<ListViewModel> list = new List();

  final GlobalKey<State> _addLoader = new GlobalKey<State>();
  var myCustomForm = OnBoard();

  @override
  void initState() {
    super.initState();
    if (listViewData.length == 0) {
      for (int i = 0; i < 12; i++) {
        listViewData.add(ListViewModel(
            name: Strings.ArgentinaLeague,
            isSelected: false,
            image: Image.asset(
              "assets/league.png",
              height: SizeConfig.blockSizeVertical * 6,
            ),
            type: "league"));
      }
    }

    getLeaguesList();
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
                  listViewData.clear();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                GridView.count(
                  controller: scrollController,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  children: List.generate(list.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        if (listViewData.elementAt(index).isSelected == false) {
                          setState(() {
                            listViewData.elementAt(index).isSelected = true;
                            if (listViewData.elementAt(index).isSelected) {
                              favList.add(listViewData.elementAt(index));
                              //    RestartWidget.restartApp(context);
                            }
                          });
                        } else {
                          setState(() {
                            listViewData.elementAt(index).isSelected = false;
                            favList.remove(listViewData.elementAt(index));
                            //  RestartWidget.restartApp(context);
                          });
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: SizeConfig.blockSizeVertical * 1,
                            vertical: SizeConfig.blockSizeVertical * 1),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 3.0,
                                spreadRadius: 0.0,
                                offset: Offset(0.5, 0.5),
                              )
                            ],
                            borderRadius: BorderRadius.circular(16),
                            color: Theme.of(context).cardColor),
                        child: Stack(
                          children: [
                            Container(
                              child: Visibility(
                                child: Align(
                                  child: Container(
                                    child:
                                        SvgPicture.asset('assets/Check1.svg'),
                                    margin: EdgeInsets.only(right: 6.0),
                                  ),
                                  alignment: Alignment.topRight,
                                ),
                                visible:
                                    listViewData.elementAt(index).isSelected,
                              ),
                              margin: EdgeInsets.only(top: 6),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                listViewData.elementAt(index).image,
                                Container(
                                  child: Text(
                                    list.elementAt(index).name,
                                    textAlign: TextAlign.center,
                                    style: style,
                                  ),
                                  margin: EdgeInsets.only(top: 5),
                                )
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }

  getLeaguesList({QueryResult queryResult}) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        Dialogs.showLoadingDialog(context, _addLoader);
        QueryRepo queryMutation = QueryRepo();
        GraphQLClient _client = graphQLConfiguration.clientToQuery();
        QueryResult result = await _client
            .query(
          QueryOptions(
            documentNode: gql(
              queryMutation.getLeaguesStats(),
            ),
          ),
        )
            .then((value) {
          if (!value.hasException) {
            Navigator.of(_addLoader.currentContext, rootNavigator: true).pop();
            for (int i = 0; i < value.data["getLeaguesStats"].length; i++) {
              setState(() {
                list.add(ListViewModel(
                    name: value.data["getLeaguesStats"][i]["name"],
                    image: Image.asset("assets/league.png"),
                    value: value.data["getLeaguesStats"][i]["value"]));
              });
            }
            ;
          }
        });
      } else {
        var errorMessage = queryResult.exception.toString().split(':');
        Navigator.of(_addLoader.currentContext, rootNavigator: true).pop();
        toast(context: context, msg: queryResult.exception.toString());
      }
    } on SocketException catch (_) {
      toast(msg: Messages.noConnection, context: context);
    }
  }
}
