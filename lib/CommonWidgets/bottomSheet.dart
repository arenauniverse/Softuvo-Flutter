import 'package:flutter/material.dart';

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
}
