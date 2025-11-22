import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.text,
    required this.icon,
    required this.controller,
    this.validator,
  });

  final String text;
  final IconData icon;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final bool isPasswordField = widget.icon == Icons.visibility_off;

    return SizedBox(
      height: 56,
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        obscureText: isPasswordField ? _obscureText : false,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xffFFFFFF),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: isPasswordField
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                  )
                : Icon(widget.icon, color: Colors.grey),
          ),

          label: Text(
            widget.text,
            style: const TextStyle(color: Color.fromARGB(255, 151, 161, 173)),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: const BorderSide(color: Color(0xffE5E7EB)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: const BorderSide(color: Color(0xffE5E7EB)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: const BorderSide(color: Color(0xffE5E7EB)),
          ),
        ),
      ),
    );
  }
}
