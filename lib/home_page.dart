import 'package:flutter/material.dart';
import 'package:portfolio/widgets/appbar/background_blur.dart';
import 'package:portfolio/widgets/appbar/my_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundBlur(),
          const MyAppBar(),
          // Other widgets can be added here
        ],
      ),
    );
  }
}
