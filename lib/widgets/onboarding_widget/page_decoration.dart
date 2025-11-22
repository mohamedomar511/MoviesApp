import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

PageDecoration getdecoration() {
  return const PageDecoration(
    fullScreen: true,
    bodyFlex: 2,
    imageFlex: 4,
    safeArea: 0,
    pageColor: Colors.transparent,
  );
}

DotsDecorator getDots() {
  return const DotsDecorator(
    activeColor: Color(0xff588BF0),
    size: Size(10, 10),
    activeSize: Size(15, 15),
    color: Color(0xffD9D9D9),
  );
}
