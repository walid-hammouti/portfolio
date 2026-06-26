import 'package:flutter/material.dart';
import 'package:portfolio/extensions.dart';

class EmptyBlogPage extends StatelessWidget {
  const EmptyBlogPage();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: Center(
        child: Column(
          children: [
            Icon(
              Icons.article_outlined,
              size: 60,
              color: context.colorScheme.onSurface.withOpacity(0.5),
            ),
            const SizedBox(height: 16),
            Text(
              "No blog posts yet",
              style: context.textStyle.bodyLgBold.copyWith(
                color: context.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "New articles will appear here soon.",
              textAlign: TextAlign.center,
              style: context.textStyle.bodyMdMedium.copyWith(
                color: context.colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
