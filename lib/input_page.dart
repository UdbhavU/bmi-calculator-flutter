import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icons.dart';
import 'reusable_card.dart';
import 'result_page.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int weight = 10, height = 120, age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                        colour: selectedGender == Gender.male
                            ? activeColor
                            : inactiveColor,
                        cardChild: IconContents(
                            icon: FontAwesomeIcons.mars, label: 'Male'))),
                Expanded(
                    child: ReusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                        colour: selectedGender == Gender.female
                            ? activeColor
                            : inactiveColor,
                        cardChild: IconContents(
                          icon: FontAwesomeIcons.venus,
                          label: 'Female',
                        )))
              ],
            )),
            Expanded(
                child: ReusableCard(
                    colour: reusableCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Height', style: labelTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text('cm', style: labelTextStyle)
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              thumbColor: bottomBarColor,
                              activeTrackColor: Colors.white,
                              trackHeight: 5,
                              inactiveTrackColor: Color(0xff8d8e98),
                              overlayColor: bottomBarColor.withAlpha(24),
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 10.0),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 30)),
                          child: Slider(
                              value: height.toDouble(),
                              min: 120,
                              max: 220,
                              onChanged: (double newValue) {
                                setState(() {
                                  height = newValue.toInt();
                                });
                              }),
                        )
                      ],
                    ))),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                        colour: reusableCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Weight', style: labelTextStyle),
                            Text(weight.toString(), style: kNumberTextStyle),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundButtonCustom(
                                  color: Color(0xffd8004c),
                                  child: FaIcon(
                                    FontAwesomeIcons.minus,
                                    color: Colors.white,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                ),
                                SizedBox(width: 20),
                                RoundButtonCustom(
                                  color: Color(0xffd8004c),
                                  child: FaIcon(
                                    FontAwesomeIcons.plus,
                                    color: Colors.white,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                )
                              ],
                            )
                          ],
                        ))),
                Expanded(
                    child: ReusableCard(
                        colour: reusableCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Age', style: labelTextStyle),
                            Text(age.toString(), style: kNumberTextStyle),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundButtonCustom(
                                  color: Color(0xffd8004c),
                                  child: FaIcon(
                                    FontAwesomeIcons.minus,
                                    color: Colors.white,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                                SizedBox(width: 20),
                                RoundButtonCustom(
                                  color: Color(0xffd8004c),
                                  child: FaIcon(
                                    FontAwesomeIcons.plus,
                                    color: Colors.white,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                )
                              ],
                            )
                          ],
                        )))
              ],
            )),
            Container(
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResultPage(
                                    weight: weight, height: height)));
                      });
                    },
                    child: Center(
                        child: Text(
                      'CALCULATE',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ))),
                color: bottomBarColor,
                width: double.infinity,
                margin: EdgeInsets.only(top: 10),
                height: bottomBarHeight)
          ],
        ));
  }
}

class RoundButtonCustom extends StatelessWidget {
  final Color color;
  final Widget child;
  final Function onTap;

  RoundButtonCustom({this.color, this.onTap, this.child});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onTap,
      child: child,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      fillColor: color,
      shape: CircleBorder(),
    );
  }
}
