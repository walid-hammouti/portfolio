import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/features/project/presentation/project_item.dart';
import 'package:portfolio/style/app_size.dart';

import 'package:portfolio/widgets/app_scaffold.dart';
import 'package:portfolio/widgets/seo_text.dart';

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

            ProjectItemDesktop(
              apklink: "",
              projectlink: "",
              image: "assets/images/RigeulniScreenshot.jpg",
              title: "Riguelni - Freelance platfrom",
              description:
                  "RIGELNI is a modern freelance marketplace that connects skilled professionals with clients looking for services. The platform provides a secure and intuitive environment where users can both buy and sell services, making it a flexible solution for freelancers and businesses alike.With robust features such as real-time chat, and an easy-to-use dashboard, RIGELNI aims to streamline freelance transactions and project management.",
            ),
            Gap(Insets.xxl),

            ProjectItemDesktop(
              apklink: "",
              projectlink: "",
              image: "assets/images/fluentnowScreenshot.jpg",
              title: "FluentNow — Your Smart Language School Companion",
              description:
                  "FluentNow is a modern mobile app designed for private language schools to connect with their students. It allows users to easily explore available language courses, discover new programs, and stay informed about discounts, upcoming events, and school news. Students can register for courses directly through the app and access detailed information about each program — all in one simple, elegant platform.",
            ),
            Gap(Insets.xxl),

            ProjectItemDesktop(
              isWebProject: true,
              projectlink: "",
              image: "assets/images/portfolioScreenshot.png",
              title: "My Flutter Web Portfolio",
              description:
                  "A modern and dynamic portfolio showcasing my projects, skills, and creative journey in software development. From intuitive Flutter interfaces to responsive web solutions, this portfolio reflects my passion for building smart, user-centered technologies. Explore my featured works, learn about my experience, and see how I turn ideas into impactful digital products.",
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
              title: "Riguelni - Freelance platfrom",
              description:
                  "RIGELNI is a modern freelance marketplace that connects skilled professionals with clients looking for services. The platform provides a secure and intuitive environment where users can both buy and sell services, making it a flexible solution for freelancers and businesses alike.With robust features such as real-time chat, and an easy-to-use dashboard, RIGELNI aims to streamline freelance transactions and project management.",
            ),
            Gap(Insets.xxl),

            ProjectItemMobile(
              apklink: "",
              projectlink: "",
              image: "assets/images/fluentnowScreenshot.jpg",
              title: "FluentNow — Your Smart Language School Companion",
              description:
                  "FluentNow is a modern mobile app designed for private language schools to connect with their students. It allows users to easily explore available language courses, discover new programs, and stay informed about discounts, upcoming events, and school news. Students can register for courses directly through the app and access detailed information about each program — all in one simple, elegant platform.",
            ),
            Gap(Insets.xxl),

            ProjectItemMobile(
              isWebProject: true,
              projectlink: "",
              image: "assets/images/portfolioScreenshot.png",
              title: "My Flutter Web Portfolio",
              description:
                  "A modern and dynamic portfolio showcasing my projects, skills, and creative journey in software development. From intuitive Flutter interfaces to responsive web solutions, this portfolio reflects my passion for building smart, user-centered technologies. Explore my featured works, learn about my experience, and see how I turn ideas into impactful digital products.",
            ),
          ],
        ),
      ),
    );
  }
}
