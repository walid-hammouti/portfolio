import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extensions.dart';

class PoweredByFlutter extends StatelessWidget {
  const PoweredByFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          isDark
              ? 'assets/images/flutter_icon_Dark.png'
              : 'assets/images/flutter_icon_Light.png',
          key: ValueKey(isDark), // 👈 forces reload on theme change
          width: 36,
          height: 36,
        ),
        const Gap(8),
        Text(
          context.texts.poweredByFlutter,
          style: context.textStyle.bodyLgBold.copyWith(
            color: context.colorScheme.onBackground,
          ),
        ),
      ],
    );
  }
}
