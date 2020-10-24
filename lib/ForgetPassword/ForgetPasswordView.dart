import 'dart:io';

import 'package:arena_sports_app/CommonWidgets/Dialogs.dart';
import 'package:arena_sports_app/CommonWidgets/Strings.dart';
import 'package:arena_sports_app/CommonWidgets/cammonMethods.dart';
import 'package:arena_sports_app/CommonWidgets/errorMessages.dart';
import 'package:arena_sports_app/CommonWidgets/textControllers.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../Repos.dart';
import '../SizeConfig.dart';
import '../theme.dart';

class ForgetPasswordView extends StatefulWidget {
  @override
  _ForgetPasswordViewState createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<State> _addLoader = new GlobalKey<State>();
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
                          // Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 20.0,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: SizeConfig.blockSizeHorizontal * 10),
                      child: Text(
                        "Recuperar contraseña",
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
                  child: Divider(
                    color: Color(0xFF000000),
                  ),
                ),
                /* SizedBox(
                  height: SizeConfig.blockSizeVertical * 3,
                ),
                Text(
                  'Recuperar contraseña',
                  style: TextStyle(
                      fontFamily: AppTheme.appFont,
                      fontWeight: FontWeight.w600,
                      fontSize: 24),
                ),*/
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
                        return "Enter Valid Email";
                      }
                    },
                    onFieldSubmitted: (v) {},
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 2,
                            bottom: SizeConfig.blockSizeVertical * 2,
                            left: SizeConfig.blockSizeVertical * 1),
                        labelText: "Email",
                        labelStyle: TextStyle(
                            fontFamily: AppTheme.appFont,
                            fontSize: 15.0,
                            color: AppTheme.blackColor)),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
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
                      onPressed: ()
                      async {
                        QueryResult getResult;
                        FocusScope.of(context).unfocus();
                        if (_formKey.currentState.validate()) {
                          if (validateEmail((Controllers.forgetPassEmail.text))) {
                            forgotPassword(
                                context: context,
                                queryResult: getResult);
                          }
                          else {
                            toast(msg: Messages.wrongEmail, context: context);
                          }
                        }
                      },
                      color: AppTheme.blackColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                      ),
                      child: Text("Recuperar",
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

  Future forgotPassword(
      {BuildContext context,
        QueryResult queryResult}) async {
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
              toast(msg: "Password reset link has been set your email, Please check your mail.", context: context);
            Navigator.pop(context);
          } else {
            Navigator.of(_addLoader.currentContext, rootNavigator: true).pop();
            toast(context: context, msg: queryResult.exception.toString());
          }
        });
      }
    } on SocketException catch (_) {
      toast(msg: "No Internet Connection", context: context);
    }
  }
}
