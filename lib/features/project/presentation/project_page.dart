import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/features/project/presentation/project_item.dart';
import 'package:portfolio/style/app_size.dart';

import 'package:portfolio/widgets/app_scaffold.dart';
import 'package:portfolio/widgets/seo_text.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      slivers: [
        SliverToBoxAdapter(
          child: context.isDesktop ? ProjectPageDesktop() : ProjectPagePhone(),
        ),
      ],
    );
  }
}

class ProjectPageDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: Insets.maxwidth),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
        child: Column(
          children: [
            Gap(Insets.xxxl),
            SEOText(
              context.texts.whatIBuilt,
              style: context.textStyle.titleLgBold,
              gradient: LinearGradient(
                colors: [
                  context.colorScheme.onBackground,
                  context.colorScheme.primary,
                ],
              ),
            ),
            Gap(Insets.xl),

            SEOText(
              context.texts.projectsSubtitle,
              style: context.textStyle.bodyLgMedium.copyWith(
                color: context.colorScheme.onSurface,
              ),
            ),
            Gap(Insets.xxxl),

            ProjectItemDesktop(
              showlink: false,
              apklink:
                  "https://github.com/walid-hammouti/Reguelni_App/releases/download/v1.0.0/Riguelni.apk",
              projectlink: "",
              image: "assets/images/RigeulniScreenshot.jpg",
              title: context.texts.projectRiguelniTitle,
              description: context.texts.projectRiguelniDesc,
            ),
            Gap(Insets.xxl),

            ProjectItemDesktop(
              apklink:
                  "https://github.com/walid-hammouti/fluentnow/releases/download/v1.0.0/FluentNow.apk",
              projectlink: "https://github.com/walid-hammouti/fluentnow",
              image: "assets/images/fluentnowScreenshot.jpg",
              title: context.texts.projectFluentNowTitle,
              description: context.texts.projectFluentNowDesc,
            ),
            Gap(Insets.xxl),

            ProjectItemDesktop(
              isWebProject: true,
              projectlink: "https://github.com/walid-hammouti/portfolio",
              image: "assets/images/portfolioScreenshot.png",
              title: context.texts.projectPortfolioTitle,
              description: context.texts.projectPortfolioDesc,
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectPagePhone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: Insets.maxwidth),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
        child: Column(
          children: [
            Gap(Insets.xxxl),
            SEOText(
              "What I’ve Built",
              style: context.textStyle.titleLgBold,
              gradient: LinearGradient(
                colors: [
                  context.colorScheme.onBackground,
                  context.colorScheme.primary,
                ],
              ),
            ),
            Gap(Insets.xl),

            SEOText(
              "A glimpse into my journey — building meaningful projects that solve problems and inspire ideas.",
              style: context.textStyle.bodyLgMedium.copyWith(
                color: context.colorScheme.onSurface,
              ),
            ),
            Gap(Insets.xxxl),

            ProjectItemMobile(
              apklink: "",
              projectlink: "",
              image: "assets/images/RigeulniScreenshot.jpg",
              title: context.texts.projectRiguelniTitle,
              description: context.texts.projectRiguelniDesc,
            ),
            Gap(Insets.xxl),

            ProjectItemMobile(
              apklink: "",
              projectlink: "",
              image: "assets/images/fluentnowScreenshot.jpg",
              title: context.texts.projectFluentNowTitle,
              description: context.texts.projectFluentNowDesc,
            ),
            Gap(Insets.xxl),

            ProjectItemMobile(
              isWebProject: true,
              projectlink: "",
              image: "assets/images/portfolioScreenshot.png",
              title: context.texts.projectPortfolioTitle,
              description: context.texts.projectPortfolioDesc,
            ),
          ],
        ),
      ),
    );
  }
}
