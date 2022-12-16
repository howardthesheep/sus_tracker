import 'package:flutter/material.dart';

import '../data/enums.dart';

class AmogusBustPainter extends CustomPainter {
  final Color color;
  final AgentStatus status;

  AmogusBustPainter({required this.color, required this.status});

  @override
  void paint(Canvas canvas, Size size) {
    Paint bodyPaint = Paint()..color = color;
    Paint strokePaint = Paint()..color = Colors.black;
    Paint faceShieldPaint = Paint()..color = Colors.grey;
    Paint backgroundPaint = Paint()..color = Colors.white;

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

    // Draw Imposter indicator if AgentStatus.imposter
    if (status == AgentStatus.imposter) {
      strokePaint.strokeWidth = 8;
      canvas.drawLine(Offset(0, 50 + translateDown), Offset(45, 70 + translateDown), strokePaint);
      canvas.drawLine(Offset(65, 70 + translateDown), Offset(110, 50 + translateDown), strokePaint);
    }

    // Draw Crewmate indicator if AgentStatus.crewmate
    if (status == AgentStatus.crewmate) {
      canvas.drawOval(
          Rect.fromPoints(Offset(49, -35 + translateDown), Offset(177, -5 + translateDown)),
          strokePaint);
      canvas.drawOval(
          Rect.fromPoints(Offset(55, -29 + translateDown), Offset(171, -11 + translateDown)),
          backgroundPaint);
    }
  }

  @override
  bool shouldRepaint(AmogusBustPainter oldDelegate) {
    return (oldDelegate.status != status || oldDelegate.color != color);
  }
}

class AmogusBust extends StatefulWidget {
  final Color color;
  final AgentStatus status;

  const AmogusBust({Key? key, this.color = Colors.red, this.status = AgentStatus.unknown})
      : super(key: key);

  @override
  State<AmogusBust> createState() => _AmogusBustState();
}

class _AmogusBustState extends State<AmogusBust> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size.square(256.0),
      painter: AmogusBustPainter(color: widget.color, status: widget.status),
    );
  }
}
