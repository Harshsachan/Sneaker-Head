import 'package:flutter/material.dart';
import 'package:patterns_canvas/patterns_canvas.dart';

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height + 15);

    Pattern pattern = const DiagonalStripesThick(
        bgColor: Color(0xffE6E0D2), fgColor: Color(0xffCAD9E0));

    pattern.paintOnRect(canvas, size, rect);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double dashWidth = 5;
    final double dashSpace = 5;
    final double startY = 0;
    final double endY = size.height;
    double currentY = startY;

    final Paint paint = Paint()
      ..color = Colors.grey // Customize the color of the dotted line
      ..strokeWidth = 2;

    while (currentY < endY) {
      canvas.drawLine(Offset(0, currentY), Offset(0, currentY + dashWidth), paint);
      currentY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}