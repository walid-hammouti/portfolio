import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/widgets/seo_text.dart';
import 'package:portfolio/widgets/styled_card.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_style.dart';

class TechstackItem extends StatelessWidget {
  final String image;
  final String title;

  const TechstackItem({super.key, required this.image, required this.title});
  @override
  Widget build(BuildContext context) {
    return StyledCard(
      height: 150,
      width: 150,
      child: Column(
        children: [
          Container(width: 100, height: 50, child: SvgPicture.asset(image)),
          Gap(24),
          SEOText(
            overflow: TextOverflow.ellipsis,
            title,
            style: context.textStyle.bodyLgBold.copyWith(
              color: context.colorScheme.onBackground,
            ),
            textRendererStyle: TextRendererStyle.header4,
          ),
        ],
      ),
    );
  }
}
