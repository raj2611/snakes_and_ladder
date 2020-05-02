import 'package:flutter/material.dart';

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
  p1 = findPosOfEachSquare(6, list);
  p2 = findPosOfEachSquare(28, list);
  p3 = findPosOfEachSquare(30, list);
  p4 = findPosOfEachSquare(41, list);
  p5 = findPosOfEachSquare(38, list);
  p6 = findPosOfEachSquare(74, list);
  // p7 = findPosOfEachSquare(35, list);
  // p8 = findPosOfEachSquare(53, list);
  p9 = findPosOfEachSquare(70, list);
  p10 = findPosOfEachSquare(81, list);
  // p11 = findPosOfEachSquare(22, list);
  // p12 = findPosOfEachSquare(77, list);
  // p13 = findPosOfEachSquare(50, list);
  // p14 = findPosOfEachSquare(80, list);
  // p15 = findPosOfEachSquare(57, list);
  // p16 = findPosOfEachSquare(68, list);
  p17 = findPosOfEachSquare(33, list);
  p18 = findPosOfEachSquare(45, list);
  p19 = findPosOfEachSquare(49, list);
  p20 = findPosOfEachSquare(68, list);

  //Snakes
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
  // p33 = findPosOfEachSquare(58, list);
  // p34 = findPosOfEachSquare(42, list);
  // p35 = findPosOfEachSquare(44, list);
  // p36 = findPosOfEachSquare(2, list);
  // p37 = findPosOfEachSquare(24, list);
  // p38 = findPosOfEachSquare(7, list);
  // p39 = findPosOfEachSquare(91, list);
  // p40 = findPosOfEachSquare(82, list);
}

findPosOfEachSquare(int sqIndex, list) {
  RenderBox box = list[99 - sqIndex].currentContext.findRenderObject();
  Offset position = box.localToGlobal(Offset.zero);
  print(position);
  return position;
}

snakeLadderMoves() {}
