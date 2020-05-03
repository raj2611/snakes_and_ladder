import 'package:flutter/material.dart';
import 'package:snakes_and_ladder/screens/game_page.dart';
import 'package:snakes_and_ladder/screens/restart_app.dart';

class HomePage extends StatelessWidget {
  Size size;
  double width;
  double height;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height > 700 ? 700 : 300;
    width = size.width > 700 ? 700 : 300;
    return Scaffold(
      body: GamePage(),
    );
  }
}
