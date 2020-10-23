import 'dart:math';
import 'dart:ui';
import 'package:arena_sports_app/CommonWidgets/DatePicker.dart';
import 'package:arena_sports_app/CommonWidgets/Strings.dart';
import 'package:arena_sports_app/CommonWidgets/cammonMethods.dart';
import 'package:arena_sports_app/CommonWidgets/errorMessages.dart';
import 'package:arena_sports_app/CommonWidgets/textControllers.dart';
import 'package:arena_sports_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../SizeConfig.dart';

class CreateUserView extends StatefulWidget {
  @override
  _CreateUserViewState createState() => _CreateUserViewState();
}

class _CreateUserViewState extends State<CreateUserView> {
  final _formKey = GlobalKey<FormState>();
  var setDateTime;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.only(
            top: SizeConfig.blockSizeVertical * 8.0,
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
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 15),
                        child: Text(
                          Strings.createUser,
                          style: TextStyle(
                              fontFamily: AppTheme.appFont,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
                  child: Divider(
                    thickness: 0.3,
                    color: AppTheme.blackColor,
                  ),
                ),
                Center(
                  child: Container(
                    child:
                        CircularBorder() /*ClipRect(
                      clipBehavior: Clip.hardEdge,
                      child: CircleAvatar(
                        radius: 50.0,
                        child: Icon(
                          Icons.camera_alt_outlined,
                          color: AppTheme.whiteColor,
                        ),
                        backgroundColor: AppTheme.blackColor,
                      ),
                    )*/
                    ,
                    margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 1,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: SizeConfig.blockSizeHorizontal * 8,
                      right: SizeConfig.blockSizeHorizontal * 8),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: Controllers.createUserName,
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
                        validator: (value) {
                          if (value == null || value == "") {
                            return "Enter Valid Email";
                          }
                        },
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
                      ),
                      Theme(
                        data: ThemeData(primarySwatch: Colors.grey),
                        child: DatePicker(
                          "DATE OF BIRTH",
                          (dateTime) {
                            setDateTime = dateTime;
                            Controllers.createUserDob.text =
                                DateFormat("dd-MM-yyyy").format(setDateTime);
                          },
                          controller: Controllers.createUserDob,
                          initialDate: setDateTime,
                          lastDate: DateTime.now(),
                        ),
                      ),

/*                      TextFormField(
                        controller: Controllers.createUserDob,
                        cursorColor: AppTheme.blackColor,
                        validator: (value) {
                          if (value == null || value == "") {
                            return "Enter Valid Nacimiento";
                          }
                        },
                        onFieldSubmitted: (v) {},
                        decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.date_range_outlined,
                              color: AppTheme.blackColor,
                            ),
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
                      TextFormField(
                        controller: Controllers.createUserPhone,
                        cursorColor: AppTheme.blackColor,
                        validator: (value) {
                          if (value == null || value == "") {
                            return "Enter Valid Contraseña";
                          }
                        },
                        onFieldSubmitted: (v) {},
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                                top: SizeConfig.blockSizeVertical * 2,
                                bottom: SizeConfig.blockSizeVertical * 2,
                                left: SizeConfig.blockSizeVertical * 1),
                            labelText: Strings.phone,
                            labelStyle: TextStyle(
                                fontSize: 15.0,
                                fontFamily: AppTheme.appFont,
                                color: AppTheme.blackColor)),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                      )
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      vertical: SizeConfig.blockSizeVertical * 4,
                    ),
                    child: RaisedButton(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.blockSizeHorizontal * 34,
                          vertical: SizeConfig.blockSizeVertical * 2),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          if (Controllers.createUserName.text.isNotEmpty) {
                            if (validateEmail(
                                Controllers.createUserEmail.text)) {
                              if (Controllers.createUserDob.text.isNotEmpty) {
                                if (validateMobile(
                                    Controllers.createUserPhone.text)) {
                                  toast(
                                      msg: Messages.createUserSuccess,
                                      context: context);
                                } else {
                                  toast(
                                      msg: Messages.validPhone,
                                      context: context);
                                }
                              } else {
                                toast(
                                    msg: Messages.validDob,
                                    context: context);
                              }
                            } else {
                              toast(
                                  msg: Messages.wrongEmail,
                                  context: context);
                            }
                          }
                        }
                      },
                      color: AppTheme.blackColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                      ),
                      child: Text(Strings.save,
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
      ),
    );
  }
}

class CircularBorder extends StatelessWidget {
  final Color color;
  final double size;
  final double width;
  final Widget icon;

  const CircularBorder(
      {Key key,
      this.color = Colors.blue,
      this.size = 150,
      this.width = 7.0,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: size,
      width: size,
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          icon == null ? Container() : icon,
          CustomPaint(
            child: CircleAvatar(
              radius: 64,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 61,
                backgroundColor: Colors.black,
                child: Icon(
                  Icons.camera_alt_outlined,
                  color: AppTheme.whiteColor,
                  size: 40,
                ),
              ),
            ),
            /* size: Size(size, size),*/
            foregroundPainter:
                new MyPainter(completeColor: Colors.black, width: 10),
            isComplex: true,
          ),
        ],
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  Color lineColor = Colors.transparent;
  Color completeColor;
  double width;
  Size size;
  MyPainter({this.completeColor, this.width});
  @override
  void paint(Canvas canvas, Size size) {
    Paint complete = new Paint()
      ..color = completeColor
      ..strokeCap = StrokeCap.square
      ..style = PaintingStyle.stroke
      ..strokeWidth = width / 1.5;
    Offset center = new Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 1.5, size.height / 2);
    var percent = (size.width * 0.0005) / 2;

    double arcAngle = 0.1 * pi * percent;
    for (var i = 0; i < 100; i++) {
      var init = (-pi / 5) * (i / 3);

      canvas.drawArc(new Rect.fromCircle(center: center, radius: radius), init,
          arcAngle, false, complete);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
