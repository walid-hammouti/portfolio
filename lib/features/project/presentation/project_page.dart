import 'package:flutter/material.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/features/project/presentation/project_item.dart';
import 'package:portfolio/style/app_size.dart';
import 'package:portfolio/widgets/app_scaffold.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      slivers: [
        SliverToBoxAdapter(
          child: Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: Insets.maxwidth),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal:
                      context
                          .insets
                          .padding, // ← Match home page padding structure
                ),
                child: const SizedBox(),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: Insets.maxwidth),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.insets.padding,
                ),
                child: ProjectItem(
                  projectlink: "",
                  image: "assets/images/app.png",
                  title: "Riguelni - Freelance platfrom",
                  description:
                      "RIGELNI is a modern freelance marketplace that connects skilled professionals with clients looking for services. The platform provides a secure and intuitive environment where users can both buy and sell services, making it a flexible solution for freelancers and businesses alike.With robust features such as real-time chat, and an easy-to-use dashboard, RIGELNI aims to streamline freelance transactions and project management.",
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
