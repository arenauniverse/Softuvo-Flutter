import 'package:arena_sports_app/SizeConfig.dart';
import 'package:arena_sports_app/theme.dart';
import 'package:flutter/material.dart';

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
                  // Get.back();
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 20.0,
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 3,
              ),
              Text(
                'Crear usuario',
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
                        left: SizeConfig.blockSizeVertical * 2),
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
                        left: SizeConfig.blockSizeVertical * 2),
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
                    contentPadding: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical * 2,
                        bottom: SizeConfig.blockSizeVertical * 2,
                        left: SizeConfig.blockSizeVertical * 2),
                    labelText: "Fecha de Nacimiento",
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
                    // suffixIcon: Icon(
                    //   Icons.remove_red_eye_rounded,
                    //   color: AppTheme.blackColor,
                    // ),
                    contentPadding: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical * 2,
                        bottom: SizeConfig.blockSizeVertical * 2,
                        left: SizeConfig.blockSizeVertical * 2),
                    labelText: "Pais",
                    labelStyle: TextStyle(
                        fontSize: 15.0,
                        fontFamily: AppTheme.appFont,
                        color: AppTheme.blackColor)),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
              TextFormField(
                cursorColor: AppTheme.blackColor,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical * 2,
                        bottom: SizeConfig.blockSizeVertical * 2,
                        left: SizeConfig.blockSizeVertical * 2),
                    labelText: "Repetir contraseña",
                    labelStyle: TextStyle(
                        fontSize: 15.0,
                        fontFamily: AppTheme.appFont,
                        color: AppTheme.blackColor)),
                keyboardType: TextInputType.emailAddress,
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
                  onPressed: () {},
                  color: AppTheme.blackColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(22.0),
                  ),
                  child: Text("Registrar",
                      style: TextStyle(
                          color: AppTheme.whiteColor,
                          fontWeight: FontWeight.w500,
                          fontFamily: AppTheme.appFont)),
                ),
              ),
              Center(
                child: Text(
                  'Recuperar contraseña',
                  style: TextStyle(fontSize: 13.0, color: AppTheme.blueColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
