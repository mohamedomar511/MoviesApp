import 'package:flutter/material.dart';
import 'package:movies_app/widgets/logic/navigator.dart';

class SignOption extends StatelessWidget {
  const SignOption({
    super.key,
    required this.text1,
    required this.text2,
    required this.page,
    this.color,
  });
  final String text1;
  final String text2;
  final Widget page;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w300,
            color: color,
          ),
        ),
        TextButton(
          onPressed: () {
            goTo(page);
          },
          child: Text(
            text2,
            style: const TextStyle(
              fontSize: 18,
              color: Color(0xff588BF0),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
