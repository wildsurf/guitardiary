import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guitardiary/blocs/guitar_dates/guitar_dates_bloc.dart';
import 'package:guitardiary/data/models/guitar_date.dart';
import 'package:guitardiary/widgets/guitar_dates/calendar_bubble.dart';
import 'package:guitardiary/widgets/guitar_dates/guitar_date_entry.dart';
import 'package:table_calendar/table_calendar.dart';

import '../styled_bottom_sheet.dart';

class GuitarDatesCalendar extends StatefulWidget {
  @override
  _GuitarDatesCalendarState createState() => _GuitarDatesCalendarState();
}

class _GuitarDatesCalendarState extends State<GuitarDatesCalendar> {
  CalendarController _calendarController;

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

  void _onTappedEmptyDate(DateTime day, List events, List holidays) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return StyledBottomSheet(
              child: GuitarDateEntry(
            date: day,
          ));
        });
  }

  void _onDateRangeChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    BlocProvider.of<GuitarDatesBloc>(context)
        .add(GuitarDatesTimeRangeUpdates(from: first, to: last));
  }

  Map<DateTime, List<dynamic>> _transformGuitarDatesToCalendarEvents(
      List<GuitarDate> guitarDates) {
    Map<DateTime, List<dynamic>> events = {};
    guitarDates.forEach((guitarDate) {
      events[guitarDate.date] = [guitarDate];
    });
    return events;
  }

  Widget _buildCalendar(List<GuitarDate> guitarDates) {
    Map<DateTime, List<dynamic>> events =
        _transformGuitarDatesToCalendarEvents(guitarDates);
    return TableCalendar(
      events: events,
      calendarController: _calendarController,
      onDaySelected: _onTappedEmptyDate,
      onCalendarCreated: _onDateRangeChanged,
      onVisibleDaysChanged: _onDateRangeChanged,
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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GuitarDatesBloc, GuitarDatesState>(
        builder: (context, state) {
      if (state is GuitarDatesLoadSuccess) {
        return _buildCalendar(state.guitarDates);
      } else {
        return _buildCalendar([]);
      }
    });
  }
}
