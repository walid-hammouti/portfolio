import 'package:flutter/material.dart';
import 'package:portfolio/widgets/app_scaffold.dart';

class ProjectDetailsPage extends StatelessWidget {
  final String projectName;

  const ProjectDetailsPage({super.key, required this.projectName});
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      slivers: [
        SliverToBoxAdapter(
          child: Container(height: 1000, width: double.infinity),
        ),
      ],
    );
  }
}
