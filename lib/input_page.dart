import 'package:flutter/material.dart';

const double bottomBarHeight = 75;
const reusableCardColor = Color(0xff1d1e33);
const bottomBarColor = Color(0xffd8004c);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(child: ReusableCard(reusableCardColor)),
                Expanded(child: ReusableCard(reusableCardColor))
              ],
            )),
            Expanded(child: ReusableCard(reusableCardColor)),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(child: ReusableCard(reusableCardColor)),
                Expanded(child: ReusableCard(reusableCardColor))
              ],
            )),
            Container(
                color: bottomBarColor,
                width: double.infinity,
                margin: EdgeInsets.only(top: 10),
                height: bottomBarHeight)
          ],
        ));
  }
}

class ReusableCard extends StatelessWidget {
  // final double x, y;
  ReusableCard(@required this.colour);
  final Color colour;
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: x,
      //width: y,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
