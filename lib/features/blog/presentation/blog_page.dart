import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/features/blog/presentation/blog_card.dart';
import 'package:portfolio/features/blog/presentation/empty_blog_page.dart';
import 'package:portfolio/style/app_size.dart';
import 'package:portfolio/widgets/app_scaffold.dart';
import 'package:portfolio/widgets/seo_text.dart';

class BlogPage extends StatefulWidget {
  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  List _posts = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPosts();
  }

  Future<void> _loadPosts() async {
    final data = await rootBundle.loadString('assets/posts/posts.json');

    final decoded = jsonDecode(data);

    if (!mounted) return;

    setState(() {
      _posts = decoded;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            constraints: BoxConstraints(maxWidth: Insets.maxwidth),
            padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
            child: Column(
              children: [
                Gap(Insets.xxxl),

                if (!_posts.isEmpty)
                  SEOText(
                    'Blogs',
                    style: context.textStyle.titleLgBold,
                    gradient: LinearGradient(
                      colors: [
                        context.colorScheme.onBackground,
                        context.colorScheme.primary,
                      ],
                    ),
                  ),

                Gap(Insets.xl),
                if (!_posts.isEmpty)
                  SEOText(
                    'this is my blog section',
                    style: context.textStyle.bodyLgMedium.copyWith(
                      color: context.colorScheme.onSurface,
                    ),
                  ),
                Gap(Insets.xxxl),

                if (_isLoading)
                  const Center(child: CircularProgressIndicator())
                else if (_posts.isEmpty)
                  EmptyBlogPage()
                else
                  ..._posts.map((post) => BlogCard(post: post)),
              ],
            ),
          ),
        ),

        const SliverGap(120),
      ],
    );
  }
}
