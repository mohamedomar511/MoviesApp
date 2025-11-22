import 'package:flutter/material.dart';

class Filledbutton extends StatelessWidget {
  const Filledbutton({super.key, required this.filltext, this.fun});
  final String filltext;
  final VoidCallback? fun;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: ElevatedButton(
        onPressed: fun,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff2444BF),
        ),
        child: Text(
          filltext,
          style: const TextStyle(color: Colors.white, fontSize: 19),
        ),
      ),
    );
  }
}
