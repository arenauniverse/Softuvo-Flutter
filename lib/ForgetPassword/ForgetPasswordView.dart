import 'package:flutter/material.dart';

import '../SizeConfig.dart';
import '../theme.dart';

class ForgetPasswordView extends StatefulWidget {
  @override
  _ForgetPasswordViewState createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
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
                    onPressed: () {},
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
    );
  }
}
