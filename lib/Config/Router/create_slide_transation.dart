import 'package:flutter/material.dart';

Route createSlideTransation(Widget page, Offset offset) {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 300),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var curve = Curves.easeIn;
      var curveAnimation = CurvedAnimation(parent: animation, curve: curve);
      return SlideTransition(
        position: Tween<Offset>(
          begin: offset,
          end: Offset.zero,
        ).animate(curveAnimation),
        child: child,
      );
    },
    pageBuilder: (context, animation, secondaryAnimation) => page,
  );
}
