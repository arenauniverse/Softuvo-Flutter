import 'dart:io';
import 'package:arena_sports_app/CommonWidgets/DatePicker.dart';
import 'package:arena_sports_app/CommonWidgets/Dialogs.dart';
import 'package:arena_sports_app/CommonWidgets/Strings.dart';
import 'package:arena_sports_app/CommonWidgets/cammonMethods.dart';
import 'package:arena_sports_app/CommonWidgets/Messages.dart';
import 'package:arena_sports_app/CommonWidgets/textControllers.dart';
import 'package:arena_sports_app/CreateUser/CreateUserView.dart';
import 'package:arena_sports_app/LogIn/Login_View.dart';
import 'package:arena_sports_app/Repos.dart';
import 'package:arena_sports_app/SizeConfig.dart';
import 'package:arena_sports_app/Terms&Conditions/Terms&Conditions_View.dart';
import 'package:arena_sports_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';

class RegisterView extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<State> _addLoader = new GlobalKey<State>();
  var setDateTime, dateTimeFormat;
  bool passwordVisible = true;
  bool repeatPasswordVisible = true;
  bool isFilled = false;
  var nameFocus = FocusNode();
  var emailFocus = FocusNode();
  var passwordFocus = FocusNode();
  var repeatPasswordFocus = FocusNode();
  ListItem _selectedItem;
  Country _selected;
  /* focus.unfocus();
  FocusScope.of(context).requestFocus(cvvFocusNode);*/
  void initState() {
    super.initState();
    _selected = Country.US;
    Controllers.dob.text = DateFormat("dd-MM-yyyy").format(DateTime.now());
    dateTimeFormat = DateFormat("dd/MM/yyyy").format(DateTime.now());
  }

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem,
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.whiteColor,
          elevation: 0.0,
          title: Text(""),
          /*     leading: Container(
              margin: EdgeInsets.only(
                  top: SizeConfig.blockSizeVertical * 2.0,
                  left: SizeConfig.blockSizeHorizontal * 8,
                  right: SizeConfig.blockSizeHorizontal * 8),
              padding: EdgeInsets.all(2),
              child: Icon(
                Icons.arrow_back_ios,
                size: 28,
              )),*/
        ),
        resizeToAvoidBottomInset: true,
        body: Container(
          margin: EdgeInsets.only(
              left: SizeConfig.blockSizeHorizontal * 8,
              right: SizeConfig.blockSizeHorizontal * 8),
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin:
                      EdgeInsets.only(top: SizeConfig.blockSizeVertical * 3),
                  child: Text(
                    Strings.createUser,
                    style: TextStyle(
                        fontFamily: AppTheme.appFont,
                        fontWeight: FontWeight.w600,
                        fontSize: 24),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 2,
                ),
                Row(
                  children: [
                    Text(
                      Strings.alreadyAccount,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    GestureDetector(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginView()),
                        );
                      },
                      child: Text(
                        Strings.login,
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
                Container(
                  margin:
                      EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 1),
                  child: TextFormField(
                    focusNode: nameFocus,
                    inputFormatters: <TextInputFormatter>[
                      LengthLimitingTextInputFormatter(12),
                    ],
                    controller: Controllers.name,
                    cursorColor: Colors.black,
                    onChanged: (v) {
                      FilledValues();
                    },
                    validator: (value) {
                      if (value == null || value == "") {
                        return Messages.validFullName;
                      }
                    },
                    onFieldSubmitted: (v) {
                      FocusScope.of(context).requestFocus(nameFocus);
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 2,
                          bottom: SizeConfig.blockSizeVertical * 2,
                          left: SizeConfig.blockSizeVertical * 1),
                      labelText: Strings.name,
                      labelStyle: TextStyle(
                          fontFamily: AppTheme.appFont,
                          fontSize: 15.0,
                          color: AppTheme.blackColor),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1.0),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 1),
                  child: TextFormField(
                    onFieldSubmitted: (v) {
                      nameFocus.unfocus();
                      FocusScope.of(context).requestFocus(emailFocus);
                    },
                    inputFormatters: <TextInputFormatter>[
                      LengthLimitingTextInputFormatter(30),
                    ],
                    onChanged: (v) {
                      FilledValues();
                    },
                    focusNode: emailFocus,
                    controller: Controllers.registerEmail,
                    cursorColor: AppTheme.blackColor,
                    decoration: InputDecoration(
                        focusedBorder: const UnderlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        contentPadding: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 2,
                            bottom: SizeConfig.blockSizeVertical * 2,
                            left: SizeConfig.blockSizeVertical * 1),
                        labelText: Strings.Email,
                        labelStyle: TextStyle(
                            fontSize: 15.0,
                            fontFamily: AppTheme.appFont,
                            color: AppTheme.blackColor)),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value == "") {
                        return Messages.validEmail;
                      }
                    },
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 1),
                  child: Theme(
                    data: ThemeData(primarySwatch: Colors.grey),
                    child: DatePicker(
                      Strings.date_of_birth,
                      (dateTime) {
                        setDateTime = dateTime;
                        Controllers.dob.text =
                            DateFormat("dd-MM-yyyy").format(setDateTime);
                        dateTimeFormat =
                            DateFormat("dd/MM/yyyy").format(setDateTime);
                      },
                      initialDate: setDateTime,
                      controller: Controllers.dob,
                      lastDate: DateTime.now(),
                    ),
                  ),
                ),
