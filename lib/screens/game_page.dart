import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snakes_and_ladder/screens/dice_roll.dart';
import 'package:snakes_and_ladder/screens/line_painter.dart';
import 'package:snakes_and_ladder/take_points_out_for_snakes_ladder.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<GlobalKey> list;
  int i = 0;
  int j = 0;
  ValueNotifier valueNotifier = ValueNotifier("init");

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

  Future pauseGoti() async {
    await Future.delayed(Duration(milliseconds: 400));
  }

  snakeMove(int init, int finalVal) {
    if (i == init) {
      pauseGoti().then((d) {
        print("time");
        setState(() {
          i = finalVal;
        });
      });
    }
  }

  ladderMove(int init, int finalVal) {
    if (i == init) {
      pauseGoti().then((d) {
        print("time");
        setState(() {
          i = finalVal;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: valueNotifier,
      builder: (context, value, child) {
        print("Last fuck => $value");
        if (value.toString().contains("player1")) {
          // if (i == 0) {
          //   int temp = int.parse(
          //       value.toString().trim().replaceRange(0, 7, "").trim());
          //   if (temp == 1) {
          //     i += temp;
          //   } else {
          //     i = 0;
          //   }
          // } else {
          i += int.parse(value.toString().trim().replaceRange(0, 7, "").trim());
          print("player => $i");

          snakeMove(37, 4);
          snakeMove(98, 12);
          snakeMove(96, 85);
          snakeMove(89, 77);
          snakeMove(29, 9);
          snakeMove(72, 42);
          //ladder
          ladderMove(6, 28);
          ladderMove(30, 41);
          ladderMove(38, 74);
          ladderMove(70, 81);
          ladderMove(33, 45);
          ladderMove(49, 68);
          // i += int.parse(value.toString().trim().replaceRange(0, 7, "").trim());

          // }
        } else if (value.toString().contains("player2")) {
          if (j == 0) {
            int temp = int.parse(
                value.toString().trim().replaceRange(0, 7, "").trim());
            if (temp == 1) {
              j += temp;
            } else {
              j = 0;
            }
          } else {
            j += int.parse(
                value.toString().trim().replaceRange(0, 7, "").trim());
          }
        }

        // j += value;

        return Scaffold(
          backgroundColor: Color.fromRGBO(84, 153, 199, 1),
          body: Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Container(
                color: Colors.white,
                height: 700,
                width: 700,
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    GridView.builder(
                      shrinkWrap: true,
                      itemCount: 100,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 10,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return new Card(
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
                          child: Stack(
                            children: [
                              (99 - index) == i
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
                              (99 - index) == j
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
                                    (99 - index).toString(),
                                    style: TextStyle(
                                        fontSize: 24, color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    p1 != null
                        ? CustomPaint(
                            size: Size(700, 700),
                            painter: MyPainter(point1: p1, point2: p2),
                          )
                        : SizedBox(),
                    p3 != null
                        ? CustomPaint(
                            size: Size(700, 700),
                            painter: MyPainter(point1: p3, point2: p4),
                          )
                        : SizedBox(),
                    p5 != null
                        ? CustomPaint(
                            size: Size(700, 700),
                            painter: MyPainter(point1: p5, point2: p6),
                          )
                        : SizedBox(),
                    // p7 != null
                    //     ? CustomPaint(
                    //         size: Size(700, 700),
                    //         painter: MyPainter(point1: p7, point2: p8),
                    //       )
                    //     : SizedBox(),
                    p9 != null
                        ? CustomPaint(
                            size: Size(700, 700),
                            painter: MyPainter(point1: p9, point2: p10),
                          )
                        : SizedBox(),
                    // p11 != null
                    //     ? CustomPaint(
                    //         size: Size(700, 700),
                    //         painter: MyPainter(point1: p11, point2: p12),
                    //       )
                    //     : SizedBox(),
                    // p13 != null
                    //     ? CustomPaint(
                    //         size: Size(700, 700),
                    //         painter: MyPainter(point1: p13, point2: p14),
                    //       )
                    //     : SizedBox(),
                    // p15 != null
                    //     ? CustomPaint(
                    //         size: Size(700, 700),
                    //         painter: MyPainter(point1: p15, point2: p16),
                    //       )
                    //     : SizedBox(),
                    p17 != null
                        ? CustomPaint(
                            size: Size(700, 700),
                            painter: MyPainter(point1: p17, point2: p18),
                          )
                        : SizedBox(),
                    p19 != null
                        ? CustomPaint(
                            size: Size(700, 700),
                            painter: MyPainter(point1: p19, point2: p20),
                          )
                        : SizedBox(),
                    p20 != null
                        ? CustomPaint(
                            size: Size(700, 700),
                            painter: SnakePainter(point1: p21, point2: p22),
                          )
                        : SizedBox(),
                    p22 != null
                        ? CustomPaint(
                            size: Size(700, 700),
                            painter: SnakePainter(point1: p23, point2: p24),
                          )
                        : SizedBox(),
                    p24 != null
                        ? CustomPaint(
                            size: Size(700, 700),
                            painter: SnakePainter(point1: p25, point2: p26),
                          )
                        : SizedBox(),
                    p26 != null
                        ? CustomPaint(
                            size: Size(700, 700),
                            painter: SnakePainter(point1: p27, point2: p28),
                          )
                        : SizedBox(),
                    p28 != null
                        ? CustomPaint(
                            size: Size(700, 700),
                            painter: SnakePainter(point1: p29, point2: p30),
                          )
                        : SizedBox(),
                    p30 != null
                        ? CustomPaint(
                            size: Size(700, 700),
                            painter: SnakePainter(point1: p31, point2: p32),
                          )
                        : SizedBox(),
                    // p32 != null
                    //     ? CustomPaint(
                    //         size: Size(700, 700),
                    //         painter: SnakePainter(point1: p33, point2: p34),
                    //       )
                    //     : SizedBox(),
                    // p34 != null
                    //     ? CustomPaint(
                    //         size: Size(700, 700),
                    //         painter: SnakePainter(point1: p35, point2: p36),
                    //       )
                    //     : SizedBox(),
                    // p36 != null
                    //     ? CustomPaint(
                    //         size: Size(700, 700),
                    //         painter: SnakePainter(point1: p37, point2: p38),
                    //       )
                    //     : SizedBox(),
                    // p38 != null
                    //     ? CustomPaint(
                    //         size: Size(700, 700),
                    //         painter: SnakePainter(point1: p39, point2: p40),
                    //       )
                    //     : SizedBox(),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        child: Container(
                          width: 120,
                          height: 50,
                          child: Center(
                            child: Text("Player 1"),
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      ChangeNotifierProvider<DiceModel>(
                        child: DicePage(valueNotifier, "player1"),
                        create: (BuildContext context) {
                          return DiceModel();
                        },
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      Container(
                        height: 10,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      ChangeNotifierProvider<DiceModel>(
                        child: DicePage(valueNotifier, "player2"),
                        create: (BuildContext context) {
                          return DiceModel();
                        },
                      ),
                      SizedBox(height: 50),
                      Card(
                        child: Container(
                          width: 120,
                          height: 50,
                          child: Center(
                            child: Text("Player 2"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
