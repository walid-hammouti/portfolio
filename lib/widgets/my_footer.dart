import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/constant/app_icons.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/widgets/appbar/my_app_bar.dart';
import 'package:portfolio/widgets/powerd_by_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

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
            '© 2025 HAMMOUTI Walid. All rights reserved.',
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
        _FooterLinkItem(
          icon: AppIcons.linkedin,
          link: "https://www.linkedin.com/in/hammouti-walid-616952315/",
        ),
        _FooterLinkItem(
          icon: AppIcons.github,
          link: "https://github.com/walid-hammouti",
        ),
        _FooterLinkItem(
          icon: AppIcons.instagram,
          link: "https://www.instagram.com/walid_hammouti_/",
        ),
      ],
    );
  }
}

class _FooterLinkItem extends StatelessWidget {
  const _FooterLinkItem({required this.icon, required this.link});

  final String icon;
  final String link;
  Future<void> _launchUrl(String projectlink) async {
    final Uri url = Uri.parse(projectlink);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $projectlink');
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        _launchUrl(link);
      },
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
