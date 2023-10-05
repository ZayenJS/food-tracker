import 'package:flutter/material.dart';

class PageUtil {
  static Future<T?> transition<T>(BuildContext context, Widget page,
      {Offset begin = const Offset(1.0, 0.0),
      Offset? end = Offset.zero,
      Curve curve = Curves.easeInOut}) async {
    return Navigator.of(context).push<T>(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }
}
