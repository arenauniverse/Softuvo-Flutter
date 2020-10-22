import 'package:arena_sports_app/CommonWidgets/DatePicker.dart';
import 'package:arena_sports_app/CommonWidgets/Strings.dart';
import 'package:arena_sports_app/CommonWidgets/cammonMethods.dart';
import 'package:arena_sports_app/CommonWidgets/errorMessages.dart';
import 'package:arena_sports_app/CommonWidgets/textControllers.dart';
import 'package:arena_sports_app/CreateUser/CreateUserView.dart';
import 'package:arena_sports_app/LogIn/Login_View.dart';
import 'package:arena_sports_app/SizeConfig.dart';
import 'package:arena_sports_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class RegisterView extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  var setDateTime;
  List<ListItem> _dropdownItems = [
    ListItem(1, "First Value"),
    ListItem(2, "Second Item"),
    ListItem(3, "Third Item"),
    ListItem(4, "Fourth Item")
  ];

  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _selectedItem;

  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;
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
        resizeToAvoidBottomInset: true,
        body: Container(
          margin: EdgeInsets.only(
              top: SizeConfig.blockSizeVertical * 8.0,
              left: SizeConfig.blockSizeHorizontal * 8,
              right: SizeConfig.blockSizeHorizontal * 8),
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    // Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 20.0,
                  ),
                ),
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
                      "Ya tienes cuenta? ",
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
                TextFormField(
                  inputFormatters: <TextInputFormatter>[
                    LengthLimitingTextInputFormatter(12),
                  ],
                  controller: Controllers.name,
                  cursorColor: Colors.black,
                  validator: (value) {
                    if (value == null || value == "") {
                      return "Enter Valid Nombre y Apellido";
                    }
                  },
                  onFieldSubmitted: (v) {},
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 2,
                          bottom: SizeConfig.blockSizeVertical * 2,
                          left: SizeConfig.blockSizeVertical * 1),
                      labelText: Strings.name,
                      labelStyle: TextStyle(
                          fontFamily: AppTheme.appFont,
                          fontSize: 15.0,
                          color: AppTheme.blackColor)),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                ),
                TextFormField(
                  controller: Controllers.registerEmail,
                  cursorColor: AppTheme.blackColor,
                  decoration: InputDecoration(
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
                      return "Enter Valid Email";
                    }
                  },
                ),
                Theme(
                  data: ThemeData(primarySwatch: Colors.grey),
                  child: DatePicker(
                    "DATE OF BIRTH",
                    (dateTime) {
                      setDateTime = dateTime;
                      Controllers.dob.text =
                          DateFormat("dd-MM-yyyy").format(setDateTime);
                    },
                    initialDate: setDateTime,
                    controller: Controllers.dob,
                    lastDate: DateTime.now(),
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
                DropdownButtonFormField(
                    icon: Container(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.keyboard_arrow_down_sharp,
                        color: AppTheme.blackColor,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value == "") {
                        return "Select Pais";
                      }
                    },
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 2,
                            bottom: SizeConfig.blockSizeVertical * 2,
                            left: SizeConfig.blockSizeVertical * 1),
                        labelText: Strings.parents,
                        labelStyle: TextStyle(
                            fontSize: 15.0,
                            fontFamily: AppTheme.appFont,
                            color: AppTheme.blackColor)),
                    items: _dropdownMenuItems,
                    onChanged: (value) {
                      setState(() {
                        _selectedItem = value;
                      });
                    }),
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
                TextFormField(
                  obscureText: true,
                  controller: Controllers.registerPassword,
                  validator: (value) {
                    if (value == null || value == "") {
                      return "Enter contraseña";
                    }
                  },
                  cursorColor: AppTheme.blackColor,
                  decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.remove_red_eye_rounded,
                        color: AppTheme.blackColor,
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
                  textInputAction: TextInputAction.done,
                ),
                TextFormField(
                  obscureText: true,
                  controller: Controllers.repeatPassword,
                  validator: (value) {
                    if (value == null || value == "") {
                      return "Enter contraseña";
                    }
                  },
                  cursorColor: AppTheme.blackColor,
                  decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.remove_red_eye_rounded,
                        color: AppTheme.blackColor,
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
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: SizeConfig.blockSizeVertical * 4,
                  ),
                  child: RaisedButton(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.blockSizeHorizontal * 32,
                        vertical: SizeConfig.blockSizeVertical * 2),
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      if (_formKey.currentState.validate()) {
                        if (Controllers.name.text.isNotEmpty) {
                          if (validateEmail((Controllers.registerEmail.text))) {
                            if (Controllers.dob.text.isNotEmpty) {
                              toast(
                                  msg: ErrorMessages.validDob,
                                  context: context);
                              if (Controllers
                                      .registerPassword.text.isNotEmpty &&
                                  Controllers.registerPassword.text.length >=
                                      8) {
                                if (Controllers.repeatPassword.text ==
                                    Controllers.registerPassword.text) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CreateUserView()),
                                  );
                                  /* toast(
                                      msg: ErrorMessages.registerSuccess,
                                      context: context);*/
                                } else {
                                  toast(
                                      msg: ErrorMessages.repeatPasswordNotMatch,
                                      context: context);
                                }
                              } else {
                                toast(
                                    msg: ErrorMessages.shortPassword,
                                    context: context);
                              }
                            } else {
                              toast(
                                  msg: ErrorMessages.validDob,
                                  context: context);
                            }
                          } else {
                            toast(
                                msg: ErrorMessages.wrongEmail,
                                context: context);
                          }
                        }
                      }
                      /*  Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateUserView()),
                      );*/
                    },
                    color: AppTheme.blackColor,
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
}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}