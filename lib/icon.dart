import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  final IconData iconData;
  final String iconLabel;
  IconContent({@required this.iconData, this.iconLabel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Icon(
            iconData,
            size: 80.0,
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            iconLabel,
            style: TextStyle(
              fontSize: 15.0,
              color: Color(0xFFA3A4AC),
            ),
          )
        ],
      ),
    );
  }
}
