import 'package:flutter/material.dart';

class BackWidget extends StatelessWidget {
  const BackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        shape: BoxShape.circle,
      ),
      child: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Icon(Icons.arrow_back_ios, color: Color(0xff588BF0), size: 22),
        ),
      ),
    );
  }
}
