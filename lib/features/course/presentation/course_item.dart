import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/widgets/seo_text.dart';
import 'package:portfolio/widgets/styled_card.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_style.dart';

class CourseItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StyledCard(
      child: AspectRatio(
        aspectRatio: 0.7,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1.5,
              child: Image.network(
                "https://s3-alpha.figma.com/hub/file/4210100113/0d13eb3a-6b59-4412-a59a-59529fb259af-cover.png",
                fit: BoxFit.cover,
              ),
            ),
            Gap(24),
            SEOText(
              "Random text",
              style: context.textStyle.bodyLgBold.copyWith(
                color: context.colorScheme.onBackground,
              ),
              textRendererStyle: TextRendererStyle.header4,
            ),
            Gap(8),

            Expanded(
              child: SEOText(
                "Some description for the cards",
                style: context.textStyle.bodyMdMedium.copyWith(
                  color: context.colorScheme.onSurface,
                ),
                maxlines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
