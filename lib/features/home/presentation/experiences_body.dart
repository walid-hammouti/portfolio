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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        HomeTitleSubtitle(
          title: context.texts.experince,
          subtitle: context.texts.experincedesc,
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
              height: 260 * explen,
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
            isLeft: true,
            top: 1,
            title: context.texts.mobileDevelopment,
            texts: [
              context.texts.mobileDevText1,
              context.texts.mobileDevText2,
              context.texts.mobileDevText3,
              context.texts.mobileDevText4,
            ],
          ),

          PositionedExpirenceItem(
            isLeft: false,
            top: 2,
            title: context.texts.aiMachineLearning,
            texts: [
              context.texts.aiText1,
              context.texts.aiText2,
              context.texts.aiText3,
            ],
          ),

          PositionedExpirenceItem(
            isLeft: true,
            top: 3,
            title: context.texts.desktopDevelopment,
            texts: [context.texts.desktopText1, context.texts.desktopText2],
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
            title: context.texts.mobileDevelopment,
            texts: [
              context.texts.mobileDevText1,
              context.texts.mobileDevText2,
              context.texts.mobileDevText3,
              context.texts.mobileDevText4,
            ],
          ),
          SizedBox(
            height: 60,
            child: DottedLine(
              dashColor: context.colorScheme.onBackground,
              direction: Axis.vertical,
            ), // DottedLine
          ),
          ExperiencesItem(
            title: context.texts.aiMachineLearning,
            texts: [
              context.texts.aiText1,
              context.texts.aiText2,
              context.texts.aiText3,
            ],
          ),
          SizedBox(
            height: 60,
            child: DottedLine(
              dashColor: context.colorScheme.onBackground,
              direction: Axis.vertical,
            ), // DottedLine
          ),
          ExperiencesItem(
            title: context.texts.desktopDevelopment,
            texts: [context.texts.desktopText1, context.texts.desktopText2],
          ),

          // SizedBox
        ],
      ), // Column
    ); // Center
  }
}

const expwidth = 300.0;
const expheight = 360.0;

class PositionedExpirenceItem extends StatelessWidget {
  PositionedExpirenceItem({
    required this.top,
    super.key,
    required this.title,
    required this.texts,
    required this.isLeft,
  });
  final String title;
  final List<String> texts;
  final double top;
  bool isLeft;

  // Usage
  @override
  Widget build(BuildContext context) {
    bool isRTL = context.isRTL;
    return Positioned(
      top: top * 300,
      right: isRTL ? (isLeft ? 0 : 400) : (isLeft ? 400 : 0),
      left: isRTL ? (isLeft ? 400 : 0) : (isLeft ? 0 : 400),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children:
            isLeft
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
