import 'package:flutter/material.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/style/app_size.dart';
import 'package:portfolio/widgets/appbar/my_app_bar.dart';
import 'package:portfolio/widgets/background_blur.dart';
import 'package:portfolio/widgets/my_footer.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({super.key, required this.slivers});
  final List<Widget> slivers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedDotsBackground(
            dotCount: 60,
            dotColor: context.colorScheme.primary,
            dotSize: 3,
          ),
          // =============================================
          // ORIGINAL CODE WITH SCROLL PROBLEM:
          // =============================================
          //
          // PROBLEMATIC CODE:
          // Align(
          //   alignment: Alignment.topCenter,
          //   child: Container(
          //     constraints: BoxConstraints(maxWidth: Insets.maxwidth), // ← THIS WAS THE ISSUE
          //     child: CustomScrollView(
          //       slivers: [
          //         ...slivers,
          //       ],
          //     ),
          //   ),
          // ),
          //
          // ISSUE EXPLANATION:
          // The Container with maxWidth constraint was limiting the ENTIRE scrollable area
          // to only Insets.maxwidth wide. So when users tried to scroll by clicking/touching
          // outside that width (in the empty areas), it wouldn't work because the scrollable
          // widget itself was only as wide as your content.
          //
          // VISUAL EXPLANATION OF PROBLEM:
          // ┌────────────────────────────────────────┐ ← Window
          // │ ┌─────────────┐                         │
          // │ │   Scroll    │ ← Only this area is     │
          // │ │    Area     │    scrollable           │
          // │ └─────────────┘                         │
          // └────────────────────────────────────────┘
          //
          // =============================================
          // FIXED CODE: Full-width scrollable area
          // =============================================
          //
          // SOLUTION: Use Positioned.fill to make scroll view take full window width,
          // then center and constrain individual content sections.
          //
          // VISUAL EXPLANATION OF SOLUTION:
          // ┌────────────────────────────────────────┐ ← Window
          // │ ┌──────────────────────────────────────┐ │
          // │ │           Scroll Area                │ │ ← Entire window width
          // │ │                                      │ │    is scrollable
          // │ │  ┌─────────────┐                     │ │
          // │ │  │   Content   │ ← Content centered  │ │
          // │ │  └─────────────┘    within scroll    │ │
          // │ └──────────────────────────────────────┘ │
          // └────────────────────────────────────────┘
          //
          // RESULT:
          // - Scrollable area = Full window width (scroll from anywhere)
          // - Content area = Constrained to Insets.maxwidth and centered
          // - Best of both worlds: Clean centered design + full-width scrolling
          //
          Positioned.fill(
            child: Container(
              padding: EdgeInsets.only(top: context.insets.appBarHeight),
              child: CustomScrollView(
                slivers: [
                  ...slivers,
                  SliverToBoxAdapter(child: MyFooter()), // SliverToBoxAdapter
                ],
              ), // CustomScrollView
            ), // Container
          ), // Align
          const MyAppBar(),
        ],
      ), // Stack
    ); // Scaffold
  }
}
