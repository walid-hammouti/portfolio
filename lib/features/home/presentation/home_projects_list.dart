import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/features/course/presentation/project_item.dart';
import 'package:portfolio/widgets/home_title_subtitle.dart';

class HomeCoursesList extends StatelessWidget {
  const HomeCoursesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeTitleSubtitle(
          title: context.texts.projects,
          subtitle: context.texts.projectsdesc,
        ),
        const Gap(32),
        context.isDesktop ? _HomeCoursesListDesktop() : _HomeCoursesListPhone(),
      ],
    );
  }
}

class _HomeCoursesListDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
      child: Row(
        children: [
          Expanded(
            child: ProjectItem(
              projectlink: "https://riguelni-docs.vercel.app/",
              image: "assets/images/app.png",
              title: "Riguelni - Freelance platfrom",
              description:
                  "RIGELNI is a modern freelance marketplace that connects skilled professionals with clients looking for services. The platform provides a secure and intuitive environment where users can both buy and sell services, making it a flexible solution for freelancers and businesses alike.With robust features such as real-time chat, and an easy-to-use dashboard, RIGELNI aims to streamline freelance transactions and project management.",
            ),
          ),
          Gap(16),
          Expanded(
            child: ProjectItem(
              projectlink: "",
              image: "assets/images/app.png",
              title: "Riguelni - Freelance platfrom",
              description:
                  "RIGELNI is a modern freelance marketplace that connects skilled professionals with clients looking for services. The platform provides a secure and intuitive environment where users can both buy and sell services, making it a flexible solution for freelancers and businesses alike.With robust features such as real-time chat, and an easy-to-use dashboard, RIGELNI aims to streamline freelance transactions and project management.",
            ),
          ),
          Gap(16),

          Expanded(
            child: ProjectItem(
              projectlink: "",
              image: "assets/images/app.png",
              title: "Riguelni - Freelance platfrom",
              description:
                  "RIGELNI is a modern freelance marketplace that connects skilled professionals with clients looking for services. The platform provides a secure and intuitive environment where users can both buy and sell services, making it a flexible solution for freelancers and businesses alike.With robust features such as real-time chat, and an easy-to-use dashboard, RIGELNI aims to streamline freelance transactions and project management.",
            ),
          ),
        ],
      ),
    );
  }
}

class _HomeCoursesListPhone extends StatelessWidget {
  const _HomeCoursesListPhone();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(
              width: 240,
              child: ProjectItem(
                projectlink: "https://riguelni-docs.vercel.app/",
                image: "assets/images/app.png",
                title: "Riguelni - Freelance platfrom",
                description:
                    "RIGELNI is a modern freelance marketplace that connects skilled professionals with clients looking for services. The platform provides a secure and intuitive environment where users can both buy and sell services, making it a flexible solution for freelancers and businesses alike.With robust features such as real-time chat, and an easy-to-use dashboard, RIGELNI aims to streamline freelance transactions and project management.",
              ),
            ), // SizedBox
            SizedBox(
              width: 240,
              child: ProjectItem(
                projectlink: "",
                image: "assets/images/app.png",
                title: "Riguelni - Freelance platfrom",
                description:
                    "RIGELNI is a modern freelance marketplace that connects skilled professionals with clients looking for services. The platform provides a secure and intuitive environment where users can both buy and sell services, making it a flexible solution for freelancers and businesses alike.With robust features such as real-time chat, and an easy-to-use dashboard, RIGELNI aims to streamline freelance transactions and project management.",
              ),
            ), // SizedBox
            SizedBox(
              width: 240,
              child: ProjectItem(
                projectlink: "",
                image: "assets/images/app.png",
                title: "Riguelni - Freelance platfrom",
                description:
                    "RIGELNI is a modern freelance marketplace that connects skilled professionals with clients looking for services. The platform provides a secure and intuitive environment where users can both buy and sell services, making it a flexible solution for freelancers and businesses alike.With robust features such as real-time chat, and an easy-to-use dashboard, RIGELNI aims to streamline freelance transactions and project management.",
              ),
            ), // SizedBox
          ],
        ), // Row
      ), // SingleChildScrollView
    ); // Center
  }
}
