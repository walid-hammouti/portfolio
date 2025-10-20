import 'package:flutter/material.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/style/app_colors.dart';
import 'package:portfolio/widgets/seo_text.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final String? projectlink;
  final VoidCallback? onPressed;
  final double? height;
  final double? width;
  const PrimaryButton({
    super.key,
    required this.title,
    this.projectlink,
    this.onPressed,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? null,
      width: width ?? null,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: AppColors.gray[100],
          ), // TextStyle
        ), // Text
      ),
    ); // ElevatedButton
  }
}

class OutlineButton extends StatelessWidget {
  final String title;
  const OutlineButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      child: SEOText(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: context.colorScheme.onBackground,
        ), // TextStyle
      ), // SEOText
    ); // OutlineButton
  }
}
