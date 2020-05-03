import 'package:flutter/material.dart';
import 'package:snakes_and_ladder/screens/game_page.dart';
import 'package:snakes_and_ladder/screens/home_screen.dart';
import 'package:snakes_and_ladder/screens/restart_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RestartWidget(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SnakesAndLadder',
        home: HomePage(),
      ),
    );
  }
}
