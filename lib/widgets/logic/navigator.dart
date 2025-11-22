import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void goTo(Widget page) {
  Navigator.of(
    navigatorKey.currentContext!,
  ).push(MaterialPageRoute(builder: (context) => page));
}

void goOff(Widget page) {
  Navigator.of(navigatorKey.currentContext!).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => page),
    (route) => false,
  );
}
