import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/constant/app_icons.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/providers.dart';
import 'package:portfolio/widgets/seo_text.dart';

class LanguageSwitch extends ConsumerWidget {
  const LanguageSwitch({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final local = ref.watch(appLocalProvider);
    return PopupMenuButton(
      initialValue: local.value,
      onSelected: (value) {
        if (value == 'en') {
          ref.read(appLocalProvider.notifier).changeLocale('en');
        } else if (value == 'fr') {
          ref.read(appLocalProvider.notifier).changeLocale('fr');
        } else if (value == 'ar') {
          ref.read(appLocalProvider.notifier).changeLocale('ar');
        }
      },
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: 'en',
            child: PopUpLanguageSwitchItem(
              language: 'English',
              icon: AppIcons.us,
            ),
          ),
          PopupMenuItem(
            value: 'fr',
            child: PopUpLanguageSwitchItem(
              language: 'French',
              icon: AppIcons.fr,
            ),
          ),
          PopupMenuItem(
            value: 'ar',
            child: PopUpLanguageSwitchItem(
              language: 'Arabic',
              icon: AppIcons.ar,
            ),
          ),
        ];
      },
      child: Row(
        children: [
          Icon(Icons.language, color: context.colorScheme.onBackground),
          const Gap(4),
          SEOText(
            local.value == 'en' ? 'En' : (local.value == 'ar' ? 'عر' : 'Fr'),
          ),
        ],
      ),
    );
  }
}

class PopUpLanguageSwitchItem extends StatelessWidget {
  const PopUpLanguageSwitchItem({
    super.key,
    required this.language,
    required this.icon,
  });
  final String language;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(icon, width: 19, height: 18),
        const Gap(8),
        SEOText(language),
      ],
    );
  }
}
