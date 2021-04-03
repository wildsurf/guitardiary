import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guitardiary/blocs/guitar_dates/guitar_dates_bloc.dart';
import 'package:guitardiary/data/models/guitar_date.dart';

class GuitarDateEntry extends StatefulWidget {
  final DateTime date;

  const GuitarDateEntry({Key key, this.date}) : super(key: key);

  @override
  _GuitarDateEntryState createState() => _GuitarDateEntryState();
}

class _GuitarDateEntryState extends State<GuitarDateEntry> {
  double _currentSliderValue;

  @override
  void initState() {
    _currentSliderValue = 0.0;
  }

  void _onPressed() {
    BlocProvider.of<GuitarDatesBloc>(context).add(GuitarDatesAdded(
      guitarDate: GuitarDate(
        date: widget.date,
        duration: _currentSliderValue.toInt(),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Slider(
          value: _currentSliderValue,
          min: 0,
          max: 120,
          divisions: 5,
          label: _currentSliderValue.round().toString(),
          onChanged: (double value) {
            setState(() {
              _currentSliderValue = value;
            });
          },
        ),
        SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: _onPressed,
          child: Text('Add Guitar Date'),
        )
      ],
    );
  }
}
