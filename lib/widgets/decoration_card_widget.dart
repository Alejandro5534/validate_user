import 'package:flutter/material.dart';

class DecorationCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: ShaderMask(
        shaderCallback: (Rect bounds) => LinearGradient(
                begin: Alignment.topLeft,
                colors: [Color(0xffCD6BF4), Color(0xffb35bd6)])
            .createShader(bounds),
        child: CustomPaint(
          painter: _DecorationCardPainter(),
        ),
      ),
    );
  }
}

class _DecorationCardPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    paint.color = Color(0x00ffffffff);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2;
    final path = Path();

    path.lineTo(0, size.height * 0.35);
    path.quadraticBezierTo(size.width * .04, size.height * .36,
        size.width * .12, size.height * 0.25);
    path.quadraticBezierTo(size.width * .2, size.height * .09, size.width * .6,
        size.height * 0.08);
    path.quadraticBezierTo(
        size.width * .95, size.height * .06, size.width * .97, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
