import 'package:flutter/material.dart';

TextStyle titleStyle() => const TextStyle(
  fontSize: 34,
  fontWeight: FontWeight.bold,
  color: Colors.white,
  letterSpacing: 1.4,
  shadows: [Shadow(color: Colors.black45, offset: Offset(1, 2), blurRadius: 8)],
);

TextStyle descriptionStyle() => const TextStyle(
  fontSize: 17,
  color: Colors.white70,
  fontWeight: FontWeight.w400,
  height: 1.5,
);

TextStyle dontHaveAnAccountStyle() => const TextStyle(
  fontSize: 14,
  color: Colors.white60,
  fontWeight: FontWeight.w400,
);

BoxDecoration boxDecoration() => BoxDecoration(
  color: const Color(0xFF020F2A).withValues(alpha: 0.85),
  borderRadius: const BorderRadius.only(
    topLeft: Radius.circular(35),
    topRight: Radius.circular(35),
  ),
  boxShadow: [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.25),
      blurRadius: 15,
      offset: const Offset(0, -6),
    ),
  ],
);
