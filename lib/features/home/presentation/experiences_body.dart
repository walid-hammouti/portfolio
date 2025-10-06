import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/widgets/home_title_subtitle.dart';
import 'package:portfolio/widgets/styled_card.dart';

const explen = 6.0;
const expPointsize = 16.0;

class ExperiencesBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeTitleSubtitle(
          title: context.texts.techStack,
          subtitle: context.texts.techStackDesc,
        ),
        const Gap(32),
        context.isDesktop ? DesktopExperiencesBody() : PhoneExperiencesBody(),
      ],
    );
  }
}

class DesktopExperiencesBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Stack(
        children: [
          Center(
            child: Container(
              width: 3,
              height: 220 * explen,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    context.colorScheme.primary.withOpacity(0),
                    context.colorScheme.primary,
                    context.colorScheme.primary.withOpacity(0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          PositionedExpirenceItem(
            isRight: true,
            top: 1,
            title: 'Mobile Development',
            texts: [
              'Built cross-platform mobile apps using Flutter and Dart',
              'Integrated Supabase for authentication and real-time database',
              'Designed responsive light and dark themes for better UX',
              'Used Cubit, BLoC, Provider, and Riverpod for scalable state management',
            ],
          ),

          PositionedExpirenceItem(
            isRight: false,
            top: 2,
            title: 'AI & Machine Learning',
            texts: [
              'Currently learning and exploring machine learning techniques',
              'Performing data analysis and preprocessing using pandas and NumPy',
              'Visualizing datasets and model performance with Matplotlib',
            ],
          ),

          PositionedExpirenceItem(
            isRight: true,
            top: 3,
            title: 'Desktop Development',
            texts: [
              'Built a Student Management System using C and GTK3',
              'Developed a Linear Algebra Calculator with Python and Tkinter',
            ],
          ),
        ],
      ),
    );
  }
}

class PhoneExperiencesBody extends StatelessWidget {
  const PhoneExperiencesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ExperiencesItem(
            title: 'Mobile Development',
            texts: [
              'Built cross-platform mobile apps using Flutter and Dart',
              'Integrated Supabase for authentication and real-time database',
              'Designed responsive light and dark themes for better UX',
              'Used Cubit, BLoC, Provider, and Riverpod for scalable state management',
            ],
          ),
          SizedBox(
            height: 60,
            child: DottedLine(
              dashColor: Colors.white,
              direction: Axis.vertical,
            ), // DottedLine
          ),
          ExperiencesItem(
            title: 'AI & Machine Learning',
            texts: [
              'Currently learning and exploring machine learning techniques',
              'Performing data analysis and preprocessing using pandas and NumPy',
              'Visualizing datasets and model performance with Matplotlib',
            ],
          ),
          SizedBox(
            height: 60,
            child: DottedLine(
              dashColor: Colors.white,
              direction: Axis.vertical,
            ), // DottedLine
          ),
          ExperiencesItem(
            title: 'Desktop Development',
            texts: [
              'Built a Student Management System using C and GTK3',
              'Developed a Linear Algebra Calculator with Python and Tkinter',
            ],
          ),

          // SizedBox
        ],
      ), // Column
    ); // Center
  }
}

const expwidth = 300.0;
const expheight = 320.0;

class PositionedExpirenceItem extends StatelessWidget {
  const PositionedExpirenceItem({
    required this.top,
    super.key,
    required this.title,
    required this.texts,
    required this.isRight,
  });
  final String title;
  final List<String> texts;
  final double top;
  final bool isRight;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top * 240,
      right: isRight ? 400 : 0,
      left: isRight ? 0 : 400,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children:
            isRight
                ? [
                  ExperiencesItem(title: title, texts: texts),
                  SizedBox(
                    width: 100,
                    child: DottedLine(
                      dashColor: context.colorScheme.onBackground,
                    ),
                  ),
                  Container(
                    width: expPointsize,
                    height: expPointsize,
                    decoration: BoxDecoration(
                      color: context.colorScheme.onBackground.withOpacity(0.25),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Container(
                        width: expPointsize / 2,
                        height: expPointsize / 2,
                        decoration: BoxDecoration(
                          color: context.colorScheme.onBackground,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                ]
                : [
                  Container(
                    width: expPointsize,
                    height: expPointsize,
                    decoration: BoxDecoration(
                      color: context.colorScheme.onBackground.withOpacity(0.25),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Container(
                        width: expPointsize / 2,
                        height: expPointsize / 2,
                        decoration: BoxDecoration(
                          color: context.colorScheme.onBackground,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: DottedLine(
                      dashColor: context.colorScheme.onBackground,
                    ),
                  ),
                  ExperiencesItem(title: title, texts: texts),
                ],
      ),
    );
  }
}

class ExperiencesItem extends StatelessWidget {
  const ExperiencesItem({required this.texts, required this.title, super.key});
  final String title;
  final List<String> texts;
  @override
  Widget build(BuildContext context) {
    return StyledCard(
      height: expheight,
      width: expwidth,
      borderEffect: true,
      child: Column(
        children: [
          Text(
            title,
            style: context.textStyle.bodyLgBold.copyWith(
              color: context.colorScheme.onBackground,
            ),
          ),
          const Gap(8),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (final text in texts) ...[
                  _ExperienceDescreptionItem(text: text),
                  const Gap(8),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ExperienceDescreptionItem extends StatelessWidget {
  const _ExperienceDescreptionItem({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 4,
          decoration: BoxDecoration(
            color: context.colorScheme.onBackground,
            shape: BoxShape.circle,
          ),
        ),
        Gap(6),
        Expanded(
          child: Text(
            text,
            style: context.textStyle.bodyMdMedium.copyWith(
              color: context.colorScheme.onSurface,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
