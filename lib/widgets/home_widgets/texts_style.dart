import 'package:flutter/material.dart';
import 'package:movies_app/widgets/logic/theme.dart';

TextStyle style() {
  return TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
}

TextStyle style3() {
  return TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.4,
    color: AppTheme.isDark ? Colors.white70 : Colors.black54,
  );
}

TextStyle movieDetails() {
  return const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
}

TextStyle movieDetails2() {
  return const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.white70,
    height: 1.4,
  );
}
