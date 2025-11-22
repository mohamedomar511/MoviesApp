import 'package:flutter/material.dart';

class CircleavatarWidget extends StatelessWidget {
  const CircleavatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 25,
      backgroundColor: Color(0xff588BF0),
      child: Padding(
        padding: EdgeInsets.only(left: 2),
        child: Icon(Icons.arrow_forward_ios, color: Color(0xffFFFFFF)),
      ),
    );
  }
}
