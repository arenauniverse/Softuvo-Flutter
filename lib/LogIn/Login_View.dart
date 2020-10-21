import 'package:arena_sports_app/CommonWidgets/buttons.dart';
import 'package:arena_sports_app/ForgetPassword/ForgetPasswordView.dart';
import 'package:arena_sports_app/Register/Register_View.dart';
import 'package:arena_sports_app/SizeConfig.dart';
import 'package:arena_sports_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
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
                  'Inicio de sesion',
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
                      "No tiene cuenta? ",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterView()),
                        );
                      },
                      child: Text(
                        "Crear usuario",
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
                ),
                TextFormField(
                  cursorColor: AppTheme.blackColor,
                  validator: (value) {
                    if (value == null || value == "") {
                      return "Enter Valid Contraseña";
                    }
                  },
                  /*      onFieldSubmitted: (v) {},*/
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
                      if (_formKey.currentState.validate()) {
                        print("true");
                      }
                    },
                    color: AppTheme.blackColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                    ),
                    child: Text("Ingresar",
                        style: TextStyle(
                            color: AppTheme.whiteColor,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppTheme.appFont)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgetPasswordView()),
                    );
                  },
                  child: Center(
                    child: Text(
                      'Recuperar contraseña',
                      style: TextStyle(
                          fontSize: 14.0,
                          color: AppTheme.blueColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
