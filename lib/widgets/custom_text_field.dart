import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller, required this.hintText, this.obscureText= false, this.prefixIcon,
  });

  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.visiblePassword,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
          hintText: hintText
      ),
    );
  }
}
