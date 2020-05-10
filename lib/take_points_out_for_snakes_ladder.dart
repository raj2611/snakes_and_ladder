import 'package:flutter/material.dart';

Offset px;
Offset p0;
Offset p1;
Offset p2;
Offset p3;
Offset p4;
Offset p5;
Offset p6;
Offset p7;
Offset p8;
Offset p9;
Offset p10;
Offset p11;
Offset p12;
Offset p13;
Offset p14;
Offset p15;
Offset p16;
Offset p17;
Offset p18;
Offset p19;
Offset p20;
Offset p21;
Offset p22;
Offset p23;
Offset p24;
Offset p25;
Offset p26;
Offset p27;
Offset p28;
Offset p29;
Offset p30;
Offset p31;
Offset p32;
Offset p33;
Offset p34;
Offset p35;
Offset p36;
Offset p37;
Offset p38;
Offset p39;
Offset p40;
takeOutPoint(list) {
  px = findPosOfEachSquare(8, list);
  p0 = findPosOfEachSquare(99, list);
  p1 = findPosOfEachSquare(6, list);
  p2 = findPosOfEachSquare(28, list);
  p3 = findPosOfEachSquare(30, list);
  p4 = findPosOfEachSquare(41, list);
  p5 = findPosOfEachSquare(38, list);
  p6 = findPosOfEachSquare(74, list);
  p7 = findPosOfEachSquare(14, list);
  p8 = findPosOfEachSquare(32, list);
  p9 = findPosOfEachSquare(70, list);
  p10 = findPosOfEachSquare(81, list);
  p11 = findPosOfEachSquare(53, list);
  p12 = findPosOfEachSquare(73, list);
  p13 = findPosOfEachSquare(10, list);
  p14 = findPosOfEachSquare(20, list);
  p15 = findPosOfEachSquare(33, list);
  p16 = findPosOfEachSquare(45, list);
  p17 = findPosOfEachSquare(49, list);
  p18 = findPosOfEachSquare(68, list);

  // //Snakes
  p21 = findPosOfEachSquare(37, list);
  p22 = findPosOfEachSquare(4, list);
  p23 = findPosOfEachSquare(98, list);
  p24 = findPosOfEachSquare(12, list);
  p25 = findPosOfEachSquare(96, list);
  p26 = findPosOfEachSquare(85, list);
  p27 = findPosOfEachSquare(89, list);
  p28 = findPosOfEachSquare(77, list);
  p29 = findPosOfEachSquare(29, list);
  p30 = findPosOfEachSquare(9, list);
  p31 = findPosOfEachSquare(72, list);
  p32 = findPosOfEachSquare(42, list);
  p33 = findPosOfEachSquare(25, list);
  p34 = findPosOfEachSquare(7, list);
  p35 = findPosOfEachSquare(60, list);
  p36 = findPosOfEachSquare(51, list);
  p37 = findPosOfEachSquare(58, list);
  p38 = findPosOfEachSquare(39, list);
  // p39 = findPosOfEachSquare(91, list);
  // p40 = findPosOfEachSquare(82, list);
  print("points=> $p1 , $p2");
}

List ladderPointsA = [
  p1,
  p3,
  p5,
  p7,
  p9,
  p11,
  p13,
  p15,
  p17,
];
List ladderPointsB = [
  p2,
  p4,
  p6,
  p8,
  p10,
  p12,
  p14,
  p16,
  p18,
];
List snakePointsA = [
  p21,
  p23,
  p25,
  p27,
  p29,
  p31,
  p33,
  p35,
  p37,
];
List snakePointsB = [
  p22,
  p24,
  p26,
  p28,
  p30,
  p32,
  p34,
  p36,
  p38,
];
findPosOfEachSquare(int sqIndex, list) {
  RenderBox box = list[99 - sqIndex].currentContext.findRenderObject();
  Offset position = box.localToGlobal(Offset.zero);
  print(position);
  return position;
}
