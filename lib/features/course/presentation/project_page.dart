import 'package:flutter/material.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/features/course/presentation/project_item.dart';
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
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        context.mq.size.width ~/ 300 > 3
                            ? 3
                            : context.mq.size.width ~/ 300,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 24,
                    childAspectRatio: 0.8,
                  ),
                  itemBuilder: (context, index) {
                    return ProjectItem();
                  },
                  itemCount: 10,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
