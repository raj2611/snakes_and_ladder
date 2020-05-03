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
    });
  }

  sizeResponse(size) {}

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
      backgroundColor: Color.fromRGBO(217, 136, 128, 1),
      appBar: AppBar(
        leading: size.width > 700
            ? Container()
            : IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  scaffoldKey.currentState.openDrawer();
                },
              ),
        backgroundColor: Color.fromRGBO(115, 198, 182, 1),
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
                              margin: EdgeInsets.all(0),
                              key: list[index],
                              color: (10 <= index && index <= 19) ||
                                      (30 <= index && index <= 39) ||
                                      (50 <= index && index <= 59) ||
                                      (70 <= index && index <= 79) ||
                                      (90 <= index && index <= 99)
                                  ? index.isOdd
                                      ? Colors.white
                                      : Color.fromRGBO(115, 198, 182, 1)
                                  : index.isEven
                                      ? Colors.white
                                      : Color.fromRGBO(115, 198, 182, 1),
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
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                            );
                          });
                    }),
                    p1 != null
                        ? CustomPaint(
                            size: Size(width, height),
                            painter: MyPainter(
                              point1: p1,
                              point2: p2,
                              pointOrigin: p0,
                              px: size.width > 700 ? Offset(0, 0) : px,
                            ),
                          )
                        : SizedBox(),
                    p3 != null
                        ? CustomPaint(
                            size: Size(width, height),
                            painter: MyPainter(
                              point1: p3,
                              point2: p4,
                              pointOrigin: p0,
                              px: size.width > 700 ? Offset(0, 0) : px,
                            ))
                        : SizedBox(),
                    p5 != null
                        ? CustomPaint(
                            size: Size(width, height),
                            painter: MyPainter(
                              point1: p5,
                              point2: p6,
                              pointOrigin: p0,
                              px: size.width > 700 ? Offset(0, 0) : px,
                            ))
                        : SizedBox(),
                    p7 != null
                        ? CustomPaint(
                            size: Size(width, height),
                            painter: MyPainter(
                              point1: p7,
                              point2: p8,
                              pointOrigin: p0,
                              px: size.width > 700 ? Offset(0, 0) : px,
                            ))
                        : SizedBox(),
                    p9 != null
                        ? CustomPaint(
                            size: Size(width, height),
                            painter: MyPainter(
                              point1: p9,
                              point2: p10,
                              pointOrigin: p0,
                              px: size.width > 700 ? Offset(0, 0) : px,
                            ),
                          )
                        : SizedBox(),
                    p11 != null
                        ? CustomPaint(
                            size: Size(width, height),
                            painter: MyPainter(
                              point1: p11,
                              point2: p12,
                              pointOrigin: p0,
                              px: size.width > 700 ? Offset(0, 0) : px,
                            ),
                          )
                        : SizedBox(),
                    p13 != null
                        ? CustomPaint(
                            size: Size(width, height),
                            painter: MyPainter(
                              point1: p13,
                              point2: p14,
                              pointOrigin: p0,
                              px: size.width > 700 ? Offset(0, 0) : px,
                            ),
                          )
                        : SizedBox(),
                    // p15 != null
                    //     ? CustomPaint(
                    //         size: Size(width, height),
                    //         painter: MyPainter(point1: p15, point2: p1, pointOrigin: p0),
                    //     size.width > 700 ?  Offset(0, 0):px)
                    //     : SizedBox(),
                    p17 != null
                        ? CustomPaint(
                            size: Size(width, height),
                            painter: MyPainter(
                              point1: p17,
                              point2: p18,
                              pointOrigin: p0,
                              px: size.width > 700 ? Offset(0, 0) : px,
                            ),
                          )
                        : SizedBox(),
                    p19 != null
                        ? CustomPaint(
                            size: Size(width, height),
                            painter: MyPainter(
                              point1: p19,
                              point2: p20,
                              pointOrigin: p0,
                              px: size.width > 700 ? Offset(0, 0) : px,
                            ),
                          )
                        : SizedBox(),
                    p20 != null
                        ? CustomPaint(
                            size: Size(width, height),
                            painter: SnakePainter(
                              point1: p21,
                              point2: p22,
                              pointOrigin: p0,
                              px: size.width > 700 ? Offset(0, 0) : px,
                            ),
                          )
                        : SizedBox(),
                    p22 != null
                        ? CustomPaint(
                            size: Size(width, height),
                            painter: SnakePainter(
                              point1: p23,
                              point2: p24,
                              pointOrigin: p0,
                              px: size.width > 700 ? Offset(0, 0) : px,
                            ),
                          )
                        : SizedBox(),
                    p24 != null
                        ? CustomPaint(
                            size: Size(width, height),
                            painter: SnakePainter(
                              point1: p25,
                              point2: p26,
                              pointOrigin: p0,
                              px: size.width > 700 ? Offset(0, 0) : px,
                            ),
                          )
                        : SizedBox(),
                    p26 != null
                        ? CustomPaint(
                            size: Size(width, height),
                            painter: SnakePainter(
                              point1: p27,
                              point2: p28,
                              pointOrigin: p0,
                              px: size.width > 700 ? Offset(0, 0) : px,
                            ),
                          )
                        : SizedBox(),
                    p28 != null
                        ? CustomPaint(
                            size: Size(width, height),
                            painter: SnakePainter(
                              point1: p29,
                              point2: p30,
                              pointOrigin: p0,
                              px: size.width > 700 ? Offset(0, 0) : px,
                            ),
                          )
                        : SizedBox(),
                    p30 != null
                        ? CustomPaint(
                            size: Size(width, height),
                            painter: SnakePainter(
                              point1: p31,
                              point2: p32,
                              pointOrigin: p0,
                              px: size.width > 700 ? Offset(0, 0) : px,
                            ),
                          )
                        : SizedBox(),
                    p32 != null
                        ? CustomPaint(
                            size: Size(width, height),
                            painter: SnakePainter(
                              point1: p33,
                              point2: p34,
                              pointOrigin: p0,
                              px: size.width > 700 ? Offset(0, 0) : px,
                            ),
                          )
                        : SizedBox(),
                    p34 != null
                        ? CustomPaint(
                            size: Size(width, height),
                            painter: SnakePainter(
                              point1: p35,
                              point2: p36,
                              pointOrigin: p0,
                              px: size.width > 700 ? Offset(0, 0) : px,
                            ),
                          )
                        : SizedBox(),
                    p36 != null
                        ? CustomPaint(
                            size: Size(width, height),
                            painter: SnakePainter(
                              point1: p37,
                              point2: p38,
                              pointOrigin: p0,
                              px: size.width > 700 ? Offset(0, 0) : px,
                            ),
                          )
                        : SizedBox(),
                    // p38 != null
                    //     ? CustomPaint(
                    //         size: Size(width, height),
                    //         painter: SnakePainter(point1: p39, point2: p4),
                    //       )
                    //     : SizedBox(),
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
