import 'package:flutter/material.dart';
import 'constants.dart';

class IconContents extends StatelessWidget {
  IconContents({this.icon, this.label});
  final IconData icon;

  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80,
        ),
        Text(label, style: labelTextStyle)
      ],
    );
  }
}
