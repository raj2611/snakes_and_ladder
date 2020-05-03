import 'package:scoped_model/scoped_model.dart';
import 'package:snakes_and_ladder/models/player_model.dart';

class GameModel extends Model {
  String _diceVal = "init";
  String get diceVal => _diceVal;
  bool _playerAplaying = false;
  bool get playerAplaying => _playerAplaying;
  set diceVal(String i) {
    _diceVal = i;
    notifyListeners();
  }

  set playerAplaying(bool i) {
    _playerAplaying = i;
    notifyListeners();
  }

  gamePlay(val) async {
    if (val.toString().contains("player1")) {
      if (playerModel.playerAmove == 0) {
        int temp =
            int.parse(val.toString().trim().replaceRange(0, 7, "").trim());
        if (temp == 1) {
          playerModel.playerAmove +=
              int.parse(val.toString().trim().replaceRange(0, 7, "").trim());
          await Future.delayed(Duration(seconds: 1));
          playerAplaying = true;
          notifyListeners();
        } else {
          playerModel.playerAmove = 0;
          await Future.delayed(Duration(seconds: 1));
          playerAplaying = true;
          notifyListeners();
        }
      } else {
        playerModel.playerAmove +=
            int.parse(val.toString().trim().replaceRange(0, 7, "").trim());
        playerAplaying = true;
        notifyListeners();
        print(playerModel.playerAmove);
      }
    } else if (val.toString().contains("player2")) {
      if (playerModel.playerBmove == 0) {
        int temp =
            int.parse(val.toString().trim().replaceRange(0, 7, "").trim());
        if (temp == 1) {
          playerModel.playerBmove +=
              int.parse(val.toString().trim().replaceRange(0, 7, "").trim());
          await Future.delayed(Duration(seconds: 1));
          playerAplaying = false;
          notifyListeners();
        } else {
          playerModel.playerBmove = 0;
          await Future.delayed(Duration(seconds: 1));
          playerAplaying = false;
          notifyListeners();
        }
      } else {
        playerModel.playerBmove +=
            int.parse(val.toString().trim().replaceRange(0, 7, "").trim());
        await Future.delayed(Duration(seconds: 2));
        playerAplaying = false;
        notifyListeners();
        print(playerModel.playerBmove);
      }
    }
  }
}
