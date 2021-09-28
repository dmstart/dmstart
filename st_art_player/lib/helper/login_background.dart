import 'package:flutter/material.dart';

class LoginBackgorund extends CustomPainter{

  LoginBackgorund({@required this.isJoin});

  final bool isJoin;
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = isJoin?Colors.blue:Colors.yellow;
    canvas.drawCircle(Offset(size.width*0.5,size.height*0.2), size.height*0.5, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
  
}