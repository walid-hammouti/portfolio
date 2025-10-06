import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/style/app_size.dart';
import 'package:portfolio/widgets/seo_text.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_style.dart';

class HeroTexts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          context.isDesktopOrTablet
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.center,
      children: [
        SEOText(
          context.texts.welcometext,
          textAlign:
              context.isDesktopOrTablet ? TextAlign.left : TextAlign.center,
          style: context.textStyle.titleMdMedium,
          gradient: LinearGradient(
            colors: [
              context.colorScheme.onBackground,
              context.colorScheme.primary,
            ],
          ),
          textRendererStyle: TextRendererStyle.header2,
        ),
        Gap((Insets.md)),
        SEOText(
          context.texts.herotitle,
          textAlign:
              context.isDesktopOrTablet ? TextAlign.left : TextAlign.center,
          style: context.textStyle.titleXlBold.copyWith(
            color: context.colorScheme.onBackground,
          ),

          textRendererStyle: TextRendererStyle.header1,
        ),
        Row(
          crossAxisAlignment:
              context.isDesktopOrTablet
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
          mainAxisAlignment:
              context.isDesktopOrTablet
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.center,
          children: [
            SEOText(
              context.texts.hammouti,
              textAlign:
                  context.isDesktopOrTablet ? TextAlign.left : TextAlign.center,
              style: context.textStyle.titleXlBold.copyWith(
                color: context.colorScheme.onBackground,
              ),

              textRendererStyle: TextRendererStyle.header1,
            ),
            SEOText(
              context.texts.walid,
              textAlign:
                  context.isDesktopOrTablet ? TextAlign.left : TextAlign.center,
              style: context.textStyle.titleXlBold.copyWith(
                color: context.colorScheme.primary,
              ),

              textRendererStyle: TextRendererStyle.header1,
            ),
          ],
        ), // SEOText
        Gap((Insets.xl)),
        SEOText(
          context.texts.mobileAppDeveloper,
          textAlign:
              context.isDesktopOrTablet ? TextAlign.left : TextAlign.center,
          style: context.textStyle.titleMdMedium.copyWith(
            color: context.colorScheme.onBackground,
          ),
          textRendererStyle: TextRendererStyle.header2,
        ),
        Gap((Insets.md)),
        // SEOText
        SEOText(
          context.texts.mobileAppDeveloperDesc,
          textAlign:
              context.isDesktopOrTablet ? TextAlign.left : TextAlign.center,
          style: context.textStyle.bodyMdMedium.copyWith(
            color: context.colorScheme.onSurface,
          ),
          textRendererStyle: TextRendererStyle.header1,
        ), // SEOText
      ],
    ); // Column
  }
}
