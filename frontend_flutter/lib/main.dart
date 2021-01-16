import 'package:flutter/material.dart';
import 'package:frontend_flutter/src/startSession.dart';
import 'package:frontend_flutter/src/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Montserrat',
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => Home(),
          '/startSession': (context) => StartSession(),
        });
  }
}
