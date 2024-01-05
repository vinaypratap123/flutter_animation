import 'package:flutter/material.dart';

class Shapes extends StatefulWidget {
  const Shapes({super.key});

  @override
  State<Shapes> createState() => _ShapesState();
}

class _ShapesState extends State<Shapes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("custom painter examples")),
      body: Center(
        child: Container(
          color: Colors.grey,
          child: CustomPaint(
            painter: MasterPainter(),
            size: const Size(300, 400),
          ),
        ),
      ),
    );
  }
}

class MasterPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.strokeWidth = 2;
    paint.color = Colors.yellow;
    paint.style = PaintingStyle.stroke;
    // rounded rectangle
    Rect rect = const Rect.fromLTRB(20, 10, 100, 250);
    // rounded from the x and y direction
    canvas.drawRRect(RRect.fromRectXY(rect, 175, 225), paint);
    // rounded from all corner with equal radius
    // canvas.drawRRect(RRect.fromRectAndRadius(rect, const Radius.circular(20)), paint);

    // rounded from specific corner
    // canvas.drawRRect(RRect.fromRectAndCorners(rect,topLeft: const Radius.circular(10),bottomRight: const Radius.circular(10)), paint);

    // oval
    //canvas.drawOval(const Rect.fromLTRB(20,10,100,200), paint);

    // rect
    // Offset center = Offset(size.width / 2, size.height / 2);
    // canvas.drawRect(
    //     Rect.fromCenter(
    //         center: center, width: size.width / 2, height: size.height / 5),
    //     paint);

    // circle
    // canvas.drawCircle(Offset(size.width / 2, size.width / 2), 50, paint);

    // line
    // canvas.drawLine(Offset.zero, Offset(0, size.height/2), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
