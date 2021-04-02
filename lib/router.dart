import 'package:flutter/material.dart';
import 'package:guitardiary/screens/guitar_dates_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case GuitarDatesScreenRoute:
      return MaterialPageRoute(builder: (_) => GuitarDatesScreen());
  }
}

const initialRoute = GuitarDatesScreenRoute;