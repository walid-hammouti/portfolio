import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/widgets/seo_text.dart';
import 'package:portfolio/widgets/styled_card.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_style.dart';

class BlogCard extends StatelessWidget {
  final Map post;

  const BlogCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () => context.go(
            '/blog/${Uri.encodeComponent(post['content_file'].replaceAll('.md', ''))}',
            extra: post['title'],
          ),
      child: StyledCard(
        height: 318,
        width: 900,
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 32,
              bottom: 8,
              right: 16,
              left: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // TITLE
                    SEOText(
                      post['title'] ?? '',
                      style: context.textStyle.bodyLgBold.copyWith(
                        color: context.colorScheme.onBackground,
                        height: 1.2,
                      ),
                      textRendererStyle: TextRendererStyle.header4,
                    ),

                    const Gap(24),

                    // DESCRIPTION
                    SEOText(
                      post['description'] ?? '',
                      style: context.textStyle.bodyMdMedium.copyWith(
                        color: context.colorScheme.onSurface,
                        height: 1.6,
                      ),
                      maxlines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const Gap(16),

                    // META INFO
                    Row(
                      children: [
                        Text(
                          post['date'] ?? '',
                          style: context.textStyle.bodyMdMedium.copyWith(
                            height: 1.3,
                            color: context.colorScheme.onBackground,
                          ),
                        ),

                        const SizedBox(width: 12),
                        const Text("•"),
                        const SizedBox(width: 12),

                        Text(
                          post['reading_time'] ?? '',
                          style: context.textStyle.bodyMdMedium.copyWith(
                            height: 1.3,
                          ),
                        ),

                        const Spacer(),

                        // CATEGORY
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          child: Text(
                            post['category'] ?? '',
                            style: context.textStyle.bodyMdMedium.copyWith(
                              color: context.colorScheme.onBackground,
                              height: 1.2,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const Gap(16),

                    // TAGS
                    if (post['tags'] != null)
                      Wrap(
                        spacing: 6,
                        children:
                            List<String>.from(post['tags']).map((tag) {
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: context.colorScheme.outline
                                        .withOpacity(0.2),
                                  ),
                                ),
                                child: Text(
                                  tag,
                                  style:
                                      context.textStyle.bodyMdMedium.copyWith(),
                                ),
                              );
                            }).toList(),
                      ),
                  ],
                ),

                Align(
                  alignment: Alignment.bottomRight,
                  child: Icon(
                    Icons.arrow_forward_rounded,
                    size: 30,
                    color: context.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// the blog post schema in the file posts.json
// [
//     {
//         "id": 1,
//         "title": "My Flutter Journey",
//         "slug": "my-flutter-journey",
//         "date": "2025-05-01",
//         "author": "Walid Hammouti",
//         "description": "A personal journey into learning Flutter, challenges faced, and lessons learned while building mobile applications.",
//         "content_file": "my-flutter-journey.md",
//         "tags": [
//             "Flutter",
//             "Mobile Development",
//             "Dart",
//             "Learning"
//         ],
//         "category": "Programming",
//         "reading_time": "5 min",
//         "published": true
//     }
// ]
