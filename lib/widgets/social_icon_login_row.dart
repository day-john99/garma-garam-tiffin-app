import 'package:flutter/material.dart';

class SocialIconLoginRow extends StatelessWidget {
  final VoidCallback onPressedGoogle;
  final VoidCallback onPressedApple;
  final VoidCallback onPressedFacebook;
  const SocialIconLoginRow({super.key, required this.onPressedGoogle, required this.onPressedApple, required this.onPressedFacebook});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: onPressedApple,
            icon: const Icon(Icons.facebook, color: Colors.blue,),
        ),
        IconButton(
          onPressed: onPressedGoogle,
          icon: const Icon(Icons.logout, color: Colors.blue,),
        ),
        IconButton(
          onPressed: onPressedFacebook,
          icon: const Icon(Icons.login, color: Colors.blue,),
        ),
      ],
    );
  }
}
