import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key});

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
      value: isChecked,
      activeColor: Color(0xff588BF0),
      checkColor: Colors.white,
      side: const BorderSide(color: Colors.grey),
      onChanged: (value) {
        setState(() {
          isChecked = value ?? false;
        });
      },
    );
  }
}
