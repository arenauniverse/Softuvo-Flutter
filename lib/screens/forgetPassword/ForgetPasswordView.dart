import 'dart:io';

import 'package:arena_sports_app/CommonWidgets/Dialogs.dart';
import 'package:arena_sports_app/CommonWidgets/SizeConfig.dart';
import 'package:arena_sports_app/CommonWidgets/Strings.dart';
import 'package:arena_sports_app/CommonWidgets/cammonMethods.dart';
import 'package:arena_sports_app/CommonWidgets/dividerWidget.dart';
import 'package:arena_sports_app/CommonWidgets/Messages.dart';
import 'package:arena_sports_app/CommonWidgets/textControllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../Repos.dart';
import '../../theme.dart';

class ForgetPasswordView extends StatefulWidget {
  @override
  _ForgetPasswordViewState createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<State> _addLoader = new GlobalKey<State>();
  bool isFilled = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.only(
            top: SizeConfig.blockSizeVertical * 8.0,
            /*  left: SizeConfig.blockSizeHorizontal * 7,
              right: SizeConfig.blockSizeHorizontal * 7*/
          ),
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: SizeConfig.blockSizeHorizontal * 7,
                          right: SizeConfig.blockSizeHorizontal * 7),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            Controllers.forgetPassEmail.clear();
                            // Get.back();
                          },
                          child: Container(
                            padding: EdgeInsets.all(2),
                            child: SvgPicture.asset(
                              'assets/backArrow.svg',
                              width: 12,
                            ),
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: SizeConfig.blockSizeHorizontal * 10),
                      child: Text(
                        Strings.Recover_password,
                        style: TextStyle(
                            fontFamily: AppTheme.appFont,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                    )
                  ],
                ),
                Container(
                    margin:
                        EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
                    child: GetDivider()),
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 2,
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: SizeConfig.blockSizeHorizontal * 7,
                      right: SizeConfig.blockSizeHorizontal * 7),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    validator: (value) {
                      if (value == null || value == "") {
                        return Messages.validEmail;
                      }
                    },
                    onChanged: (v) {
                      FilledValues();
                    },
                    onFieldSubmitted: (v) {},
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 2,
                            bottom: SizeConfig.blockSizeVertical * 2,
                            left: SizeConfig.blockSizeVertical * 1),
                        labelText: Strings.Email,
                        labelStyle: TextStyle(
                            fontFamily: AppTheme.appFont,
                            fontSize: 15.0,
                            color: AppTheme.blackColor)),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    controller: Controllers.forgetPassEmail,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 2,
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      vertical: SizeConfig.blockSizeVertical * 3,
                    ),
                    child: RaisedButton(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.blockSizeHorizontal * 34,
                          vertical: SizeConfig.blockSizeVertical * 2),
                      onPressed: () async {
                        QueryResult getResult;
                        FocusScope.of(context).unfocus();
                        if (_formKey.currentState.validate()) {
                          if (validateEmail(
                              (Controllers.forgetPassEmail.text))) {
                            forgotPassword(
                                context: context, queryResult: getResult);
                          } else {
                            toast(msg: Messages.wrongEmail, context: context);
                          }
                        }
                      },
                      color:
                          isFilled ? AppTheme.blackColor : AppTheme.toggleColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                      ),
                      child: Text(Strings.Recover,
                          style: TextStyle(
                              color: AppTheme.whiteColor,
                              fontWeight: FontWeight.w500,
                              fontFamily: AppTheme.appFont)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void FilledValues() {
    if (Controllers.forgetPassEmail.text.isNotEmpty) {
      setState(() {
        isFilled = true;
      });
    }
  }

  Future forgotPassword({BuildContext context, QueryResult queryResult}) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        Dialogs.showLoadingDialog(context, _addLoader);
        GraphQLClient _client = graphQLConfiguration.clientToQuery();
        QueryResult result = await _client
            .mutate(
          MutationOptions(
              documentNode: gql(
            addMutation.forgotPassword(
                email: Controllers.forgetPassEmail.text,
                emailConfirm: Controllers.forgetPassEmail.text),
          )),
        )
            .then((value) {
          queryResult = value;
          if (!queryResult.hasException) {
            Navigator.of(_addLoader.currentContext, rootNavigator: true).pop();
            toast(msg: Messages.resetPassword, context: context);
            Navigator.pop(context);
            Controllers.forgetPassEmail.clear();
          } else {
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
