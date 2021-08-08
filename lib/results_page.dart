import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'calculator.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.result,
      @required this.bmi,
      @required this.interpretation});
  final String result;
  final String bmi;
  final String interpretation;

  TextStyle getStyle(result) {
    if (result == 'Normal') {
      return kNormal;
    } else if (result == 'UnderWeight') {
      return kUnderweight;
    } else if (result == 'OverWeight') {
      return kOverweight;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              child: Text(
                "Your Results",
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(result, style: getStyle(result)),
                  Text(
                    bmi,
                    style: kBMITextStyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: BottomBarHeight,
              color: bottomContainerColor,
              child: Center(
                child: Text(
                  'RE-CALCULATE BMI',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
