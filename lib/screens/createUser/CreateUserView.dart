import 'dart:io';
import 'dart:math';
import 'dart:ui';
import 'package:arena_sports_app/CommonWidgets/DatePicker.dart';
import 'package:arena_sports_app/CommonWidgets/Dialogs.dart';
import 'package:arena_sports_app/CommonWidgets/SizeConfig.dart';
import 'package:arena_sports_app/CommonWidgets/Strings.dart';
import 'package:arena_sports_app/CommonWidgets/cammonMethods.dart';
import 'package:arena_sports_app/CommonWidgets/Messages.dart';
import 'package:arena_sports_app/CommonWidgets/sharePreferenceData.dart';
import 'package:arena_sports_app/CommonWidgets/textControllers.dart';
import 'package:arena_sports_app/Repos.dart';
import 'package:arena_sports_app/screens/userDashboard/NavigationFiles.dart';
import 'package:arena_sports_app/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

bool isimagechosen = false;
PickedFile _image;

class CreateUserView extends StatefulWidget {
  final String name, email, dob, country;
  const CreateUserView({Key key, this.name, this.email, this.dob, this.country})
      : super(key: key);
  @override
  _CreateUserViewState createState() => _CreateUserViewState();
}

class _CreateUserViewState extends State<CreateUserView> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<State> _addLoader = new GlobalKey<State>();
  var setDateTime;
  var getDetails;
  bool isFilled = false;
  var nameFocus = FocusNode();
  var emailFocus = FocusNode();
  var phone = FocusNode();
  int getId;
  @override
  void initState() {
    SharedPreferenceData().getRegisterId().then((value) {
      setState(() {
        getId = value;
      });
    });
    Controllers.createUserName..text = widget.name;
    Controllers.createUserEmail..text = widget.email;
    Controllers.createUserDob..text = widget.dob;
  }

  void FilledValues() {
    if (Controllers.createUserName.text.isNotEmpty &&
            Controllers.createUserEmail.text.isNotEmpty &&
            Controllers.createUserDob.text.isNotEmpty ||
        Controllers.createUserPhone.text.isNotEmpty) {
      setState(() {
        isFilled = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Form(
      key: _formKey,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          margin: EdgeInsets.only(
            top: SizeConfig.blockSizeVertical * 8.0,
          ),
          child: Column(
            children: [
              Container(
                child: Row(
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
                          child: Container(
                            padding: EdgeInsets.all(2),
                            child: SvgPicture.asset(
                              'assets/backArrow.svg',
                              width: 12,
                            ),
                          )),
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
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 4),
                      child: Divider(
                        thickness: 0.3,
                        color: AppTheme.blackColor,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: SizeConfig.blockSizeHorizontal * 100,
                  height: SizeConfig.blockSizeVertical * 80,
                  child: SingleChildScrollView(
                    physics: ClampingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SingleChildScrollView(
                          physics: ClampingScrollPhysics(),
                          child: Column(
                            children: [
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
                                          return Messages.validFullName;
                                        }
                                      },
                                      inputFormatters: <TextInputFormatter>[
                                        LengthLimitingTextInputFormatter(12),
                                      ],
                                      onChanged: (v) {
                                        FilledValues();
                                      },
                                      onFieldSubmitted: (v) {
                                        FocusScope.of(context)
                                            .requestFocus(nameFocus);
                                      },
                                      decoration: InputDecoration(
                                          focusedBorder:
                                              const UnderlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.grey, width: 1.0),
                                          ),
                                          contentPadding: EdgeInsets.only(
                                              top:
                                                  SizeConfig.blockSizeVertical *
                                                      2,
                                              bottom:
                                                  SizeConfig.blockSizeVertical *
                                                      2,
                                              left:
                                                  SizeConfig.blockSizeVertical *
                                                      1),
                                          labelText: Strings.name,
                                          labelStyle: TextStyle(
                                              fontFamily: AppTheme.appFont,
                                              fontSize: 15.0,
                                              color: AppTheme.blackColor)),
                                      keyboardType: TextInputType.text,
                                      textInputAction: TextInputAction.next,
                                    ),
                                    AbsorbPointer(
                                      child: TextFormField(
                                        focusNode: nameFocus,
                                        validator: (value) {
                                          if (value == null || value == "") {
                                            return Messages.validEmail;
                                          }
                                        },
                                        inputFormatters: <TextInputFormatter>[
                                          LengthLimitingTextInputFormatter(35),
                                        ],
                                        onChanged: (v) {
                                          FilledValues();
                                        },
                                        onFieldSubmitted: (v) {
                                          nameFocus.unfocus();
                                          FocusScope.of(context)
                                              .requestFocus(emailFocus);
                                        },
                                        controller: Controllers.createUserEmail,
                                        cursorColor: AppTheme.blackColor,
                                        decoration: InputDecoration(
                                            focusedBorder:
                                                const UnderlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.grey,
                                                  width: 1.0),
                                            ),
                                            contentPadding: EdgeInsets.only(
                                                top: SizeConfig
                                                        .blockSizeVertical *
                                                    2,
                                                bottom: SizeConfig
                                                        .blockSizeVertical *
                                                    2,
                                                left: SizeConfig
                                                        .blockSizeVertical *
                                                    1),
                                            labelText: Strings.Email,
                                            labelStyle: TextStyle(
                                                fontSize: 15.0,
                                                fontFamily: AppTheme.appFont,
                                                color: AppTheme.blackColor)),
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        textInputAction: TextInputAction.next,
                                      ),
                                    ),
                                    Theme(
                                      data:
                                          ThemeData(primarySwatch: Colors.grey),
                                      child: DatePicker(
                                        Strings.date_of_birth,
                                        (dateTime) {
                                          setDateTime = dateTime;
                                          Controllers.createUserDob.text =
                                              DateFormat("dd-MM-yyyy")
                                                  .format(setDateTime);
                                        },
                                        controller: Controllers.createUserDob,
                                        initialDate: setDateTime,
                                        lastDate: DateTime.now(),
                                      ),
                                    ),
                                    TextFormField(
                                      controller: Controllers.createUserPhone,
                                      cursorColor: AppTheme.blackColor,
                                      validator: (value) {
                                        if (value == null || value == "") {
                                          return Messages.validPhone;
                                        }
                                      },
                                      focusNode: emailFocus,
                                      inputFormatters: <TextInputFormatter>[
                                        LengthLimitingTextInputFormatter(12),
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      onChanged: (v) {
                                        FilledValues();
                                      },
                                      onFieldSubmitted: (v) {
                                        emailFocus.unfocus();
                                        FocusScope.of(context)
                                            .requestFocus(phone);
                                      },
                                      decoration: InputDecoration(
                                          focusedBorder:
                                              const UnderlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.grey, width: 1.0),
                                          ),
                                          contentPadding: EdgeInsets.only(
                                              top:
                                                  SizeConfig.blockSizeVertical *
                                                      2,
                                              bottom:
                                                  SizeConfig.blockSizeVertical *
                                                      2,
                                              left:
                                                  SizeConfig.blockSizeVertical *
                                                      1),
                                          labelText: Strings.phone,
                                          labelStyle: TextStyle(
                                              fontSize: 15.0,
                                              fontFamily: AppTheme.appFont,
                                              color: AppTheme.blackColor)),
                                      keyboardType: TextInputType.number,
                                      textInputAction: TextInputAction.done,
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
                                        horizontal:
                                            SizeConfig.blockSizeHorizontal * 34,
                                        vertical:
                                            SizeConfig.blockSizeVertical * 2),
                                    onPressed: () {
                                      QueryResult getResult;
                                      if (_formKey.currentState.validate()) {
                                        if (Controllers
                                            .createUserName.text.isNotEmpty) {
                                          if (validateEmail(Controllers
                                              .createUserEmail.text)) {
                                            if (Controllers.createUserDob.text
                                                .isNotEmpty) {
                                              if (validateMobile(Controllers
                                                  .createUserPhone.text)) {
                                                createUser(
                                                    context: context,
                                                    queryResult: getResult);
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
                                    color: isFilled
                                        ? AppTheme.blackColor
                                        : AppTheme.toggleColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(25.0),
                                    ),
                                    child: Text(Strings.save,
                                        style: TextStyle(
                                            color: AppTheme.whiteColor,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: AppTheme.appFont)),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future createUser({BuildContext context, QueryResult queryResult}) async {
    print("name" + widget.name.toString());
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        Dialogs.showLoadingDialog(context, _addLoader);
        GraphQLClient _client = graphQLConfiguration.clientToQuery();
        QueryResult result = await _client
            .mutate(
          MutationOptions(
              documentNode: gql(
            addMutation.createUser(
                /*country: widget.country,*/
                email: widget.email,
                //  dob: widget.dob,
                fName: widget.name,
                id: getId,
                /*imageUrl: galleryFile,*/
                lName: widget.name,
                /* status: 'confirm',
                lang: getLang,
                lat: getLat,*/
                userName: widget.name),
          )),
        )
            .then((value) {
          queryResult = value;
          if (!queryResult.hasException) {
            toast(msg: Messages.createUserSuccess, context: context);
            SharedPreferenceData()
                .saveCreateUserDetails(data: value.data['signUp']);
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => NavigationScreens()),
                (Route<dynamic> route) => false);
          } else {
            var errorMessage = queryResult.exception.toString().split(':');
            Navigator.of(_addLoader.currentContext, rootNavigator: true).pop();
            toast(context: context, msg: queryResult.exception.toString());
          }
        });
      }
    } on SocketException catch (_) {
      toast(msg: Messages.noConnection, context: context);
    }
  }
}

class CircularBorder extends StatefulWidget {
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
  _CircularBorderState createState() => _CircularBorderState();
}

class _CircularBorderState extends State<CircularBorder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size,
      width: widget.size,
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          CustomPaint(
            child: CircleAvatar(
              radius: 64,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 61,
                backgroundColor:
                    isimagechosen ? Colors.transparent : Colors.black,
                backgroundImage: _image != null && _image != ""
                    ? _image.path != null && _image.path != ""
                        ? FileImage(File(_image.path))
                        : CachedNetworkImageProvider("")
                    : CachedNetworkImageProvider(""),
                /*     backgroundImage: isimagechosen
                    ? PickedFile(galleryFile)
                    : CachedNetworkImageProvider(
                        "https://www.google.com/search?q=IMAGES&sxsrf=ALeKk02z88RL5riozHMKXA1Lx2piJC9EIw:1604379497114&tbm=isch&source=iu&ictx=1&fir=PDxUM2uh-Nz6cM%252CLlgDpz1LoiuznM%252C_&vet=1&usg=AI4_-kSNly43fM4Q4nawZzRHtyy3Nz1lOg&sa=X&ved=2ahUKEwiIoYqwy-XsAhUj5nMBHb6dBbYQ9QF6BAgEEF4#imgrc=PDxUM2uh-Nz6cM"),*/
                child: InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            contentPadding: EdgeInsets.zero,
                            content: setupAlertDialoadContainer(context),
                          );
                        });
                  },
                  child: Icon(
                    Icons.camera_alt_outlined,
                    color: AppTheme.whiteColor,
                    size: 40,
                  ),
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

  Widget setupAlertDialoadContainer(BuildContext context) {
    return Container(
        height: 240.0, // Change as per your requirement
        width: 80.0, // Change as per your requirement
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Container(
            height: 45,
            padding: EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 4.0),
            color: Colors.black,
            child: Center(
              child: Text(
                "Select Picture",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(top: 20),
            child: Material(
              color: Colors.black,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(const Radius.circular(50.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(9.0),
                child: InkWell(
                  onTap: () async {
                    chooseCameraFile().then((PickedFile file) {
                      print("file");
                      if (file != null) {
                        setState(() {
                          //   loading = true;
                        });
                      }
                    }).catchError((onError) {});
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 100,
                    child: Text(
                      "CAMERA",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(top: 20),
            child: Material(
              color: Colors.black,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(const Radius.circular(50.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(9.0),
                child: InkWell(
                  onTap: () async {
                    chooseImageFile().then((PickedFile file) {
                      if (file != null) {
                        setState(() {
                          //  loading = true;
                        });
                      }
                    }).catchError((onError) {});
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 100,
                    child: Text(
                      "GALLERY",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(top: 20),
            child: Material(
              color: Colors.black,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(const Radius.circular(40.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(9.0),
                child: InkWell(
                  onTap: () async {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                      width: 100,
                      child: Text(
                        "CANCEL",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ),
            ),
          ),
        ]));
  }

  Future<PickedFile> chooseCameraFile() async {
    await ImagePicker().getImage(source: ImageSource.camera).then((image) {
      setState(() {
        _image = image;
      });
    });
    return _image;
  }

  Future<PickedFile> chooseImageFile() async {
    await ImagePicker().getImage(source: ImageSource.gallery).then((image) {
      setState(() {
        _image = image;
      });
    });
    return _image;
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
