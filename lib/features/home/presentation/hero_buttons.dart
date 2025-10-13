import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/routes/app_routes.dart';
import 'package:portfolio/widgets/styled_button.dart';

class LargeHeroButtons extends StatelessWidget {
  const LargeHeroButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: PrimaryButton(
        title: context.texts.reachMe,
        onPressed: () => context.push(AppRoutes.contactme),
      ),
    );
  }
}

class SmallHeroButtons extends StatelessWidget {
  const SmallHeroButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: PrimaryButton(
        title: context.texts.reachMe,
        onPressed: () => context.push(AppRoutes.contactme),
      ),
    ); // Column
  }
}
