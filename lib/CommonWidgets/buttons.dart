import 'package:arena_sports_app/theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'SizeConfig.dart';

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
  return Image.asset(
    'assets/bell 2.png',
    width: 25,
  );
}

Widget directLinkBell() {
  return Image.asset(
    'assets/Page 1.png',
    width: 20,
  );
}

Widget dropdownIcon() {
  return Image.asset(
    'assets/Page 1.png',
    width: 20,
  );
}

Widget toggleButton({Function onChanged, bool status}) {
  return Transform.scale(
    scale: 1.4,
    child: Switch(
      activeColor: AppTheme.blueColor,
      value: status,
      onChanged: onChanged,
      dragStartBehavior: DragStartBehavior.down,
    ),
  );
}

Widget Button({BuildContext context, Function onTap, String text}) {
  return Container(
    child: RaisedButton(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.blockSizeHorizontal * 28,
          vertical: SizeConfig.blockSizeVertical * 1.9),
      onPressed: onTap,
      color: Theme.of(context).accentColor,
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(25.0),
      ),
      child: Text(text,
          style: TextStyle(
              color: Theme.of(context).primaryColorDark,
              fontWeight: FontWeight.w500,
              fontFamily: AppTheme.appFont)),
    ),
  );
}
