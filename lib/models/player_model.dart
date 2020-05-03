import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:snakes_and_ladder/screens/restart_app.dart';

class PlayerModel extends Model {
  int _playerAmove = 0;
  int _playerBmove = 0;
  int get playerAmove => _playerAmove;
  int get playerBmove => _playerBmove;
  BuildContext _ctx;
  BuildContext get ctx => _ctx;
  set ctx(BuildContext c) {
    _ctx = c;
    notifyListeners();
  }

  bool _won = false;
  bool get won => _won;
  set won(bool i) {
    _won = i;
    notifyListeners();
  }

  set playerAmove(int i) {
    _playerAmove = i;
    if (_playerAmove == 99) {
      print("you won");
      won = true;
      showDialog(
          barrierDismissible: false,
          context: ctx,
          builder: (BuildContext context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)), //this right here
              child: Container(
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Yayyy! Player red won!",
                        style: TextStyle(fontSize: 24),
                      ),
                      SizedBox(
                        width: 320.0,
                        child: RaisedButton(
                          onPressed: () async {
                            playerAmove = 0;
                            playerBmove = 0;
                            RestartWidget.restartApp(context);
                            Navigator.pop(context);
                          },
                          child: Text(
                            "New Game",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: const Color(0xFF1BC0C5),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          });
    }
    //ladder
    // movePlayerA(2, 99);
    // movePlayerA(3, 99);
    // movePlayerA(4, 99);
    // movePlayerA(5, 99);
    // movePlayerA(7, 99);
    movePlayerA(6, 28);
    movePlayerA(30, 41);
    movePlayerA(38, 74);
    movePlayerA(70, 81);
    movePlayerA(33, 45);
    movePlayerA(49, 68);
    movePlayerA(14, 32);
    movePlayerA(10, 20);
    movePlayerA(63, 73);
    //snakeMove
    movePlayerA(37, 4);
    movePlayerA(98, 12);
    movePlayerA(96, 85);
    movePlayerA(89, 77);
    movePlayerA(29, 9);
    movePlayerA(72, 42);
    movePlayerA(25, 7);
    movePlayerA(58, 39);
    movePlayerA(60, 51);
    notifyListeners();
  }

  set playerBmove(int i) {
    _playerBmove = i;
    if (_playerBmove == 99) {
      print("you won");
      won = true;
      showDialog(
          barrierDismissible: false,
          context: ctx,
          builder: (BuildContext context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)), //this right here
              child: Container(
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Yayyy! Player orange won!",
                        style: TextStyle(fontSize: 24),
                      ),
                      SizedBox(
                        width: 320.0,
                        child: RaisedButton(
                          onPressed: () async {
                            playerAmove = 0;
                            playerBmove = 0;
                            RestartWidget.restartApp(context);
                            Navigator.pop(context);
                          },
                          child: Text(
                            "New Game",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: const Color(0xFF1BC0C5),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          });
    }
    //ladder
    movePlayerB(6, 28);
    movePlayerB(30, 41);
    movePlayerB(38, 74);
    movePlayerB(70, 81);
    movePlayerB(33, 45);
    movePlayerB(49, 68);
    movePlayerB(14, 32);
    movePlayerB(10, 20);
    movePlayerB(63, 73);
    //snakeMove
    movePlayerB(37, 4);
    movePlayerB(98, 12);
    movePlayerB(96, 85);
    movePlayerB(89, 77);
    movePlayerB(29, 9);
    movePlayerB(72, 42);
    movePlayerB(25, 7);
    movePlayerB(58, 39);
    movePlayerB(60, 51);
    notifyListeners();
  }

  movePlayerA(int init, int finalVal) async {
    if (playerModel.playerAmove == init) {
      await Future.delayed(Duration(seconds: 1), () {
        print("time");
        playerModel.playerAmove = finalVal;
        // notifyListeners();
      });
    }
  }

  movePlayerB(int init, int finalVal) async {
    if (playerModel.playerBmove == init) {
      await Future.delayed(Duration(seconds: 1), () {
        print("time");
        playerModel.playerBmove = finalVal;
        // notifyListeners();
      });
    }
  }
}

PlayerModel playerModel = PlayerModel();
