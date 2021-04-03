import 'package:flutter/material.dart';
import 'package:guitardiary/widgets/guitar_dates/guitar_dates_calendar.dart';

const cardPadding = const EdgeInsets.all(8.0);

class GuitarDatesSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Card(
                margin: EdgeInsets.all(0.0),
                color: Colors.grey.shade100,
                child: Container(
                  padding: cardPadding,
                  child: Text(
                    'You have practiced on x occasions.',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              GuitarDatesCalendar()
            ],
          ),
        ),
      ),
    );
  }
}
