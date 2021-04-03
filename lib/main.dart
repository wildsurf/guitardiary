import 'package:flutter/material.dart';
import 'package:guitardiary/router.dart' as router;

void main() {
  runApp(MyApp());
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