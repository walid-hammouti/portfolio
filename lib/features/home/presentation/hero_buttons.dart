import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/style/app_size.dart';
import 'package:portfolio/widgets/styled_button.dart';

class LargeHeroButtons extends StatelessWidget {
  const LargeHeroButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PrimaryButton(title: context.texts.courses),
        Gap(Insets.xl),
        OutlineButton(title: context.texts.cooperationRequest),
      ],
    );
  }
}

class SmallHeroButtons extends StatelessWidget {
  const SmallHeroButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: PrimaryButton(title: context.texts.courses),
        ), // SizedBox
        Gap(Insets.xl),
        SizedBox(
          width: double.infinity,
          child: OutlineButton(title: context.texts.cooperationRequest),
        ), // SizedBox
      ],
    ); // Column
  }
}
