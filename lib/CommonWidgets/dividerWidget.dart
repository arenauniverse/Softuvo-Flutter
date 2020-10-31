import 'package:flutter/material.dart';

class GetDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1,
      color: Theme.of(context).dividerColor,
    );
  }
}
