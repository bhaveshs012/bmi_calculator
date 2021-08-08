import 'package:bmi_calculator/calculator.dart';
import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon.dart';
import 'constants.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 50;
  int age = 18;

  Gender selectedGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: IconContent(
                      iconData: FontAwesomeIcons.mars,
                      iconLabel: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: IconContent(
                      iconData: FontAwesomeIcons.venus,
                      iconLabel: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: ReusableCard(
                colour: activeCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HEIGHT",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Color(0xFFA3A4AC),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kCardNumberStyle,
                        ),
                        Text(
                          "cm",
                          style: TextStyle(
                              color: Color(0xFFA3A4AC), fontSize: 15.0),
                        )
                      ],
                    ),
                    Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 300.0,
                      activeColor: Color(0xFFEB1555),
                      inactiveColor: Color(0xFF888993),
                      onChanged: (double newValue) {
                        setState(() {
                          // We have to rebuild the slider with set state where we pass the current value of slider to the value parameter so that it updates every time we slide
                          height = newValue.round();
                        });
                      },
                    )
                  ],
                ),
              ))
            ],
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "WEIGHT",
                        style:
                            TextStyle(color: Color(0xFFA3A4AC), fontSize: 15.0),
                      ),
                      Text(weight.toString(), style: kCardNumberStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RoundActionButton(
                            icon: FontAwesomeIcons.minus,
                            onClick: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          RoundActionButton(
                            icon: FontAwesomeIcons.plus,
                            onClick: () {
                              setState(() {
                                weight++;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                  colour: activeCardColor,
                )),
                Expanded(
                    child: ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "AGE",
                        style:
                            TextStyle(color: Color(0xFFA3A4AC), fontSize: 15.0),
                      ),
                      Text(age.toString(), style: kCardNumberStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RoundActionButton(
                            icon: FontAwesomeIcons.minus,
                            onClick: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          RoundActionButton(
                            icon: FontAwesomeIcons.plus,
                            onClick: () {
                              setState(() {
                                age++;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                  colour: activeCardColor,
                )),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Calculator calc = Calculator(weight: weight, height: height);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ResultPage(
                      bmi: calc.calculateBmi(),
                      result: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                    );
                  },
                ),
              );
            },
            child: Container(
              color: bottomContainerColor,
              height: BottomBarHeight,
              width: double.infinity,
              margin: EdgeInsets.only(top: 10.0),
              child: Center(
                child: Text(
                  "CALCULATE BMI",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RoundActionButton extends StatelessWidget {
  final IconData icon;
  final Function onClick;
  RoundActionButton({this.icon, this.onClick});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        child: Icon(icon),
        fillColor: Color(0xFF4C4F5E),
        elevation: 0.0,
        shape: CircleBorder(),
        constraints: BoxConstraints.tightFor(height: 56.0, width: 56.0),
        onPressed: onClick);
  }
}
