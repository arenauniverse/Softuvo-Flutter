import 'dart:io';

import 'package:arena_sports_app/CommonWidgets/Dialogs.dart';
import 'package:arena_sports_app/CommonWidgets/Strings.dart';
import 'package:arena_sports_app/CommonWidgets/buttons.dart';
import 'package:arena_sports_app/CommonWidgets/cammonMethods.dart';
import 'package:arena_sports_app/CommonWidgets/errorMessages.dart';
import 'package:arena_sports_app/CommonWidgets/textControllers.dart';
import 'package:arena_sports_app/ForgetPassword/ForgetPasswordView.dart';
import 'package:arena_sports_app/Register/Register_View.dart';
import 'package:arena_sports_app/SizeConfig.dart';
import 'package:arena_sports_app/UserDashboard/NavigationFiles.dart';
import 'package:arena_sports_app/UserDashboard/UserDashboard_View.dart';
import 'package:arena_sports_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../Repos.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<State> _addLoader = new GlobalKey<State>();
  bool passwordVisible = true;
  bool _autoValidate = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.only(
              top: SizeConfig.blockSizeVertical * 8.0,
              left: SizeConfig.blockSizeHorizontal * 7,
              right: SizeConfig.blockSizeHorizontal * 7),
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    Controllers.loginEmail.clear();
                    Controllers.loginPassword.clear();
                    // Get.back();
                  },
                  child: Container(
                    padding: EdgeInsets.all(2),
                    child: SvgPicture.asset(
                      'assets/backArrow.svg',
                      width: 12,
                    ),
                  )
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 3,
                ),
                Text(
                  Strings.loginText,
                  style: TextStyle(
                      fontFamily: AppTheme.appFont,
                      fontWeight: FontWeight.w600,
                      fontSize: 24),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 2,
                ),
                Row(
                  children: [
                    Text(
                      Strings.notRegisted,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    GestureDetector(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterView()),
                        );
                      },
                      child: Text(
                        Strings.createUser,
                        style: TextStyle(
                            color: AppTheme.blueColor,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 2,
                ),
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(30),
                  ],
                  controller: Controllers.loginEmail,
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
                      labelText: Strings.Email,
                      labelStyle: TextStyle(
                          fontFamily: AppTheme.appFont,
                          fontSize: 15.0,
                          color: AppTheme.blackColor)),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
                TextFormField(
                  obscureText: passwordVisible,
                  controller: Controllers.loginPassword,
                  cursorColor: AppTheme.blackColor,
                  validator: (value) {
                    if (value == null || value == "") {
                      return "Enter Valid Contraseña";
                    }
                  },
                  decoration: InputDecoration(
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            passwordVisible = !passwordVisible;
                          });
                        },
                        child: Icon(
                          passwordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: AppTheme.blackColor,
                        ),
                      ),
                      contentPadding: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 2,
                          bottom: SizeConfig.blockSizeVertical * 2,
                          left: SizeConfig.blockSizeVertical * 1),
                      labelText: Strings.password,
                      labelStyle: TextStyle(
                          fontSize: 15.0,
                          fontFamily: AppTheme.appFont,
                          color: AppTheme.blackColor)),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 2,
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: SizeConfig.blockSizeVertical * 3,
                  ),
                  child: RaisedButton(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.blockSizeHorizontal * 34,
                        vertical: SizeConfig.blockSizeVertical * 2),
                    onPressed: () {
                      QueryResult queryResult;
                      FocusScope.of(context).unfocus();
                      if (_formKey.currentState.validate()) {
                        if (validateEmail(
                          Controllers.loginEmail.text,
                        )) {
                          if (Controllers.loginPassword.text.length >= 8) {
                            LoginUser(
                                context: context, queryResult: queryResult);
                          } else {
                            toast(
                                context: context, msg: Messages.shortPassword);
                          }
                        } else {
                          toast(context: context, msg: Messages.wrongEmail);
                        }
                      }
                    },
                    color: AppTheme.blackColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                    ),
                    child: Text(Strings.loginButtonText,
                        style: TextStyle(
                            color: AppTheme.whiteColor,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppTheme.appFont)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgetPasswordView()),
                    );
                  },
                  child: Center(
                    child: Text(
                      Strings.registerUser,
                      style: TextStyle(
                          fontSize: 14.0,
                          color: AppTheme.blueColor,
                          fontWeight: FontWeight.w600),
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

  Future LoginUser({BuildContext context, QueryResult queryResult}) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        Dialogs.showLoadingDialog(context, _addLoader);
        GraphQLClient _client = graphQLConfiguration.clientToQuery();
        QueryResult result = await _client
            .mutate(
          MutationOptions(
              documentNode: gql(
            addMutation.login(
              email: Controllers.loginEmail.text,
              keyword: Controllers.loginPassword.text,
            ),
          )),
        )
            .then((value) {
          queryResult = value;
          if (!queryResult.hasException) {
            Navigator.of(_addLoader.currentContext, rootNavigator: true).pop();
            toast(context: context, msg: Messages.loginSuccess);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NavigationScreens()),
            );
              Controllers.loginEmail.clear();
              Controllers.loginPassword.clear();

          } else {
            print("dbas" + queryResult.exception.toString());
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
