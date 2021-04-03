import 'package:flutter/material.dart';

class CalendarBubble extends StatelessWidget {
  final DateTime date;
  final Color color;
  final Color backgroundColor;
  final Function onTapped;

  const CalendarBubble({
    Key key,
    this.date,
    this.color,
    this.backgroundColor,
    this.onTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Material(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(80.0),
            child: InkWell(
                onTap: onTapped,
                radius: 80.0,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 8.0,
                  ),
                  child: Text(
                    '${date.day}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: color,
                    ),
                  ),
                )),
          ),
        ),
      ],
    );
  }
}
