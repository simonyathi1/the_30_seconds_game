import 'package:flutter/material.dart';
import 'package:the_30_seconds_game/screens/game_setup.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "30 Seconds",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
//          primarySwatch: Colors.
          ),
      home: GameSetup(),
    );
  }
}
