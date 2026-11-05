import 'package:flutter/material.dart';

class StarField extends StatelessWidget {
  const StarField({super.key});

  @override
  Widget build(BuildContext context) => IgnorePointer(
        child: CustomPaint(painter: _StarsPainter()),
      );
}

class _StarsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white.withValues(alpha: .62);
    const points = <Offset>[
      Offset(.08, .12), Offset(.18, .24), Offset(.88, .13), Offset(.76, .27),
      Offset(.94, .34), Offset(.09, .48), Offset(.22, .62), Offset(.82, .56),
      Offset(.93, .72), Offset(.12, .83), Offset(.72, .88), Offset(.49, .08),
      Offset(.62, .18), Offset(.37, .79), Offset(.55, .94), Offset(.27, .40),
      Offset(.69, .43), Offset(.04, .72), Offset(.96, .91), Offset(.43, .31),
    ];

    for (var i = 0; i < points.length; i++) {
      final point = points[i];
      canvas.drawCircle(
        Offset(point.dx * size.width, point.dy * size.height),
        i % 5 == 0 ? 1.5 : 1,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