/*                TextFormField(
                  controller: Controllers.dob,
                  cursorColor: AppTheme.blackColor,
                  validator: (value) {
                    if (value == null || value == "") {
                      return "Enter Valid Nacimineto";
                    }
                  },
                  //  onFieldSubmitted: (v) {},
                  decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.date_range_outlined,
                        color: AppTheme.blackColor,
                      ),
                      */ /*SvgPicture.asset(
                        'assets/dateTimeIcon.svg',
                        height: 20.0,
                      ),*/ /*
                      contentPadding: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 2,
                          bottom: SizeConfig.blockSizeVertical * 2,
                          left: SizeConfig.blockSizeVertical * 1),
                      labelText: Strings.dob,
                      labelStyle: TextStyle(
                          fontSize: 15.0,
                          fontFamily: AppTheme.appFont,
                          color: AppTheme.blackColor)),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                )*/
                Container(
                  padding: EdgeInsets.only(
                      left: SizeConfig.blockSizeHorizontal * 2,
                      right: SizeConfig.blockSizeHorizontal * 2),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: AppTheme.greyColor,
                    width: 1,
                  ))),
                  height: SizeConfig.blockSizeVertical * 5,
                  width: SizeConfig.blockSizeVertical * 100,
                  margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 5,
                      bottom: SizeConfig.blockSizeVertical * 2),
                  child: CountryPicker(
                    showCurrency: false,
                    showDialingCode: false,
                    showName: true,
                    showFlag: true,
                    onChanged: (Country country) {
                      setState(() {
                        _selected = country;
                      });
                    },
                    selectedCountry: _selected,
                  ),
                ),
