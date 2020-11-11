import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'SizeConfig.dart';

class ShowBottomSheet {
  void showModalSheet(BuildContext context, Widget navigateScreen) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(25.0),
                topLeft: Radius.circular(25.0))),
        context: context,
        builder: (builder) {
          return navigateScreen;
        });
  }

  Widget crossIcon(BuildContext context) {
     return Container(
       margin: EdgeInsets.only(
           top: SizeConfig.blockSizeVertical * 2,
           right: SizeConfig.blockSizeVertical * 2),
       child: SvgPicture.asset('assets/crossIcon.svg'),
     );
  }
}
