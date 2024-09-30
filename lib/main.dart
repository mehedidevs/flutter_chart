import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  RangeChart(),
    );
  }
}




class RangeChart extends StatelessWidget {
  const RangeChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 200,
      child: CustomPaint(
        painter: ChartPainter(),
      ),
    );
  }
}

class ChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey[300]!
      ..strokeWidth = 1;

    // Draw horizontal lines
    for (var i = 0; i <= 4; i++) {
      final y = size.height * i / 4;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }

    // Draw vertical lines
    for (var i = 0; i <= 7; i++) {
      final x = size.width * i / 7;
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    // Draw y-axis labels
    final textPainter = TextPainter(textDirection: TextDirection.ltr);
    for (var i = 0; i <= 4; i++) {
      textPainter.text = TextSpan(
        text: '${14 - i * 2}',
        style: TextStyle(color: Colors.grey[600], fontSize: 12),
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(0, size.height * i / 4 - textPainter.height / 2));
    }

    // Draw x-axis labels
    for (var i = 0; i <= 7; i++) {
      textPainter.text = TextSpan(
        text: '${6 + i * 2}',
        style: TextStyle(color: Colors.grey[600], fontSize: 12),
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(size.width * i / 7 - textPainter.width / 2, size.height));
    }

    // Draw the vertical line for the range
    final rangePaint = Paint()
      ..color = Colors.cyan.withOpacity(0.5)
      ..strokeWidth = 2;
    final x = size.width / 7;
    canvas.drawLine(Offset(x, size.height * 0.2), Offset(x, size.height * 0.6), rangePaint);

    // Draw the circle points
    final circlePaint = Paint()..strokeWidth = 2;
    circlePaint.color = Colors.green;
    canvas.drawCircle(Offset(x, size.height * 0.6), 4, circlePaint);
    circlePaint.color = Colors.red;
    canvas.drawCircle(Offset(x, size.height * 0.2), 4, circlePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}





