import 'package:flutter/material.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/features/course/presentation/course_item.dart';

class HomeCoursesList extends StatelessWidget {
  const HomeCoursesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [_HomeCoursesListDesktop()]);
  }
}

class _HomeCoursesListDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
      child: Row(
        children: [
          Expanded(child: CourseItem()),
          Expanded(child: CourseItem()),
          Expanded(child: CourseItem()),
        ],
      ),
    );
  }
}
