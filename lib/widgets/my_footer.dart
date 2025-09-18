import 'package:flutter/material.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/widgets/appbar/my_app_bar.dart';

class MyFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.appBarTheme.backgroundColor,
      padding: EdgeInsets.all(context.insets.padding),
      child: Column(
        children: [
          context.isDesktop ? _DesktopFooter() : _PhoneFooter(),
          const Divider(height: 24),
          Text(
            '© 2024 HAMMOUTI Walid. All rights reserved.',
            style: context.textStyle.bodyMdMedium,
          ),
        ],
      ),
    );
  }
}

class _DesktopFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(children: [AppLogo(), Spacer(), LargeMenu(), Spacer()]);
  }
}

class _PhoneFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [AppLogo(), SmallMenu()]);
  }
}
