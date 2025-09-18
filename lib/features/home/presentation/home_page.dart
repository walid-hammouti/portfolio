import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/features/home/presentation/experiences_body.dart';
import 'package:portfolio/features/home/presentation/hero_images.dart';
import 'package:portfolio/features/home/presentation/hero_widget.dart';
import 'package:portfolio/features/home/presentation/home_courses_list.dart';
import 'package:portfolio/style/app_size.dart';
import 'package:portfolio/widgets/background_blur.dart';
import 'package:portfolio/widgets/appbar/my_app_bar.dart';
import 'package:portfolio/widgets/my_footer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundBlur(),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              constraints: BoxConstraints(maxWidth: Insets.maxwidth),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: HeroWidget(),
                    ),
                  ),
                  SliverToBoxAdapter(child: HomeCoursesList()),
                  SliverToBoxAdapter(child: ExperiencesBody()),
                  SliverToBoxAdapter(child: MyFooter()),
                ],
              ),
            ),
          ),
          const MyAppBar(),
          // Other widgets can be added here
        ],
      ),
    );
  }
}
