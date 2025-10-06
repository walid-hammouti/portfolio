import 'package:flutter/material.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/style/app_colors.dart';
import 'package:portfolio/widgets/seo_text.dart';
import 'package:url_launcher/url_launcher.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final String? projectlink;
  const PrimaryButton({super.key, required this.title, this.projectlink});

  Future<void> _launchUrl() async {
    final Uri url = Uri.parse(projectlink!);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $projectlink');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      onPressed: () {
        _launchUrl();
      },
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: AppColors.gray[100],
        ), // TextStyle
      ), // Text
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
