import 'package:arena_sports_app/CommonWidgets/Strings.dart';
import 'package:arena_sports_app/CommonWidgets/dividerWidget.dart';
import 'package:flutter/material.dart';
import 'package:arena_sports_app/LoginSignUpListing/LoginSgnupListingView.dart';
import 'package:arena_sports_app/SizeConfig.dart';
import 'package:arena_sports_app/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewsDetailsView extends StatefulWidget {
  @override
  _NewsDetailsViewState createState() => _NewsDetailsViewState();
}

class _NewsDetailsViewState extends State<NewsDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    left: SizeConfig.blockSizeHorizontal * 4,
                    right: SizeConfig.blockSizeHorizontal * 4),
                color: Colors.white,
                height: SizeConfig.blockSizeVertical * 13.9,
                child: Container(
                    margin: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical * 8,
                        bottom: SizeConfig.blockSizeVertical * 2),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.all(2),
                            child: SvgPicture.asset(
                              'assets/backArrow.svg',
                              width: 12,
                            ),
                          ),
                        ),
                        Spacer(),
                        Text(
                          Strings.espn,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Spacer(),
                        SvgPicture.asset(
                            'assets/signOut.svg'), /*Icon(
                                Icons.search_rounded,
                                color: AppTheme.blackColor,
                              ),*/
                      ],
                    )),
              ),
              Container(child: GetDivider()),
            ],
          ),
          Container(
            margin: EdgeInsets.only(
              top: SizeConfig.blockSizeVertical * 15,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: Image.asset('assets/newsDetailsIcon.png'),
                    margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 2,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 2,
                      left: SizeConfig.blockSizeHorizontal * 3,
                      right: SizeConfig.blockSizeHorizontal * 3,
                    ),
                    child: Text(
                      Strings.newsTitle,
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 2,
                      left: SizeConfig.blockSizeHorizontal * 3,
                      right: SizeConfig.blockSizeHorizontal * 3,
                    ),
                    child: Row(
                      children: [
                        Container(
                          child: Icon(
                            Icons.supervised_user_circle,
                            color: AppTheme.greyColor,
                            size: 60,
                          ),
                        ),
                        Container(
                          child: Text(
                            Strings.newsDesc,
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 3,
                          ),
                        ),
                        Spacer(),
                        Text(
                          Strings.newstime,
                          style: TextStyle(color: AppTheme.greyColor),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Image.asset(
                      'assets/Image.png',
                      fit: BoxFit.fitWidth,
                      width: SizeConfig.blockSizeHorizontal * 120,
                    ),
                    margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 2,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 2,
                      bottom: SizeConfig.blockSizeVertical * 2,
                      left: SizeConfig.blockSizeHorizontal * 3,
                      right: SizeConfig.blockSizeHorizontal * 3,
                    ),
                    child: Text(
                      Strings.newsDetails,
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
