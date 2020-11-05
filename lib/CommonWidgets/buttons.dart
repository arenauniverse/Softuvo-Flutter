import 'package:arena_sports_app/SizeConfig.dart';
import 'package:arena_sports_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonsWidget extends StatelessWidget {
  final Function onPress;
  final String title;
  final SvgPicture image;
  final Color bottonColor;
  const ButtonsWidget(
      {Key key, this.onPress, this.title, this.image, this.bottonColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.blockSizeHorizontal * 10,
          vertical: SizeConfig.blockSizeVertical * 2),
      onPressed: onPress,
      color: bottonColor,
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(25.0),
      ),
      child: Row(
        /*  mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,*/
        children: [
          image,
          SizedBox(
            width: SizeConfig.blockSizeHorizontal * 8,
          ),
          Text(title,
              style: TextStyle(
                  color: AppTheme.whiteColor,
                  fontWeight: FontWeight.w500,
                  fontFamily: AppTheme.appFont)),
        ],
      ),
    );
  }
}



Widget notificationBell() {
  return Image.asset('assets/bell 2.png', width: 25,);
}

Widget directLinkBell() {
  return Image.asset('assets/Page 1.png', width: 20,);}

Widget dropdownIcon() {
  return Image.asset('assets/Page 1.png', width: 20,);}