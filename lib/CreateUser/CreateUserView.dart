import 'dart:math';
import 'dart:ui';

import 'package:arena_sports_app/theme.dart';
import 'package:flutter/material.dart';

import '../SizeConfig.dart';

class CreateUserView extends StatefulWidget {
  @override
  _CreateUserViewState createState() => _CreateUserViewState();
}

class _CreateUserViewState extends State<CreateUserView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        "Crear usuario",
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
                margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
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
                      validator: (value) {
                        if (value == null || value == "") {
                          return "Enter Valid Contraseña";
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
                          labelText: "Telefono ",
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
                    onPressed: () {},
                    color: AppTheme.blackColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                    ),
                    child: Text("Guardar",
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
