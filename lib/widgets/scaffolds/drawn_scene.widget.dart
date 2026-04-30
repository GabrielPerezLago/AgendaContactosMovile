import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawnPainter extends StatelessWidget {
  Widget child;


  DrawnPainter({
    super.key,
    required this.child
  });

  @override
  Widget build(BuildContext context) => SizedBox.expand(
    child: ClipRRect(
      borderRadius: BorderRadius.circular(80),
        child: CustomPaint(
            size: Size.infinite,
            painter: _BoxPainter(context: context),
            child: Center(child: this.child,)
        )
      ),
  );


}


class _BoxPainter extends CustomPainter {
  final BuildContext context;
  _BoxPainter({
    required this.context
  });
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    final path = Path();

    final w = size.width;
    final h = size.height;

    paint.color = Theme.of(context).hoverColor;

    paint.strokeWidth = 50;
    paint.style = PaintingStyle.fill;

    path.moveTo(w, h);

    path.lineTo(w, h*0.05);
    path.quadraticBezierTo(
        w*0.7, h*0.15,
        0, h*0.05
    );
    path.lineTo(0, h*0.05);
    path.lineTo(0, h);




    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}