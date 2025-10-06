import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/constant/app_icons.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/widgets/appbar/my_app_bar.dart';
import 'package:portfolio/widgets/powerd_by_flutter.dart';

class MyFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.appBarTheme.backgroundColor,
      padding: EdgeInsets.only(
        top: context.insets.padding,
        right: context.insets.padding,
        left: context.insets.padding,
      ),
      child: Column(
        children: [
          context.isDesktop ? _DesktopFooter() : _PhoneFooter(),
          const Divider(height: 24),
          const PoweredByFlutter(),
          const Gap(8),
          Text(
            '© 2024 HAMMOUTI Walid. All rights reserved.',
            style: context.textStyle.bodyMdMedium,
          ),
          const Gap(8),
        ],
      ),
    );
  }
}

class _DesktopFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [AppLogo(), Spacer(), LargeMenu(), Spacer(), _FooterLinks()],
    );
  }
}

class _PhoneFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [AppLogo(), SmallMenu(), _FooterLinks()]);
  }
}

class _FooterLinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _FooterLinkItem(onPressed: () {}, icon: AppIcons.linkedin),
        _FooterLinkItem(onPressed: () {}, icon: AppIcons.github),
        _FooterLinkItem(onPressed: () {}, icon: AppIcons.instagram),
      ],
    );
  }
}

class _FooterLinkItem extends StatelessWidget {
  const _FooterLinkItem({required this.onPressed, required this.icon});

  final VoidCallback onPressed;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        icon,
        colorFilter: ColorFilter.mode(
          context.colorScheme.onBackground,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
