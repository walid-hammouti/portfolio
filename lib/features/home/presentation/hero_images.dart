import 'package:flutter/material.dart';

class HeroImage extends StatelessWidget {
  const HeroImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(24)),
      child: Image.asset(
        'assets/images/me.png',
        fit: BoxFit.cover,
      ), // Image.asset
    ); // AspectRatio
  }
}
