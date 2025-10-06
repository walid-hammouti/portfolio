import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/features/home/presentation/hero_buttons.dart';
import 'package:portfolio/features/home/presentation/hero_images.dart';
import 'package:portfolio/features/home/presentation/hero_texts.dart';
import 'package:portfolio/style/app_size.dart';
import 'package:portfolio/widgets/powerd_by_flutter.dart';

class HeroWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: context.isDesktopOrTablet ? _LargeHero() : _SmallHero(),
    );
  }
}

class _SmallHero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 140),
          child: HeroImage(), // BoxConstraints
        ), // ConstrainedBox
        Gap(Insets.xl),
        HeroTexts(),
        Gap(Insets.xxl),
        SmallHeroButtons(),
      ],
    );
  }
}

class _LargeHero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // ConstrainedBox
        Expanded(
          flex: 2,
          child: Column(
            children: [HeroTexts(), Gap(Insets.xxl), LargeHeroButtons()],
          ),
        ),
        Gap(120),
        Expanded(
          child: HeroImage(), // BoxConstraints
        ),
      ],
    );
  }
}
