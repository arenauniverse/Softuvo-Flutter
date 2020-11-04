import 'package:arena_sports_app/CommonWidgets/Strings.dart';
import 'package:arena_sports_app/SizeConfig.dart';
import 'package:arena_sports_app/Terms&Conditions/Terms&Conditions_View.dart';
import 'package:arena_sports_app/UserDashboard/UserDashboard_View.dart';
import 'package:arena_sports_app/favClubSelection/playerSelection.dart';
import 'package:arena_sports_app/favClubSelection/teamSelection.dart';
import 'package:arena_sports_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'leagueSelection.dart';

class OnBoard extends StatefulWidget {
  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  bool getBack = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                  height: SizeConfig.blockSizeVertical * 85,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                        if (_currentPage == 1) {
                          getBack = true;
                        }
                      });
                    },
                    children: <Widget>[
                      LeagueSelection(),
                      FavTeamSelection(),
                      FavPlayerselection(),
                    ],
                  )),
              Container(
                child: Column(
                  children: [
                    // LinearProgressIndicator(
                    //   value: 50,
                    //   backgroundColor: Colors.red,
                    // ),
                    Container(
                      margin: EdgeInsets.only(
                          top: SizeConfig.blockSizeHorizontal * 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Visibility(
                            child: GestureDetector(
                              onTap: () {
                                _pageController.previousPage(
                                    duration: Duration(microseconds: 300),
                                    curve: Curves.easeIn);
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                    left: SizeConfig.blockSizeHorizontal * 3),
                                child: Text(Strings.back,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: AppTheme.toggleColor,
                                        fontSize: 14)),
                              ),
                            ),
                            visible: getBack,
                          ),
                          Spacer(),
                          Container(
                            margin: EdgeInsets.only(
                                right: SizeConfig.blockSizeVertical * 12),
                            child: Text("${_currentPage + 1} de ${_numPages}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16)),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (_currentPage < 2) {
                                _pageController.nextPage(
                                    duration: Duration(microseconds: 300),
                                    curve: Curves.easeIn);
                              } else {
                                Navigator.pop(context);
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  right: SizeConfig.blockSizeHorizontal * 3),
                              child: Text(
                                Strings.next,
                                style: TextStyle(
                                    color: AppTheme.blueColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: SizeConfig.blockSizeVertical * 6,
                      margin: EdgeInsets.only(
                          top: SizeConfig.blockSizeHorizontal * 3),
                      child: ListView.builder(
                        itemCount: favList.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext cxt, int i) {
                          return Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal:
                                      SizeConfig.blockSizeHorizontal * 1.5),
                              child: favList.length == 0 ||
                                      favList.length == null
                                  ? SvgPicture.asset(
                                      "assets/selectTeam.svg",
                                      height: SizeConfig.blockSizeVertical * 8,
                                    )
                                  : favList[i].image);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getButton(_pageController) {
    return FlatButton(
      onPressed: () {
        _pageController.nextPage(
            duration: Duration(microseconds: 300), curve: Curves.easeIn);
      },
      child: Text(
        'Next',
        style: TextStyle(color: Colors.white, fontSize: 24.0),
      ),
    );
  }

  Widget indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(microseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
