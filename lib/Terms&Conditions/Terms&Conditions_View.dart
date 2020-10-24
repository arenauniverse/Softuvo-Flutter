import 'package:arena_sports_app/CommonWidgets/Strings.dart';
import 'package:arena_sports_app/CommonWidgets/cammonMethods.dart';
import 'package:arena_sports_app/CommonWidgets/errorMessages.dart';
import 'package:arena_sports_app/CommonWidgets/textControllers.dart';
import 'package:flutter/material.dart';

import '../SizeConfig.dart';
import '../theme.dart';

class Terms_Conditions_View extends StatefulWidget {
  @override
  _Terms_Conditions_ViewState createState() => _Terms_Conditions_ViewState();
}

class _Terms_Conditions_ViewState extends State<Terms_Conditions_View> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: SizeConfig.blockSizeVertical * 10,
        bottom: PreferredSize(
            child: Container(
          color: AppTheme.blackColor,
          height: 0.5,
        )),
        centerTitle: true,
        leading: Container(
            margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 7),
            child: GestureDetector(
              child: Container(
                  padding: EdgeInsets.all(2),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 30.0,
                  )),
              onTap: () {
                Navigator.pop(context);
              },
            ) /*Icon(
            Icons.arrow_back_ios,
            size: 30.0,
          ),*/
            ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Container(
          margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 5),
          child: Text(
            Strings.termsText,
            style: TextStyle(
                fontFamily: AppTheme.appFont,
                fontWeight: FontWeight.w600,
                fontSize: 16),
          ),
        ),
      ),
      body: Stack(
        children: [
          /*Container(
            margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 6),
            child: Divider(
              color: AppTheme.blackColor,
            ),
          ),*/
//           Card(
//             color: AppTheme.whiteColor,
//             child: Container(
//               height: SizeConfig.blockSizeVertical * 16,
//               color: AppTheme.whiteColor,
//               margin: EdgeInsets.only(
//                   /*  left: SizeConfig.blockSizeHorizontal * 7,
//                   right: SizeConfig.blockSizeHorizontal * 7*/
//                   ),
//               child: SingleChildScrollView(
//                 physics: NeverScrollableScrollPhysics(),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
// /*                    Row(
//                       children: [
//                         Container(
//                           margin: EdgeInsets.only(
//                               left: SizeConfig.blockSizeHorizontal * 7,
//                               right: SizeConfig.blockSizeHorizontal * 7),
//                           child: GestureDetector(
//                             onTap: () {
//                               Navigator.pop(context);
//                               // Get.back();
//                             },
//                             child: Icon(
//                               Icons.arrow_back_ios,
//                               size: 20.0,
//                             ),
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.only(
//                               left: SizeConfig.blockSizeHorizontal * 5),
//                           child: Text(
//                             Strings.termsText,
//                             style: TextStyle(
//                                 fontFamily: AppTheme.appFont,
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 16),
//                           ),
//                         ),
//                       ],
//                     )*/
//                     Container(
//                       margin: EdgeInsets.only(
//                           top: SizeConfig.blockSizeVertical * 15),
//                       child: Divider(
//                         color: AppTheme.blackColor,
//                       ),
//                     ),
//                     // Center(
//                     //   child: Container(
//                     //     margin: EdgeInsets.symmetric(
//                     //       vertical: SizeConfig.blockSizeVertical * 3,
//                     //     ),
//                     //     child: RaisedButton(
//                     //       padding: EdgeInsets.symmetric(
//                     //           horizontal: SizeConfig.blockSizeHorizontal * 34,
//                     //           vertical: SizeConfig.blockSizeVertical * 2),
//                     //       onPressed: () {
//                     //         FocusScope.of(context).unfocus();
//                     //         /*   if (_formKey.currentState.validate()) {
//                     //           if (validateEmail(Controllers.forgetPassEmail.text)) {
//                     //             Navigator.pop(context);
//                     //           } else {
//                     //             toast(
//                     //                 context: context,
//                     //                 msg: ErrorMessages.wrongEmail);
//                     //           }
//                     //         }*/
//                     //       },
//                     //       color: AppTheme.blackColor,
//                     //       shape: RoundedRectangleBorder(
//                     //         borderRadius: new BorderRadius.circular(25.0),
//                     //       ),
//                     //       child: Text("Recuperar",
//                     //           style: TextStyle(
//                     //               color: AppTheme.whiteColor,
//                     //               fontWeight: FontWeight.w500,
//                     //               fontFamily: AppTheme.appFont)),
//                     //     ),
//                     //   ),
//                     // ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
          SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 5,
                      left: SizeConfig.blockSizeHorizontal * 7),
                  child: Text(
                    Strings.termsTitle,
                    style: TextStyle(
                        fontFamily: AppTheme.appFont,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: SizeConfig.blockSizeHorizontal * 7,
                      top: SizeConfig.blockSizeVertical * 3,
                      bottom: SizeConfig.blockSizeVertical * 5),
                  child: Text(
                    Strings.termsConditions,
                    style:
                        TextStyle(fontFamily: AppTheme.appFont, fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: SizeConfig.blockSizeVertical * 3,
                    ),
                    child: FlatButton(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.blockSizeHorizontal * 12,
                          vertical: SizeConfig.blockSizeVertical * 2),
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        Navigator.pop(context);
                        /*         if (_formKey.currentState.validate()) {
                          if (validateEmail(
                            Controllers.loginEmail.text,
                          )) {
                            if (Controllers.loginPassword.text.length >= 8) {
                              toast(
                                  context: context,
                                  msg: ErrorMessages.loginSuccess);
                            } else {
                              toast(
                                  context: context,
                                  msg: ErrorMessages.shortPassword);
                            }
                          } else {
                            toast(
                                context: context, msg: ErrorMessages.wrongEmail);
                          }
                        }*/
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                      ),
                      child: Text(Strings.termsReject,
                          style: TextStyle(
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.w700,
                              fontFamily: AppTheme.appFont)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: SizeConfig.blockSizeVertical * 3,
                    ),
                    child: RaisedButton(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.blockSizeHorizontal * 12,
                          vertical: SizeConfig.blockSizeVertical * 2),
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        /*         if (_formKey.currentState.validate()) {
                          if (validateEmail(
                            Controllers.loginEmail.text,
                          )) {
                            if (Controllers.loginPassword.text.length >= 8) {
                              toast(
                                  context: context,
                                  msg: ErrorMessages.loginSuccess);
                            } else {
                              toast(
                                  context: context,
                                  msg: ErrorMessages.shortPassword);
                            }
                          } else {
                            toast(
                                context: context, msg: ErrorMessages.wrongEmail);
                          }
                        }*/
                      },
                      color: AppTheme.blackColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                      ),
                      child: Text(Strings.termsAccept,
                          style: TextStyle(
                              color: AppTheme.whiteColor,
                              fontWeight: FontWeight.w500,
                              fontFamily: AppTheme.appFont)),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(
                      //                    <--- top side
                      color: AppTheme.toggleColor,
                      width: 5.0,
                    ),
                  )),
              height: SizeConfig.blockSizeVertical * 15,
            ),
          ),
        ],
      ),
    );
  }
}
