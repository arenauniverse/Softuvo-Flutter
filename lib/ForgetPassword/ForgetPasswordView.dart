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
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: SizeConfig.blockSizeHorizontal * 10),
                child: Container(
                  child: Row(
                    children: [
                      IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                      Text(
                        "FORGOT PASSWORD",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: SizeConfig.blockSizeHorizontal * 2,
                    right: SizeConfig.blockSizeHorizontal * 2),
                child: Card(
                  elevation: 8.0,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical * 4,
                        left: SizeConfig.blockSizeHorizontal * 5,
                        right: SizeConfig.blockSizeHorizontal * 4),
                    child: Container(
                        height: SizeConfig.blockSizeVertical * 88,
                        width: SizeConfig.blockSizeHorizontal * 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Reset Your,",
                              style: TextStyle(
                                  fontSize: 22.0, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: SizeConfig.blockSizeVertical * 0.5,
                            ),
                            Text(
                              "Password",
                              style: TextStyle(
                                  fontSize: 16, color: AppTheme.greyColor),
                            ),
                            SizedBox(
                              height: SizeConfig.blockSizeVertical * 3,
                            ),
                            Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
                              style: TextStyle(color: Colors.grey.shade600),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: SizeConfig.blockSizeVertical * 4,
                            ),
                            TextFormField(
                              cursorColor: Colors.black,
                              validator: (value) {
                                if (value == null || value == "") {
                                  return "Enter Email Address";
                                }
                              },
                              onFieldSubmitted: (v) {},
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4)),
                                    borderSide: BorderSide(
                                      width: 0.8,
                                      color: Colors.black,
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.only(
                                      top: SizeConfig.blockSizeVertical * 2,
                                      bottom: SizeConfig.blockSizeVertical * 2,
                                      left: SizeConfig.blockSizeVertical * 2),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 1.0),
                                  ),
                                  labelText: "Email",
                                  labelStyle: TextStyle(fontSize: 14.0)),
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.done,
                            ),
                            SizedBox(
                              height: SizeConfig.blockSizeVertical * 4,
                            ),
                            Center(
                              child: RaisedButton(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        SizeConfig.blockSizeHorizontal * 31,
                                    vertical:
                                        SizeConfig.blockSizeVertical * 1.7),
                                onPressed: () {
                                  FocusScope.of(context).unfocus();
                                  if (_formKey.currentState.validate()) {
                                    // if(validateEmail());
                                    // Get.to(LoginScreenView());
                                  } else {
                                    // Navigator.pop(context);
                                  }
                                },
                                child: Text(
                                  "CONTINUE",
                                  /*   style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontFamily: AppTheme.fontLato)*/
                                ),
                              ),
                            ),
                            SizedBox(
                              height: SizeConfig.blockSizeVertical * 4,
                            ),
                          ],
                        )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
