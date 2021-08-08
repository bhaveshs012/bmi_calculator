import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  // Created a class property color which is of the Data type Color

  ReusableCard({@required this.colour, this.cardChild, this.onPress});
  //  Initialising the specific instance of the colour of the object using 'this' keyword

  final Color colour;
  // Creating a child prop for our custom widget which is of the type widget
  final Widget cardChild;
  final Function onPress;
  // Passing Functions as if they were any normal property

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
          child: cardChild,
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color:
                colour, // Using the colour that was passed with the constructor
          )),
    );
  }
}
