import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'dart:math';
import 'constants.dart';

void main() => runApp(ResultPage());

/*8.5	Underweight
18.5 - 24.9	Normal
25 - 29.9	Overweight
30.0 +	Obese
*/
class ResultPage extends StatelessWidget {
  ResultPage({this.weight, this.height});
  final int weight, height;
  double bmiCalc() {
    return (weight * 10000) / pow(height, 2);
  }

  String bmiStatus(double a) {
    return (a < 18.5
        ? 'UnderWeight'
        : (a < 25 ? 'Normal' : (a < 30 ? 'Overweight' : 'Obese')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Your Result',
            style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ReusableCard(
              colour: reusableCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    bmiStatus(bmiCalc()),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(bmiCalc().toStringAsFixed(2),
                      style: kNumberTextStyle.copyWith(fontSize: 120)),
                ],
              ),
            ),
          ),
          Container(
              child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Center(
                      child: Text(
                    'RE-CALCULATE',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ))),
              color: bottomBarColor,
              width: double.infinity,
              margin: EdgeInsets.only(top: 10),
              height: bottomBarHeight)
        ],
      ),
    );
  }
}
