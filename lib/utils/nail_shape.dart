
import 'package:flutter/material.dart';

class NailDesign extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    double x = size.width;
    double y = size.height;

    path.lineTo(0, y * 0.7);
    path.quadraticBezierTo(x / 2, y, x, y * 0.7);
    path.lineTo(x, y * 0.7);
    path.lineTo(x, 0);

// path.quadraticBezierTo(0, y, x, y);

    path.close();

    // path.lineTo(w, 0);
    //   path.quadraticBezierTo(w * .5, h - 100, w, h);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(oldClipper) {
    return false;
  }
}