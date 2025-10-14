import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/features/home/presentation/experiences_body.dart';
import 'package:portfolio/features/home/presentation/hero_images.dart';
import 'package:portfolio/features/home/presentation/hero_widget.dart';
import 'package:portfolio/features/home/presentation/home_TechStack_list.dart';
import 'package:portfolio/style/app_size.dart';
import 'package:portfolio/widgets/app_scaffold.dart';
import 'package:portfolio/widgets/background_blur.dart';
import 'package:portfolio/widgets/appbar/my_app_bar.dart';
import 'package:portfolio/widgets/my_footer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      slivers: [
        SliverToBoxAdapter(
          child: Center(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: Insets.maxwidth,
                minHeight:
                    context.insets.vh(context) -
                    context.insets.appBarHeight, // 100vh
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.insets.padding,
                ),
                child: HeroWidget(),
              ),
            ),
          ),
        ),

        // Courses section - centered but scrollable area is full width
        SliverToBoxAdapter(
          child: Center(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: Insets.maxwidth,
                minHeight:
                    context.insets.vh(context) - context.insets.appBarHeight,
              ),
              child: HomeTechstackList(),
            ),
          ),
        ),
        // Experiences section - centered but scrollable area is full width
        SliverToBoxAdapter(
          child: Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: Insets.maxwidth),
              child: ExperiencesBody(),
            ),
          ),
        ),
        // Footer section - centered but scrollable area is full width
      ],
    );
  }
}
