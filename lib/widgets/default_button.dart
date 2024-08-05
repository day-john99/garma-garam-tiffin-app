import 'package:flutter/material.dart';

import '../utils/colors.dart';

class DefaultButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const DefaultButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          padding: WidgetStateProperty.all(const EdgeInsets.symmetric(horizontal: 40)),
          backgroundColor: defaultButtonColor,
        ),
        child: Text(text, style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),),
    );
  }
}
