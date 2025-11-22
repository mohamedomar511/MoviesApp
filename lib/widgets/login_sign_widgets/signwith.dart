import 'package:flutter/material.dart';

class Signwith extends StatelessWidget {
  const Signwith({super.key, required this.image, required this.text});
  final String image;
  final String text;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.all(19),
        backgroundColor: const Color(0xffFFFFFF),
        side: const BorderSide(color: Color(0xffE5E7EB)),
      ),
      child: Row(
        children: [
          Image.asset(image),
          const SizedBox(width: 70),
          Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
