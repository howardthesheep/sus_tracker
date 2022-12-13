import 'package:flutter/material.dart';

class AmogusBustPainter extends CustomPainter {
  final Color color;

  AmogusBustPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Paint bodyPaint = Paint()..color = color;
    Paint strokePaint = Paint()..color = Colors.black;
    Paint faceShieldPaint = Paint()..color = Colors.grey;

    double translateDown = 70;

    // Clip stuff that extends past canvas boundaries
    canvas.clipRect(Rect.fromLTWH(0, 0, size.width, size.height));

    // Backpack
    canvas.drawOval(
      Rect.fromPoints(Offset(160, 50 + translateDown), Offset(225, 210 + translateDown)),
      strokePaint,
    );
    canvas.drawOval(
      Rect.fromPoints(Offset(170, 60 + translateDown), Offset(215, 200 + translateDown)),
      bodyPaint,
    );

    // Body
    canvas.drawOval(
      Rect.fromPoints(Offset(30, 256 + translateDown), Offset(190, 0 + translateDown)),
      strokePaint,
    );
    canvas.drawOval(
      Rect.fromPoints(Offset(40, 246 + translateDown), Offset(180, 10 + translateDown)),
      bodyPaint,
    );

    // Face
    canvas.drawOval(
      Rect.fromPoints(Offset(10, 50 + translateDown), Offset(130, 130 + translateDown)),
      strokePaint,
    );
    canvas.drawOval(
      Rect.fromPoints(Offset(20, 60 + translateDown), Offset(120, 120 + translateDown)),
      faceShieldPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class AmogusBust extends StatefulWidget {
  final Color color;

  const AmogusBust({Key? key, this.color = Colors.red}) : super(key: key);

  @override
  State<AmogusBust> createState() => _AmogusBustState();
}

class _AmogusBustState extends State<AmogusBust> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size.square(256.0),
      painter: AmogusBustPainter(color: widget.color),
    );
  }
}
