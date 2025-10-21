import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/widgets/seo_text.dart';
import 'package:portfolio/widgets/styled_button.dart';
import 'package:portfolio/widgets/styled_card.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_style.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:open_filex/open_filex.dart';

Future<void> installApk(String apkPath) async {
  try {
    final result = await OpenFilex.open(apkPath);
    if (result.type == ResultType.done) {
      print('✅ Installation started successfully');
    } else {
      print('⚠️ Failed to open APK: ${result.message}');
    }
  } catch (e) {
    print('❌ Error installing APK: $e');
  }
}

Future<void> openUrl(String url) async {
  final Uri uri = Uri.parse(url);

  if (await canLaunchUrl(uri)) {
    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication, // Opens in browser or external app
    );
  } else {
    throw Exception('Could not launch $url');
  }
}

class ProjectItemDesktop extends StatelessWidget {
  ProjectItemDesktop({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.projectlink,
    this.apklink,
    this.isWebProject = false,
    this.showlink = true,
  });

  final String image;
  final String title;
  final String description;
  final String projectlink;
  final String? apklink;
  final bool isWebProject;
  final bool showlink;

  @override
  Widget build(BuildContext context) {
    return StyledCard(
      height: 500,
      width: 900,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              image,
              fit: BoxFit.contain,
              height: 500,
              width: 200,
            ),
          ),
          Gap(32),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SEOText(
                        title,
                        style: context.textStyle.bodyLgBold.copyWith(
                          color: context.colorScheme.onBackground,
                          height: 1.2,
                        ),
                        textRendererStyle: TextRendererStyle.header4,
                      ),
                      Gap(40),
                      SEOText(
                        description,
                        style: context.textStyle.bodyMdMedium.copyWith(
                          color: context.colorScheme.onSurface,
                          height: 1.6,
                        ),
                        maxlines: 6,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Gap(16),
                    ],
                  ),
                  Row(
                    children: [
                      if (!isWebProject)
                        Expanded(
                          child: PrimaryButton(
                            title: "Try App",
                            onPressed: () async {
                              await installApk(apklink!);
                            },
                          ),
                        ),
                      Gap(16),
                      if (showlink)
                        Expanded(
                          child: PrimaryButton(
                            onPressed: () {
                              openUrl(projectlink);
                            },
                            title: "Project link",
                            projectlink: projectlink,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectItemMobile extends StatelessWidget {
  ProjectItemMobile({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.projectlink,
    this.apklink,
    this.isWebProject = false,
  });

  final String image;
  final String title;
  final String description;
  final String projectlink;
  final String? apklink;
  final bool isWebProject;

  @override
  Widget build(BuildContext context) {
    return StyledCard(
      height: 600,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),

            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                image,
                fit: BoxFit.contain,
                width: double.infinity,
                height: 200,
              ),
            ),
            Spacer(),
            SEOText(
              title,
              style: context.textStyle.bodyLgBold.copyWith(
                color: context.colorScheme.onBackground,
                height: 1.2,
              ),
              textRendererStyle: TextRendererStyle.header4,
            ),
            Gap(16),
            SEOText(
              description,
              style: context.textStyle.bodyMdMedium.copyWith(
                color: context.colorScheme.onSurface,
                height: 1.6,
              ),
              maxlines: 20,
              overflow: TextOverflow.ellipsis,
            ),
            Gap(24),
            Column(
              children: [
                if (!isWebProject)
                  SizedBox(
                    width: double.infinity,
                    child: PrimaryButton(
                      title: "Try App",
                      onPressed: () async {
                        await installApk(apklink!);
                      },
                    ),
                  ),
                if (!isWebProject) Gap(12),
                SizedBox(
                  width: double.infinity,
                  child: PrimaryButton(
                    title: "Project link",
                    projectlink: projectlink,
                    onPressed: () {
                      openUrl(projectlink);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
