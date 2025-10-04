import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/style/app_size.dart';
import 'package:portfolio/widgets/app_scaffold.dart';
import 'package:portfolio/widgets/seo_text.dart';

class BlogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      slivers: [
        SliverGap(250),
        SliverToBoxAdapter(
          child: Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: Insets.maxwidth),
              padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
              child: Column(
                children: [
                  Icon(
                    Icons.construction_outlined,
                    size: 80,
                    color: context.colorScheme.primary,
                  ),
                  const Gap(24),
                  SEOText(
                    "Page Under Construction",
                    style: context.textStyle.titleLgBold.copyWith(
                      color: context.colorScheme.onBackground,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Gap(16),
                  SEOText(
                    "We're working hard to bring you amazing content. Check back soon!",
                    style: context.textStyle.bodyLgMedium.copyWith(
                      color: context.colorScheme.onSurface,
                    ),
                    textAlign: TextAlign.center,
                    maxlines: 3,
                  ),
                  const Gap(32),
                ],
              ),
            ),
          ),
        ),
        const SliverGap(250),
      ],
    );
  }
}
