import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/features/home/presentation/techStack_item.dart';
import 'package:portfolio/features/project/presentation/project_item.dart';
import 'package:portfolio/widgets/home_title_subtitle.dart';

final techStackItems = [
  {"image": "assets/icons/tech_stack/dart.svg", "title": "dart"},
  {"image": "assets/icons/tech_stack/flutter.svg", "title": "flutter"},

  {
    "image": "assets/icons/tech_stack/folder-type-cubit-opened.svg",
    "title": "cubit",
  },
  {"image": "assets/icons/tech_stack/riverpod.svg", "title": "riverpod"},

  {"image": "assets/icons/tech_stack/supabase-icon.svg", "title": "supabase"},
  {"image": "assets/icons/tech_stack/firebase.svg", "title": "firebase"},
  {"image": "assets/icons/tech_stack/appwrite.svg", "title": "app write"},
  {"image": "assets/icons/tech_stack/vercel-light.svg", "title": "vercel"},

  {"image": "assets/icons/tech_stack/python.svg", "title": "python"},
  {"image": "assets/icons/tech_stack/matplotlib.svg", "title": "matplotlib"},
  {"image": "assets/icons/tech_stack/numpy.svg", "title": "numpy"},
  {"image": "assets/icons/tech_stack/pandas.svg", "title": "pandas"},
  {"image": "assets/icons/tech_stack/scikitlearn.svg", "title": "scikit-learn"},
  {"image": "assets/icons/tech_stack/vscode.svg", "title": "vscode"},
  {
    "image": "assets/icons/tech_stack/androidstudio.svg",
    "title": "android studio",
  },
  {"image": "assets/icons/tech_stack/git-icon.svg", "title": "git"},
  {"image": "assets/icons/tech_stack/github-light.svg", "title": "github"},
  {"image": "assets/icons/tech_stack/linux.svg", "title": "linux"},
  {"image": "assets/icons/tech_stack/postman-icon.svg", "title": "postman"},
  {"image": "assets/icons/tech_stack/bash-icon.svg", "title": "bash"},
  {"image": "assets/icons/tech_stack/c.svg", "title": "c"},
  {"image": "assets/icons/tech_stack/gtk-light.svg", "title": "gtk"},
  {"image": "assets/icons/tech_stack/java.svg", "title": "java"},
  {"image": "assets/icons/tech_stack/jira.svg", "title": "jira"},
];

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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: GridView.builder(
          shrinkWrap: true, // Changed to false to allow scrolling
          physics: NeverScrollableScrollPhysics(), // Changed to allow scrolling
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
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
    ); // Center
  }
}
