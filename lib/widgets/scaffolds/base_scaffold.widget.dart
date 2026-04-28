import 'package:flutter/material.dart';

class BaseScaffold extends Scaffold {
  final BuildContext context;
  Widget child;
  EdgeInsets? padding;

  BaseScaffold({
    required this.context,
    required this.child,
    this.padding
  });

  @override
  // TODO: implement body
  Widget? get body => Container(
    width: double.infinity,
    height: double.infinity,
    decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage('assets/images/background.jpeg'), fit: BoxFit.cover, opacity: 0.2),
      //color: Colors.white
    ),
    child: CustomPaint(
      size: Size.infinite,
      painter: _BoxPainter(context: context),
      child: child,
    ),
    padding: padding ?? EdgeInsets.all(0),
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
    path.lineTo(w, h*0.6);
    path.quadraticBezierTo(
        w*0.8, h*0.9, //Contol
        0, h*0.9 //Final
    );
    path.lineTo(0, h);


    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}