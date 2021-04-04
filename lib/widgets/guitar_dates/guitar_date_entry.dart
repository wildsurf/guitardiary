import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guitardiary/blocs/guitar_dates/guitar_dates_bloc.dart';
import 'package:guitardiary/data/models/guitar_date.dart';
import 'package:guitardiary/data/models/skill.dart';
import 'package:guitardiary/widgets/guitar_dates/skill_slider_card.dart';

class GuitarDateEntry extends StatefulWidget {
  final DateTime date;

  const GuitarDateEntry({Key key, this.date}) : super(key: key);

  @override
  _GuitarDateEntryState createState() => _GuitarDateEntryState();
}

class _GuitarDateEntryState extends State<GuitarDateEntry> {
  double _duration;
  Map<SkillType, double> _skills;

  @override
  void initState() {
    _duration = 0.0;
    _skills = {};
    SkillType.values.forEach((element) {
      _skills[element] = 0.0;
    });
  }

  void _onPressed() {
    Map<SkillType, int> skillTimes = {};
    SkillType.values.forEach((element) {
      skillTimes[element] = _skills[element].toInt();
    });
    BlocProvider.of<GuitarDatesBloc>(context).add(GuitarDatesAdded(
      guitarDate: GuitarDate(
          date: widget.date,
          duration: _duration.toInt(),
          skillTimes: skillTimes),
    ));
    Navigator.pop(context);
  }

  void _updateDuration() {
    double duration = 0.0;
    _skills.values.forEach((element) {
      duration += element;
    });
    setState(() {
      _duration = duration;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'Add a new guitar date',
              style: TextStyle(
                fontSize: 21.0,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Card(
                margin: EdgeInsets.all(0.0),
                color: Colors.white,
                child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 15.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.calendar_today_rounded,
                          size: 15.0,
                        ),
                        Text(
                          '${widget.date.day.toString()}.${widget.date.month.toString()}.${widget.date.year.toString()}',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ))),
            SizedBox(height: 10,),
            Card(
                margin: EdgeInsets.all(0.0),
                color: Colors.white,
                child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 15.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.alarm,
                          size: 18.0,
                        ),
                        Text(
                          '${_duration.toInt().toString()} mins',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ))),
            SizedBox(
              height: 20,
            ),
            ..._skills.keys
                .map(
                  (e) => Column(
                    children: [
                      SkillSliderCard(
                          currentSliderValue: _skills[e],
                          onChanged: (double newValue) {
                            setState(() {
                              _skills[e] = newValue;
                            });
                            _updateDuration();
                          },
                          label: e.toString()),
                      SizedBox(
                        height: 5,
                      )
                    ],
                  ),
                )
                .toList(),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: _onPressed,
              child: Text('Add Guitar Date'),
            )
          ],
        ),
      ),
    );
  }
}
