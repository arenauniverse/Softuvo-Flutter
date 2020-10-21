import 'package:arena_sports_app/CommonWidgets/Strings.dart';
import 'package:arena_sports_app/CreateUser/CreateUserView.dart';
import 'package:arena_sports_app/LogIn/Login_View.dart';
import 'package:arena_sports_app/SizeConfig.dart';
import 'package:arena_sports_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterView extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
            top: SizeConfig.blockSizeVertical * 8.0,
            left: SizeConfig.blockSizeHorizontal * 8,
            right: SizeConfig.blockSizeHorizontal * 8),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
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
                margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 3),
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
                cursorColor: AppTheme.blackColor,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical * 2,
                        bottom: SizeConfig.blockSizeVertical * 2,
                        left: SizeConfig.blockSizeVertical * 1),
                    labelText: Strings.emailText,
                    labelStyle: TextStyle(
                        fontSize: 15.0,
                        fontFamily: AppTheme.appFont,
                        color: AppTheme.blackColor)),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
              TextFormField(
                cursorColor: AppTheme.blackColor,
                /*  validator: (value) {
                  if (value == null || value == "") {
                    return "Enter Valid Contraseña";
                  }
                },
                onFieldSubmitted: (v) {},*/
                decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.date_range_outlined,
                      color: AppTheme.blackColor,
                    ),
                    /*SvgPicture.asset(
                      'assets/dateTimeIcon.svg',
                      height: 20.0,
                    ),*/
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
              ),
              TextFormField(
                cursorColor: AppTheme.blackColor,
                /*  validator: (value) {
                  if (value == null || value == "") {
                    return "Enter Valid Contraseña";
                  }
                },
                onFieldSubmitted: (v) {},*/
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
              TextFormField(
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
                    labelText: Strings.password,
                    labelStyle: TextStyle(
                        fontSize: 15.0,
                        fontFamily: AppTheme.appFont,
                        color: AppTheme.blackColor)),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
              ),
              TextFormField(
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CreateUserView()),
                    );
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
    );
  }
}
