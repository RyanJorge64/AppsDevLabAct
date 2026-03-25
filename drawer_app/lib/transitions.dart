import 'package:flutter/material.dart';

class AppTransitions {
  static Widget fadeTransitionBuilder(Widget child, Animation<double> animation) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }

  static Widget slideTransitionBuilder(Widget child, Animation<double> animation) {
    const begin = Offset(1.0, 0.0); // Slide from right
    const end = Offset.zero;
    final tween = Tween(begin: begin, end: end);
    final offsetAnimation = animation.drive(tween);
    return SlideTransition(
      position: offsetAnimation,
      child: child,
    );
  }
}