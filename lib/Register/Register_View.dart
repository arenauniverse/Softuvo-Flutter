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
            right: SizeConfig.blockSizeHorizontal * 7),
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
                  'Crear usuario',
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
                  Text("Ya tienes cuenta? "),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Iniciar Sesión",
                      style: TextStyle(color: AppTheme.blueColor),
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
                    labelText: "Nombre y Apellido",
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
                    labelText: "Email",
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
                    labelText: "Fecha de Nacimiento",
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
                    labelText: "Pais",
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
                    labelText: "Contraseña",
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
                    labelText: "Repetir contraseña",
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
                      horizontal: SizeConfig.blockSizeHorizontal * 34,
                      vertical: SizeConfig.blockSizeVertical * 2),
                  onPressed: () {},
                  color: AppTheme.blackColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                  ),
                  child: Text("Registrar",
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
