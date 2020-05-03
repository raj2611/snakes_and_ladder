import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snakes_and_ladder/models/game_model.dart';

class DicePage extends StatelessWidget {
  GameModel gameModel;
  String player;
  DicePage(this.player, this.gameModel);
  void updateDices(DiceModel dice) async {
    for (int i = 0; i < 6; i++) {
      print(i);
      await Future.delayed(const Duration(milliseconds: 300));
      dice.generateDiceOne();
    }
    gameModel.diceVal = "$player ${dice.diceOneCount.toString()}";
    gameModel.gamePlay(gameModel.diceVal);
  }

  @override
  Widget build(BuildContext context) {
    List<String> _diceOneImages = [
      "assets/dice1.png",
      "assets/dice2.png",
      "assets/dice3.png",
      "assets/dice4.png",
      "assets/dice5.png",
      "assets/dice6.png",
    ];

    final dice = Provider.of<DiceModel>(context);
    final c = dice.diceOneCount;
    var img = Image.asset(
      _diceOneImages[c - 1],
      gaplessPlayback: true,
      width: 100,
      height: 100,
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                onTap: () => updateDices(dice),
                child: img,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class DiceModel with ChangeNotifier {
  int diceOne = 1;

  int get diceOneCount => diceOne;

  void generateDiceOne() {
    diceOne = Random().nextInt(5) + 1;
    print("diceOne: $diceOne");
    notifyListeners();
  }
}
