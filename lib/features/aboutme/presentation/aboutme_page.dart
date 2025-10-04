import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/style/app_size.dart';
import 'package:portfolio/widgets/app_scaffold.dart';
import 'package:portfolio/widgets/seo_text.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      slivers: [
        SliverToBoxAdapter(
          child: Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: Insets.maxwidth),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal:
                      context
                          .insets
                          .padding, // ← Match home page padding structure
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(150), // ← Increased from 100 to 150

                    CircleAvatar(
                      radius: 150,
                      backgroundImage:
                          Image.asset('assets/images/me.png').image,
                    ),
                    const Gap(32), // ← Increased from 16 to 32
                    SEOText(
                      context.texts.aboutmeTitle,
                      style: context.textStyle.titleLgBold,
                    ),
                    const Gap(32), // ← Increased from 16 to 32
                    SEOText(
                      context.texts.aboutmeDesc,
                      style: context.textStyle.bodyLgMedium,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SliverGap(100), // ← Increased from 150 to 200
      ],
    );
  }
}
