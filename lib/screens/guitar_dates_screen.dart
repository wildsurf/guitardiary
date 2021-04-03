import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guitardiary/blocs/guitar_dates/guitar_dates_bloc.dart';
import 'package:guitardiary/widgets/guitar_dates/guitar_dates_summary.dart';
import 'package:guitardiary/widgets/loading_indicator.dart';

const GuitarDatesScreenRoute = '/guitar-dates';

class GuitarDatesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Guitar ♥ Diary')),
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.all(20.0), child: GuitarDatesSummary()),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: 'Dates'),
          BottomNavigationBarItem(
              icon: Icon(Icons.adjust_outlined), label: 'Goals'),
        ],
      ),
    );
  }
}
