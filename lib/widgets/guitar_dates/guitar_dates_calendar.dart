import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:guitardiary/data/models/guitar_date.dart';
import 'package:guitardiary/data/models/skill.dart';
import 'package:guitardiary/widgets/guitar_dates/calendar_bubble.dart';
import 'package:table_calendar/table_calendar.dart';

class GuitarDatesCalendar extends StatefulWidget {
  @override
  _GuitarDatesCalendarState createState() => _GuitarDatesCalendarState();
}

class _GuitarDatesCalendarState extends State<GuitarDatesCalendar> {
  CalendarController _calendarController;

  // dummy data
  Map<DateTime, List> _events = {
    DateTime.parse('2021-04-07'): [
      GuitarDate(
          date: DateTime.parse('2021-04-07'),
          duration: 20,
          skillTimes: {SkillType.repertoire: 20})
    ],
  };

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  void onTappedEmptyDate(DateTime day, List events, List holidays) {
    var newGuitarDate = GuitarDate(date: day);
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height - 200,
            child: Text(newGuitarDate.toString()),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      events: _events,
      calendarController: _calendarController,
      onDaySelected: onTappedEmptyDate,
      builders: CalendarBuilders(
        todayDayBuilder: (context, DateTime date, _) {
          return CalendarBubble(
            date: date,
            backgroundColor: Colors.black12,
          );
        },
        selectedDayBuilder: (context, DateTime date, _) {
          return CalendarBubble(
            date: date,
          );
        },
        markersBuilder: (context, date, events, holidays) {
          final children = <Widget>[];
          if (events.isNotEmpty) {
            children.add(
              CalendarBubble(
                date: date,
                backgroundColor: Colors.pink,
                color: Colors.white,
                onTapped: () {
                  print('selected $date');
                  print(events);
                },
              ),
            );
          }
          return children;
        },
      ),
    );
  }
}
