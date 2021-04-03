import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guitardiary/blocs/guitar_dates/guitar_dates_bloc.dart';
import 'package:guitardiary/data/repositories/guitar_dates_repository.dart';
import 'package:guitardiary/data/services/sqlite_database_service.dart';
import 'package:guitardiary/router.dart' as router;

import 'blocs/simple_bloc_observer.dart';

void main() {
  //Bloc.observer = SimpleBlocObserver();
  runApp(BlocProvider(
      create: (context) {
        return GuitarDatesBloc(
          guitarDatesRepository:
              SqliteGuitarDatesRepository(SqliteDatabaseService()),
        );
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guitar ♥ Diary',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      onGenerateRoute: router.generateRoute,
      initialRoute: router.initialRoute,
    );
  }
}
