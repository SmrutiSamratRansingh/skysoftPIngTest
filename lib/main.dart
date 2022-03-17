import 'package:dart_ping/dart_ping.dart';
import 'package:flutter/material.dart';
import 'package:skysoft_app/ping_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PingProvider(),
    );
  }
}
