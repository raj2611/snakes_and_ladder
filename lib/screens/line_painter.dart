import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  Offset point1;
  Offset point2;
  Offset pointOrigin;
  Offset px;
  MyPainter({this.point1, this.point2, this.pointOrigin, this.px});

  @override
  void paint(Canvas canvas, Size size) {
    final p1 = point1;
    final p2 = point2;
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 10;

    canvas.drawLine(Offset((p1.dx - px.dx) + 50, (p1.dy - pointOrigin.dy) + 25),
        Offset((p2.dx - px.dx) + 50, (p2.dy - pointOrigin.dy) + 25), paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}

class SnakePainter extends CustomPainter {
  Offset point1;
  Offset point2;
  Offset pointOrigin;
  Offset px;
  SnakePainter({this.point1, this.point2, this.pointOrigin, this.px});

  @override
  void paint(Canvas canvas, Size size) {
    final p1 = point1;
    final p2 = point2;
    final paint = Paint()
      ..color = Colors.red[200]
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10;
    canvas.drawLine(Offset((p1.dx - px.dx) + 50, (p1.dy - pointOrigin.dy) + 25),
        Offset((p2.dx - px.dx) + 50, (p2.dy - pointOrigin.dy) + 25), paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
