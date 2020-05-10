import 'package:flutter/material.dart';
import 'package:snakes_and_ladder/screens/game_page.dart';
import 'package:snakes_and_ladder/screens/restart_app.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GamePage(),
    );
  }
}
