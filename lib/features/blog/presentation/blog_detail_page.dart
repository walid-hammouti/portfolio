import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/features/blog/presentation/blog_loading.dart';
import 'package:portfolio/style/app_colors.dart';
import 'package:portfolio/style/app_size.dart';
import 'package:portfolio/widgets/app_scaffold.dart';

class BlogDetailPage extends StatefulWidget {
  final String title;
  final String file;
  const BlogDetailPage({required this.title, required this.file});

  @override
  State<BlogDetailPage> createState() => BlogDetailPageState();
}

class BlogDetailPageState extends State<BlogDetailPage> {
  String _content = '';
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadContent();
  }

  Future<void> _loadContent() async {
    await Future.delayed(const Duration(milliseconds: 300));

    final text = await rootBundle.loadString('assets/posts/${widget.file}');

    if (!mounted) return;

    setState(() {
      _content = text;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final fontFamily = Theme.of(context).textTheme.bodyMedium?.fontFamily;

    return AppScaffold(
      slivers: [
        SliverToBoxAdapter(
          child: Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: Insets.maxwidth),
              padding: EdgeInsets.symmetric(
                horizontal: context.insets.padding,
                vertical: 32,
              ),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                child:
                    _isLoading
                        ? BlogLoading()
                        : Markdown(
                          data: _content,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          styleSheet: _buildMarkdownStyleSheet(
                            context,
                            fontFamily,
                          ),
                        ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

MarkdownStyleSheet _buildMarkdownStyleSheet(
  BuildContext context,
  String? fontFamily,
) {
  final t = context.textStyle;

  return MarkdownStyleSheet(
    // Headings
    h1: t.titleXlBold.copyWith(
      color: context.colorScheme.onBackground,
      height: 1.4,
      letterSpacing: -0.8,
      fontFamily: fontFamily,
    ),
    h1Padding: const EdgeInsets.only(top: Insets.xl, bottom: Insets.md),

    h2: t.titleLgBold.copyWith(
      color: context.colorScheme.onBackground,
      height: 1.4,
      letterSpacing: -0.3,
      fontFamily: fontFamily,
    ),
    h2Padding: const EdgeInsets.only(top: Insets.xxl, bottom: Insets.md),

    // Body
    p: t.bodyLgMedium.copyWith(
      color: context.colorScheme.onBackground,
      height: 2.0, // was 1.8 — more breathing room between lines
      letterSpacing: 0.2, // was 0.1 — slightly more airy
      fontFamily: fontFamily,
    ),
    pPadding: const EdgeInsets.only(bottom: Insets.xl), // was md
    // Emphasis
    strong: t.bodyLgBold.copyWith(
      color: context.colorScheme.onBackground,
      fontFamily: fontFamily,
    ),
    em: t.bodyLgMedium.copyWith(
      color: context.colorScheme.onBackground,
      fontStyle: FontStyle.italic,
      fontFamily: fontFamily,
    ),

    // Blockquote
    blockquote: t.bodyLgMedium.copyWith(
      color: context.colorScheme.onBackground,
      fontStyle: FontStyle.italic,
      height: 1.9, // was 1.7
      fontFamily: fontFamily,
    ),
    blockquoteDecoration: BoxDecoration(
      color: AppColors.primaryColor.withOpacity(0.08),
      borderRadius: BorderRadius.circular(Insets.xs),
      border: Border(left: BorderSide(color: AppColors.primaryColor, width: 3)),
    ),
    blockquotePadding: const EdgeInsets.symmetric(
      horizontal: Insets.xl,
      vertical: Insets.xl, // was md
    ),

    // Inline code
    code: t.bodyMdMedium.copyWith(
      color: const Color(0xffB57BFF),
      backgroundColor: context.colorScheme.onBackground,
      fontFamily: 'monospace',
      letterSpacing: 0.4, // code reads better with a touch more spacing
    ),

    // Code block
    codeblockPadding: const EdgeInsets.all(Insets.xl),
    codeblockDecoration: BoxDecoration(
      color: context.colorScheme.onBackground,
      borderRadius: BorderRadius.circular(Insets.md),
      border: Border.all(color: context.colorScheme.onBackground!, width: 1),
    ),

    // Lists
    listBullet: t.bodyLgMedium.copyWith(
      color: AppColors.primaryColor,
      fontFamily: fontFamily,
    ),
    listBulletPadding: const EdgeInsets.only(right: Insets.md), // was xs*2
    listIndent: Insets.xl,

    // Table
    tableHead: t.bodyMdMedium.copyWith(
      color: context.colorScheme.onBackground,
      fontWeight: FontWeight.w600,
      fontFamily: fontFamily,
      letterSpacing: 0.3,
    ),
    tableBody: t.bodyMdMedium.copyWith(
      color: context.colorScheme.onBackground,
      height: 1.8, // was 1.6
      fontFamily: fontFamily,
    ),
    tableCellsPadding: const EdgeInsets.symmetric(
      horizontal: Insets.xl,
      vertical: Insets.md,
    ),
    tableHeadAlign: TextAlign.left,
    tableBorder: TableBorder.all(
      color: context.colorScheme.onBackground!,
      width: 1,
    ),

    // Links
    a: t.bodyLgMedium.copyWith(
      color: const Color(0xffA855F7),
      decoration: TextDecoration.underline,
      decorationColor: const Color(0x88A855F7),
      fontFamily: fontFamily,
    ),

    // Horizontal rule
    horizontalRuleDecoration: BoxDecoration(
      border: Border(
        top: BorderSide(color: context.colorScheme.onBackground!, width: 1),
      ),
    ),
  );
}
