import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/style/app_size.dart';
import 'package:portfolio/widgets/seo_text.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_style.dart';

class HomeTitleSubtitle extends StatelessWidget {
  const HomeTitleSubtitle({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SEOText(
            title,
            style: context.textStyle.homeTitleSubtitleLgBold.copyWith(
              color: context.colorScheme.onBackground,
            ),
            textRendererStyle: TextRendererStyle.header2,
          ),
          Gap(Insets.md), // SEOText
          SEOText(
            subtitle,
            style: context.textStyle.bodyMdMedium.copyWith(
              color: context.colorScheme.onSurface,
            ),
            textRendererStyle: TextRendererStyle.header4,
          ), // SEOText
        ],
      ), // Column
    ); // Padding
  }
}
