import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/features/home/presentation/techStack_item.dart';
import 'package:portfolio/features/project/presentation/project_item.dart';
import 'package:portfolio/widgets/home_title_subtitle.dart';

class HomeTechstackList extends StatelessWidget {
  HomeTechstackList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        HomeTitleSubtitle(
          title: context.texts.techStack,
          subtitle: context.texts.techStackDesc,
        ),
        const Gap(44),
        context.isDesktop ? _HomeCoursesListDesktop() : _HomeCoursesListPhone(),
      ],
    );
  }
}

class _HomeCoursesListDesktop extends StatelessWidget {
  final techStackItems = [
    {"image": "icons/tech_stack/dart.svg", "title": "dart"},
    {"image": "icons/tech_stack/flutter.svg", "title": "flutter"},

    {
      "image": "icons/tech_stack/folder-type-cubit-opened.svg",
      "title": "cubit",
    },
    {"image": "icons/tech_stack/riverpod.svg", "title": "riverpod"},

    {"image": "icons/tech_stack/supabase-icon.svg", "title": "supabase"},
    {"image": "icons/tech_stack/firebase.svg", "title": "firebase"},
    {"image": "icons/tech_stack/appwrite.svg", "title": "app write"},
    {"image": "icons/tech_stack/vercel-light.svg", "title": "vercel"},

    {"image": "icons/tech_stack/python.svg", "title": "python"},
    {"image": "icons/tech_stack/matplotlib.svg", "title": "matplotlib"},
    {"image": "icons/tech_stack/numpy.svg", "title": "numpy"},
    {"image": "icons/tech_stack/pandas.svg", "title": "pandas"},
    {"image": "icons/tech_stack/scikitlearn.svg", "title": "scikit-learn"},
    {"image": "icons/tech_stack/vscode.svg", "title": "vscode"},
    {"image": "icons/tech_stack/androidstudio.svg", "title": "android studio"},
    {"image": "icons/tech_stack/git-icon.svg", "title": "git"},
    {"image": "icons/tech_stack/github-light.svg", "title": "github"},
    {"image": "icons/tech_stack/linux.svg", "title": "linux"},
    {"image": "icons/tech_stack/postman-icon.svg", "title": "postman"},
    {"image": "icons/tech_stack/bash-icon.svg", "title": "bash"},
    {"image": "icons/tech_stack/c.svg", "title": "c"},
    {"image": "icons/tech_stack/gtk-light.svg", "title": "gtk"},
    {"image": "icons/tech_stack/java.svg", "title": "java"},
    {"image": "icons/tech_stack/jira.svg", "title": "jira"},
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: GridView.builder(
          shrinkWrap: true, // makes it take only needed space
          physics:
              const NeverScrollableScrollPhysics(), // disables internal scrolling
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: techStackItems.length,
          itemBuilder: (context, index) {
            return TechstackItem(
              image: techStackItems[index]["image"]!,
              title: techStackItems[index]["title"]!,
            );
          },
        ),
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
              width: 300,
              child: ProjectItem(
                projectlink: "https://riguelni-docs.vercel.app/",
                image: "assets/images/app.png",
                title: "Riguelni - Freelance platfrom",
                description:
                    "RIGELNI is a modern freelance marketplace that connects skilled professionals with clients looking for services. The platform provides a secure and intuitive environment where users can both buy and sell services, making it a flexible solution for freelancers and businesses alike.With robust features such as real-time chat, and an easy-to-use dashboard, RIGELNI aims to streamline freelance transactions and project management.",
              ),
            ),
            Gap(16), // SizedBox
            SizedBox(
              width: 300,
              child: ProjectItem(
                projectlink: "",
                image: "assets/images/app.png",
                title: "Riguelni - Freelance platfrom",
                description:
                    "RIGELNI is a modern freelance marketplace that connects skilled professionals with clients looking for services. The platform provides a secure and intuitive environment where users can both buy and sell services, making it a flexible solution for freelancers and businesses alike.With robust features such as real-time chat, and an easy-to-use dashboard, RIGELNI aims to streamline freelance transactions and project management.",
              ),
            ),
            Gap(16), // SizedBox
            // SizedBox
            SizedBox(
              width: 300,
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
