import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'dart:math' as math;

class MyPainter extends CustomPainter {
  Offset point1;
  Offset point2;
  MyPainter({this.point1, this.point2});

  @override
  void paint(Canvas canvas, Size size) {
    final p1 = point1;
    final p2 = point2;
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 10;

    canvas.drawLine(
        Offset(p1.dx + 20, p1.dy), Offset(p2.dx + 20, p2.dy), paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}

class SnakePainter extends CustomPainter {
  Offset point1;
  Offset point2;
  SnakePainter({this.point1, this.point2});

  @override
  void paint(Canvas canvas, Size size) {
    final p1 = point1;
    final p2 = point2;
    final paint = Paint()
      ..color = Colors.red[200]
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10;

    canvas.drawLine(
        Offset(p1.dx + 20, p1.dy), Offset(p2.dx + 20, p2.dy), paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
