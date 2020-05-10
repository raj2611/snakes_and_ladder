import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:snakes_and_ladder/models/game_model.dart';
import 'package:snakes_and_ladder/models/player_model.dart';
import 'package:snakes_and_ladder/screens/dice_roll.dart';
import 'package:snakes_and_ladder/screens/line_painter.dart';
import 'package:snakes_and_ladder/take_points_out_for_snakes_ladder.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<GlobalKey> list;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  Size size;
  double width;
  double height;
  GameModel gameModel = GameModel();

  @override
  void initState() {
    super.initState();
    list = List<GlobalKey>.generate(100, (_) => GlobalKey());
    WidgetsBinding.instance.addPostFrameCallback((d) {
      setState(() {
        takeOutPoint(list);
      });
      laddersRender();
      snakeRender();
    });
  }

  final ladderChildren = <Widget>[];
  final snakeChildren = <Widget>[];
  laddersRender() {
    for (int i = 0; i < ladderPointsA.length; i++) {
      ladderChildren.add(CustomPaint(
        size: Size(width, height),
        painter: MyPainter(
          point1: ladderPointsA[i],
          point2: ladderPointsB[i],
          pointOrigin: p0,
          px: size.width > 700 ? Offset(0, 0) : px,
        ),
      ));
    }
  }

  snakeRender() {
    for (int i = 0; i < snakePointsA.length; i++) {
      snakeChildren.add(CustomPaint(
        size: Size(width, height),
        painter: SnakePainter(
          point1: snakePointsA[i],
          point2: snakePointsB[i],
          pointOrigin: p0,
          px: size.width > 700 ? Offset(0, 0) : px,
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height > 700 ? 700 : 300;
    width = size.width > 700 ? 700 : 300;

    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        child: Center(
          child: Container(
            margin: EdgeInsets.all(12),
            child: Text(
              "Ladders (which are grey lines) will take you up and Snakes (which are red lines) will take you down, but eventually you will reach the 100 to win, just like life with ups and down, so good luck.",
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      backgroundColor: Color.fromRGBO(22, 160, 133, 1),
      appBar: AppBar(
        leading: size.width > 700
            ? Container()
            : IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  scaffoldKey.currentState.openDrawer();
                },
              ),
        backgroundColor: Color.fromRGBO(52, 73, 94, 1.0),
        title: Text(
          "Snakes and Ladder",
          style: TextStyle(
            color: Colors.white,
            fontSize: size.width > 700 ? 18 : 12,
          ),
        ),
        actions: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Developed by Sumant Raj.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: size.width > 700 ? 18 : 12,
                ),
              ),
            ),
          ),
        ],
      ),
      body: ScopedModel<GameModel>(
        model: gameModel,
        child: ScopedModel<PlayerModel>(
          model: playerModel,
          child: Flex(
            direction: size.width > 700 ? Axis.horizontal : Axis.vertical,
            children: <Widget>[
              Container(
                margin:
                    size.width > 700 ? EdgeInsets.all(0) : EdgeInsets.all(22),
                height: size.width > 700 ? height : 300,
                width: width,
                child: Stack(
                  children: [
                    ScopedModelDescendant<GameModel>(
                        builder: (context, child, gameModel) {
                      // print("model val => ${gameModel.diceVal}");
                      // print("model val bool=> ${gameModel.playerAplaying}");
                      return GridView.builder(
                          itemCount: 100,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 10,
                            mainAxisSpacing: 0,
                            crossAxisSpacing: 0,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return new Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              margin: EdgeInsets.all(0),
                              key: list[index],
                              color: (10 <= index && index <= 19) ||
                                      (30 <= index && index <= 39) ||
                                      (50 <= index && index <= 59) ||
                                      (70 <= index && index <= 79) ||
                                      (90 <= index && index <= 99)
                                  ? index.isOdd
                                      ? Color.fromRGBO(193, 144, 96, 1)
                                      : Color.fromRGBO(33, 45, 60, 1)
                                  : index.isEven
                                      ? Color.fromRGBO(193, 144, 96, 1)
                                      : Color.fromRGBO(33, 45, 60, 1),
                              child: ScopedModelDescendant<PlayerModel>(
                                  builder: (context, child, playerModel) {
                                playerModel.ctx = context;
                                return Stack(
                                  children: [
                                    (99 - index) == playerModel.playerAmove
                                        ? Align(
                                            alignment: index == 99
                                                ? Alignment.topLeft
                                                : Alignment.center,
                                            child: Container(
                                              width: 50.0,
                                              height: 50.0,
                                              decoration: new BoxDecoration(
                                                color: Colors.red,
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                          )
                                        : SizedBox(),
                                    (99 - index) == playerModel.playerBmove
                                        ? Align(
                                            alignment: index == 99
                                                ? Alignment.bottomRight
                                                : Alignment.center,
                                            child: Container(
                                              width: 50.0,
                                              height: 50.0,
                                              decoration: new BoxDecoration(
                                                color: Colors.orange,
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                          )
                                        : SizedBox(),
                                    Container(
                                      child: Center(
                                        child: Text(
                                          ((99 - index) + 1).toString(),
                                          style: TextStyle(
                                              fontSize: 24,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                            );
                          });
                    }),
                    ...ladderChildren,
                    ...snakeChildren,
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  child: ScopedModelDescendant<GameModel>(
                      builder: (context, child, gameModel) {
                    // print(
                    //     "ye bhi hua ${gameModel.diceVal}  ${gameModel.playerAplaying}");
                    return Flex(
                      direction: Axis.vertical,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card(
                          color: gameModel.diceVal == "init"
                              ? Color.fromRGBO(247, 220, 111, 1)
                              : gameModel.playerAplaying
                                  ? Colors.white
                                  : Color.fromRGBO(247, 220, 111, 1),
                          child: Container(
                            width: 120,
                            height: 50,
                            child: Center(
                              child: Text("Player Red"),
                            ),
                          ),
                        ),
                        SizedBox(height: size.width > 700 ? 50 : 5),
                        Container(
                          height: 100,
                          width: 100,
                          child: gameModel.diceVal == "init"
                              ? ChangeNotifierProvider<DiceModel>(
                                  child: DicePage("player1", gameModel),
                                  create: (BuildContext context) {
                                    return DiceModel();
                                  },
                                )
                              : !gameModel.playerAplaying
                                  ? ChangeNotifierProvider<DiceModel>(
                                      child: DicePage("player1", gameModel),
                                      create: (BuildContext context) {
                                        return DiceModel();
                                      },
                                    )
                                  : SizedBox(),
                        ),
                        SizedBox(
                          height: size.width > 700 ? 100 : 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "Roll the dice and try your luck! (you need to tap on the dice.)",
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        size.width > 700
                            ? Container(
                                padding: EdgeInsets.all(5),
                                height: 40,
                                color: Colors.white,
                                child: Text(
                                  "Ladders (which are grey lines) will take you up and Snakes (which are red lines) will take you down, but eventually you will reach the 100 to win, just like life with ups and down, so good luck.",
                                  style: TextStyle(color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            : Container(
                                height: 2,
                                color: Colors.white,
                              ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "Game will start for you if you get 1 from the roll initially.",
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: size.width > 700 ? 100 : 10,
                        ),
                        Container(
                          height: 100,
                          width: 100,
                          child: gameModel.diceVal == "init"
                              ? SizedBox()
                              : !gameModel.playerAplaying
                                  ? SizedBox()
                                  : ChangeNotifierProvider<DiceModel>(
                                      child: DicePage("player2", gameModel),
                                      create: (BuildContext context) {
                                        return DiceModel();
                                      },
                                    ),
                        ),
                        SizedBox(
                          height: size.width > 700 ? 50 : 5,
                        ),
                        Card(
                          color: gameModel.diceVal == "init"
                              ? Colors.white
                              : !gameModel.playerAplaying
                                  ? Colors.white
                                  : Color.fromRGBO(247, 220, 111, 1),
                          child: Container(
                            width: 120,
                            height: 50,
                            child: Center(
                              child: Text("Player Orange"),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
