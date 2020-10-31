import 'dart:io';

import 'package:arena_sports_app/CommonWidgets/Messages.dart';
import 'package:arena_sports_app/CommonWidgets/Strings.dart';
import 'package:arena_sports_app/CommonWidgets/cammonMethods.dart';
import 'package:arena_sports_app/CommonWidgets/sharePreferenceData.dart';
import 'package:arena_sports_app/CreateUser/CreateUserView.dart';
import 'package:arena_sports_app/UserDashboard/NavigationFiles.dart';
import 'package:arena_sports_app/UserDashboard/UserDashboard_View.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../SizeConfig.dart';
import '../theme.dart';
import 'package:arena_sports_app/CommonWidgets/Dialogs.dart';
import 'package:arena_sports_app/Repos.dart';
import 'package:arena_sports_app/SizeConfig.dart';
import 'package:arena_sports_app/theme.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class TermsConditionsView extends StatefulWidget {
  final String userComingFrom;
  final TextEditingController name,
      email,
      emailConfirm,
      password,
      passwordConfirm;
  String country, birthday;
  TermsConditionsView(
      {Key key,
      @required this.userComingFrom,
      this.name,
      this.email,
      this.birthday,
      this.country,
      this.emailConfirm,
      this.password,
      this.passwordConfirm})
      : super(key: key);
  @override
  _TermsConditionsViewState createState() => _TermsConditionsViewState();
}

class _TermsConditionsViewState extends State<TermsConditionsView> {
  final GlobalKey<State> _addLoader = new GlobalKey<State>();

  @override
  void initState() {
    // launchURL("https://arenauniverse.ar/privacy/");
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: SizeConfig.blockSizeVertical * 10,
        bottom: PreferredSize(
            child: Container(
          color: AppTheme.blackColor,
          height: 0.5,
        )),
        centerTitle: true,
        leading: Container(
            margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 7),
            child: GestureDetector(
              child: Container(
                  padding: EdgeInsets.all(1),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 30.0,
                  )),
              onTap: () {
                Navigator.pop(context);
              },
            )),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Container(
          margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 5),
          child: Text(
            Strings.termsText,
            style: TextStyle(
                fontFamily: AppTheme.appFont,
                fontWeight: FontWeight.w600,
                fontSize: 16),
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 5,
                      left: SizeConfig.blockSizeHorizontal * 7),
                  child: Text(
                    Strings.termsTitle,
                    style: TextStyle(
                        fontFamily: AppTheme.appFont,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(

                        margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 7,
                            top: SizeConfig.blockSizeVertical * 3,
                            bottom: SizeConfig.blockSizeVertical * 5),
                        child: WebView(
                          initialUrl: 'https://arenauniverse.ar/privacy/',
                          javascriptMode: JavascriptMode.unrestricted,
                          onPageStarted: (String url) {
                            print('Page started loading: $url');
                          },
                          onPageFinished: (String url) {
                            print('Page finished loading: $url');
                          },
                          gestureNavigationEnabled: true,
                        ),

                        /*Text(
                          Strings.termsConditions,
                          style: TextStyle(
                              fontFamily: AppTheme.appFont, fontSize: 14),
                        ),*/
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          widget.userComingFrom == 'register'
              ? Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                            vertical: SizeConfig.blockSizeVertical * 3,
                          ),
                          child: FlatButton(
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.blockSizeHorizontal * 12,
                                vertical: SizeConfig.blockSizeVertical * 2),
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              Navigator.pop(context);
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                            ),
                            child: Text(Strings.termsReject,
                                style: TextStyle(
                                    color: AppTheme.blackColor,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: AppTheme.appFont)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                            vertical: SizeConfig.blockSizeVertical * 3,
                          ),
                          child: RaisedButton(
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.blockSizeHorizontal * 12,
                                vertical: SizeConfig.blockSizeVertical * 2),
                            onPressed: () {
                              QueryResult getResult;
                              FocusScope.of(context).unfocus();
                              RegisterUser(
                                  context: context, queryResult: getResult);
                            },
                            color: AppTheme.blackColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                            ),
                            child: Text(Strings.termsAccept,
                                style: TextStyle(
                                    color: AppTheme.whiteColor,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: AppTheme.appFont)),
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          top: BorderSide(
                            //                    <--- top side
                            color: AppTheme.toggleColor,
                            width: 5.0,
                          ),
                        )),
                    height: SizeConfig.blockSizeVertical * 15,
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }

  Future RegisterUser({BuildContext context, QueryResult queryResult}) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        Dialogs.showLoadingDialog(context, _addLoader);
        GraphQLClient _client = graphQLConfiguration.clientToQuery();
        QueryResult result = await _client
            .mutate(
          MutationOptions(
              documentNode: gql(
            addMutation.register(
                name: widget.name.text,
                email: widget.email.text,
                birthday: widget.birthday,
                country: widget.country,
                emailConfirm: widget.emailConfirm.text,
                keyword: widget.password.text,
                keywordConfirm: widget.passwordConfirm.text),
          )),
        )
            .then((value) {
          queryResult = value;
          if (!queryResult.hasException) {
            toast(msg: Messages.registerSuccess, context: context);
            SharedPreferenceData().saveRegisteredValue(true);
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => NavigationScreens()),
                (Route<dynamic> route) => false);
            widget.email.clear;
            widget.name.clear;
            widget.password.clear;
            widget.passwordConfirm.clear;
          } else {
            var errorMessage = queryResult.exception.toString().split(':');
            Navigator.of(_addLoader.currentContext, rootNavigator: true).pop();
            toast(context: context, msg: queryResult.exception.toString());
          }
        });
      }
    } on SocketException catch (_) {
      toast(msg: Messages.noConnection, context: context);
    }
  }
}
