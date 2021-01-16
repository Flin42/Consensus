import 'package:flutter/material.dart';
import 'package:frontend_flutter/src/profile.dart';
import 'package:frontend_flutter/src/startSession.dart';
import 'package:frontend_flutter/src/home.dart';
import 'package:frontend_flutter/src/joinSession.dart';
import 'package:frontend_flutter/src/swipe.dart';
import 'package:frontend_flutter/src/hostSession.dart';
import 'package:frontend_flutter/src/clientSession.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

void main() async {
  var channel = IOWebSocketChannel.connect("ws://localhost:8000");
  channel.stream.listen((message) {
    channel.sink.add("received!");
    channel.sink.close(status.goingAway);
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Montserrat',
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => Home(),
          '/startSession': (context) => StartSession(),
          '/ProfileScreen': (context) => ProfileScreen(),
          '/joinSession': (context) => JoinSession(),
          '/Swipe': (context) => SwipeScreen(),
          '/hostSession': (context) => HostSession(),
          '/clientSession': (context) => ClientSession(),
        });
  }
}