/*                AbsorbPointer(
                  child: TextFormField(
                    controller: Controllers.parent,
                    cursorColor: AppTheme.blackColor,
                    validator: (value) {
                      if (value == null || value == "") {
                        return "Select Pais";
                      }
                    },
                    // onFieldSubmitted: (v) {},
                    decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: AppTheme.blackColor,
                        ),
                        contentPadding: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 2,
                            bottom: SizeConfig.blockSizeVertical * 2,
                            left: SizeConfig.blockSizeVertical * 1),
                        labelText: Strings.parents,
                        labelStyle: TextStyle(
                            fontSize: 15.0,
                            fontFamily: AppTheme.appFont,
                            color: AppTheme.blackColor)),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                  ),
                )*/
                Container(
                  margin:
                      EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 1),
                  child: TextFormField(
                    obscureText: passwordVisible,
                    controller: Controllers.registerPassword,
                    validator: (value) {
                      if (value == null || value == "") {
                        return Messages.validPassword;
                      }
                    },
                    focusNode: passwordFocus,
                    inputFormatters: <TextInputFormatter>[
                      LengthLimitingTextInputFormatter(20),
                    ],
                    onChanged: (v) {
                      FilledValues();
                    },
                    onFieldSubmitted: (v) {
                      emailFocus.unfocus();
                      FocusScope.of(context).requestFocus(passwordFocus);
                    },
                    cursorColor: AppTheme.blackColor,
                    decoration: InputDecoration(
                        focusedBorder: const UnderlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.grey, width: 1.0),
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
                            bottom: SizeConfig.blockSizeVertical * 1,
                            left: SizeConfig.blockSizeVertical * 1),
                        labelText: Strings.password,
                        labelStyle: TextStyle(
                            fontSize: 15.0,
                            fontFamily: AppTheme.appFont,
                            color: AppTheme.blackColor)),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 1),
                  child: TextFormField(
                    obscureText: repeatPasswordVisible,
                    controller: Controllers.repeatPassword,
                    validator: (value) {
                      if (value == null || value == "") {
                        return Messages.validPassword;
                      }
                    },
                    focusNode: repeatPasswordFocus,
                    inputFormatters: <TextInputFormatter>[
                      LengthLimitingTextInputFormatter(20),
                    ],
                    onChanged: (v) {
                      FilledValues();
                    },
                    onFieldSubmitted: (v) {
                      passwordFocus.unfocus();
                      FocusScope.of(context).requestFocus(repeatPasswordFocus);
                    },
                    cursorColor: AppTheme.blackColor,
                    decoration: InputDecoration(
                        focusedBorder: const UnderlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              repeatPasswordVisible = !repeatPasswordVisible;
                            });
                          },
                          child: Icon(
                            repeatPasswordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: AppTheme.blackColor,
                          ),
                        ),
                        contentPadding: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 2,
                            bottom: SizeConfig.blockSizeVertical * 2,
                            left: SizeConfig.blockSizeVertical * 1),
                        labelText: Strings.repeatPassword,
                        labelStyle: TextStyle(
                            fontSize: 15.0,
                            fontFamily: AppTheme.appFont,
                            color: AppTheme.blackColor)),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: SizeConfig.blockSizeVertical * 4,
                  ),
                  child: RaisedButton(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.blockSizeHorizontal * 32,
                        vertical: SizeConfig.blockSizeVertical * 2),
                    onPressed: () async {
                      QueryResult getResult;
                      FocusScope.of(context).unfocus();
                      if (_formKey.currentState.validate()) {
                        if (Controllers.name.text.isNotEmpty &&
                            Controllers.name.text.length >= 6) {
                          if (validateEmail((Controllers.registerEmail.text))) {
                            if (Controllers.dob.text.isNotEmpty) {
                              if (Controllers
                                      .registerPassword.text.isNotEmpty &&
                                  Controllers.registerPassword.text.length >=
                                      8) {
                                if (Controllers.repeatPassword.text ==
                                    Controllers.registerPassword.text) {
                                  /*   RegisterUser(
                                      context: context,
                                      queryResult: getResult,
                                      dateTimeFormat: dateTimeFormat);*/
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              TermsConditionsView(
                                                  userComingFrom: 'register',
                                                  name: Controllers.name,
                                                  email:
                                                      Controllers.registerEmail,
                                                  birthday: dateTimeFormat,
                                                  country: _selected.name,
                                                  emailConfirm:
                                                      Controllers.registerEmail,
                                                  password: Controllers
                                                      .registerPassword,
                                                  passwordConfirm: Controllers
                                                      .repeatPassword)));
                                } else {
                                  toast(
                                      msg: Messages.repeatPasswordNotMatch,
                                      context: context);
                                }
                              } else {
                                toast(
                                    msg: Messages.shortPassword,
                                    context: context);
                              }
                            } else {
                              toast(msg: Messages.validDob, context: context);
                            }
                          } else {
                            toast(msg: Messages.wrongEmail, context: context);
                          }
                        } else {
                          toast(msg: Messages.validateName, context: context);
                        }
                      } else {}
                    },
                    color:
                        isFilled ? AppTheme.blackColor : AppTheme.toggleColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                    ),
                    child: Text(Strings.register,
                        style: TextStyle(
                            color: AppTheme.whiteColor,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppTheme.appFont)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future RegisterUser(
      {BuildContext context,
      String dateTimeFormat,
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
            addMutation.register(
                name: Controllers.name.text,
                email: Controllers.registerEmail.text,
                birthday: dateTimeFormat,
                country: _selected.name,
                emailConfirm: Controllers.registerEmail.text,
                keyword: Controllers.registerPassword.text,
                keywordConfirm: Controllers.repeatPassword.text),
          )),
        )
            .then((value) {
          queryResult = value;
          if (!queryResult.hasException) {
            Navigator.of(_addLoader.currentContext, rootNavigator: true).pop();
            toast(msg: Messages.registerSuccess, context: context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreateUserView()),
            );

            Controllers.registerEmail.clear;
            Controllers.name.clear;
            Controllers.registerPassword.clear;
            Controllers.repeatPassword.clear;
          } else {
            var errorMessage = queryResult.exception.toString().split(':');
            Navigator.of(_addLoader.currentContext, rootNavigator: true).pop();
            toast(context: context, msg: errorMessage[2]);
          }
        });
      }
    } on SocketException catch (_) {
      toast(msg: Messages.noConnection, context: context);
    }
  }

  void FilledValues() {
    if (Controllers.registerEmail.text.isNotEmpty &&
        Controllers.repeatPassword.text.isNotEmpty &&
        Controllers.name.text.isNotEmpty &&
        Controllers.registerPassword.text.isNotEmpty) {
      setState(() {
        isFilled = true;
      });
    }
  }
}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}
