import 'dart:io';

import 'package:arena_sports_app/CommonWidgets/Dialogs.dart';
import 'package:arena_sports_app/CommonWidgets/SizeConfig.dart';
import 'package:arena_sports_app/CommonWidgets/Strings.dart';
import 'package:arena_sports_app/CommonWidgets/cammonMethods.dart';
import 'package:arena_sports_app/CommonWidgets/Messages.dart';
import 'package:arena_sports_app/CommonWidgets/textControllers.dart';
import 'package:arena_sports_app/screens/forgetPassword/ForgetPasswordView.dart';
import 'package:arena_sports_app/screens/register/Register_View.dart';
import 'package:arena_sports_app/screens/userDashboard/NavigationFiles.dart';
import 'package:arena_sports_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../Repos.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<State> _addLoader = new GlobalKey<State>();
  bool passwordVisible = true;
  bool _autoValidate = false;
  bool isFilled = false;
  var emailFocus = FocusNode();
  var passwordFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: SizeConfig.blockSizeVertical * 8.0,
                    left: SizeConfig.blockSizeHorizontal * 6,
                    right: SizeConfig.blockSizeHorizontal * 6),
                child: GestureDetector(
                    onTap: () {
                      Controllers.loginEmail.clear();
                      Controllers.loginPassword.clear();
                      Navigator.pop(context);

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
                    top: SizeConfig.blockSizeVertical * 2,
                    left: SizeConfig.blockSizeHorizontal * 8,
                    right: SizeConfig.blockSizeHorizontal * 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                        LengthLimitingTextInputFormatter(35),
                      ],
                      onChanged: (v) {
                        FilledValues();
                      },
                      controller: Controllers.loginEmail,
                      cursorColor: Colors.black,
                      validator: (value) {
                        if (value == null || value == "") {
                          return Messages.validEmail;
                        }
                      },
                      onFieldSubmitted: (v) {
                        FocusScope.of(context).requestFocus(emailFocus);
                      },
                      decoration: InputDecoration(
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 1.0),
                          ),
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
                      focusNode: emailFocus,
                      obscureText: passwordVisible,
                      controller: Controllers.loginPassword,
                      cursorColor: AppTheme.blackColor,
                      validator: (value) {
                        if (value == null || value == "") {
                          return Messages.validPassword;
                        }
                      },
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(20),
                      ],
                      onChanged: (v) {
                        FilledValues();
                      },
                      onFieldSubmitted: (v) {
                        emailFocus.unfocus();
                        FocusScope.of(context).requestFocus(passwordFocus);
                      },
                      decoration: InputDecoration(
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 1.0),
                          ),
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
                            horizontal: SizeConfig.blockSizeHorizontal * 33,
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
                                    context: context,
                                    msg: Messages.shortPassword);
                              }
                            } else {
                              toast(context: context, msg: Messages.wrongEmail);
                            }
                          }
                        },
                        color: isFilled
                            ? AppTheme.blackColor
                            : AppTheme.toggleColor,
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
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void FilledValues() {
    if (Controllers.loginPassword.text.isNotEmpty &&
        Controllers.loginEmail.text.isNotEmpty) {
      setState(() {
        isFilled = true;
      });
    }
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
