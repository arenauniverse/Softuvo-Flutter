import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme.dart';
import 'SizeConfig.dart';
import 'Strings.dart';

class ChannelWidget extends StatelessWidget {
   final double topMargin;

  const ChannelWidget({Key key, this.topMargin}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: topMargin),
      child: Row(
        children: [
          Stack(
            children: [
              SvgPicture.asset(
                'assets/Rectangle.svg',
                width: SizeConfig.blockSizeHorizontal * 7.7,
              ),
              Positioned(
                top: 5.0,
                left: 2.0,
                bottom: 5.0,
                child: GestureDetector(
                  child: SvgPicture.asset(
                    'assets/Shape.svg',
                    width: SizeConfig.blockSizeHorizontal * 6.8,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            width: 5.0,
          ),
          Text(
            Strings.Espn,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          SizedBox(
            width: 5.0,
          ),
          Text(
            Strings.time2,
            style: TextStyle(color: AppTheme.greyColor),
          ),
        ],
      ),
    );
  }
}
