import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/extensions.dart';

class ContactmeImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;

    return dark
        ? SvgPicture.asset(
          'assets/images/Contactme_Dark.svg',
          height: context.insets.contactmeImageSize,
          width: context.insets.contactmeImageSize,
        )
        : SvgPicture.asset(
          'assets/images/Contactme_Light.svg',
          height: context.insets.contactmeImageSize,
          width: context.insets.contactmeImageSize,
        );
  }
}
