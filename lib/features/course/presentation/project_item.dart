import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/widgets/seo_text.dart';
import 'package:portfolio/widgets/styled_button.dart';
import 'package:portfolio/widgets/styled_card.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_style.dart';

class ProjectItem extends StatelessWidget {
  const ProjectItem({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.projectlink,
  });

  final String image;
  final String title;
  final String description;
  final String projectlink;
  @override
  Widget build(BuildContext context) {
    return StyledCard(
      child: AspectRatio(
        aspectRatio: 0.7,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1.5,
              child: Image.asset(image, fit: BoxFit.cover),
            ),
            Gap(24),
            SEOText(
              title,
              style: context.textStyle.bodyLgBold.copyWith(
                color: context.colorScheme.onBackground,
              ),
              textRendererStyle: TextRendererStyle.header4,
            ),
            Gap(8),

            Expanded(
              child: SEOText(
                description,
                style: context.textStyle.bodyMdMedium.copyWith(
                  color: context.colorScheme.onSurface,
                ),
                maxlines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PrimaryButton(title: "APK Install"),
                PrimaryButton(title: "Project link", projectlink: projectlink),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
