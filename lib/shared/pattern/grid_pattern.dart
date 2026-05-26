import 'package:flutter/material.dart';
import 'package:rickandmorty/core/theme/app_color.dart';

class GridPattern extends StatelessWidget {
  final Widget? child;
  final double step;
  final Color gridColor;
  final double strokeWidth;

  const GridPattern({
    super.key,
    this.child,
    this.step = 25,
    this.gridColor = blackColor,
    this.strokeWidth = 1,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: GridPainter(
        step: step,
        gridColor: gridColor,
        strokeWidth: strokeWidth,
      ),
      child: child,
    );
  }
}

class GridPainter extends CustomPainter {
  final double step;
  final Color gridColor;
  final double strokeWidth;

  GridPainter({
    this.step = 25,
    required this.gridColor,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = gridColor
      ..strokeWidth = strokeWidth;

    // Gambar garis vertikal
    for (double i = 0; i <= size.width; i += step) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }

    // Gambar garis horizontal
    for (double i = 0; i <= size.height; i += step) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
