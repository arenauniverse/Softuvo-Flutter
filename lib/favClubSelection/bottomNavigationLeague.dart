import 'package:arena_sports_app/CommonWidgets/Strings.dart';
import 'package:arena_sports_app/SizeConfig.dart';
import 'package:arena_sports_app/Terms&Conditions/Terms&Conditions_View.dart';
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
  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? indicator(true) : indicator(false));
    }
    return list;
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
                    LinearProgressIndicator(
                      value: 50,
                      backgroundColor: AppTheme.blueColor,
                    ),
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
                              _pageController.nextPage(
                                  duration: Duration(microseconds: 300),
                                  curve: Curves.easeIn);
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
                        itemCount: 10,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext cxt, int i) {
                          return Container(
                              child: SvgPicture.asset(
                            "assets/selectTeam.svg",
                            height: SizeConfig.blockSizeVertical * 8,
                          ));
                        },
                      ),
                    )
                  ],
                ),
              ),
              /* Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildPageIndicator(),
              ),*/
              // _currentPage == _numPages - 1
              //     ? Expanded(
              //         child: Align(
              //           child: Padding(
              //             padding: EdgeInsets.symmetric(horizontal: 20.0),
              //             child: Row(
              //               mainAxisAlignment:
              //                   MainAxisAlignment.spaceBetween,
              //               children: <Widget>[
              //                 Padding(
              //                   padding:
              //                       EdgeInsets.symmetric(horizontal: 15.0),
              //                   child: Text(
              //                     'Skip',
              //                     style: TextStyle(
              //                         color: Colors.white, fontSize: 24.0),
              //                   ),
              //                 ),
              //                 getButton(_pageController),
              //               ],
              //             ),
              //           ),
              //         ),
              //       )
              //     : Text(''),
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
