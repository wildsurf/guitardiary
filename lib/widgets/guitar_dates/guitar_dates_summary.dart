import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guitardiary/blocs/guitar_dates/guitar_dates_bloc.dart';
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
                    child: BlocBuilder<GuitarDatesBloc, GuitarDatesState>(
                        builder: (context, state) {
                      if (state is GuitarDatesLoadSuccess) {
                        return Text(
                          'You have practiced ${state.guitarDates.length} time(s).',
                          textAlign: TextAlign.center,
                        );
                      } else {
                        return Text('');
                      }
                    })),
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
