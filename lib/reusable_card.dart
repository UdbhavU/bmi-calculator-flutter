import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  // final double x, y;
  ReusableCard({@required this.colour, this.cardChild, this.onPress});
  final Function onPress;
  final Widget cardChild;
  final Color colour;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        //height: x,
        child: cardChild,
        //width: y,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
