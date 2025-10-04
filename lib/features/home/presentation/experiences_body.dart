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
              height: 170 * explen,
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
          for (int i = 0; i < explen; i++) ...[
            if (i.isEven)
              Positioned(
                top: i * 150,
                left: 0,
                right: 400,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ExperiencesItem(),
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
                        color: context.colorScheme.onBackground.withOpacity(
                          0.25,
                        ),
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
                  ],
                ),
              )
            else
              Positioned(
                top: i * 150,
                right: 0,
                left: 400,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: expPointsize,
                      height: expPointsize,
                      decoration: BoxDecoration(
                        color: context.colorScheme.onBackground.withOpacity(
                          0.25,
                        ),
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
                    ExperiencesItem(),
                  ],
                ),
              ),
          ],
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
          ExperiencesItem(),
          SizedBox(
            height: 60,
            child: DottedLine(
              dashColor: Colors.white,
              direction: Axis.vertical,
            ), // DottedLine
          ),
          ExperiencesItem(),
          SizedBox(
            height: 60,
            child: DottedLine(
              dashColor: Colors.white,
              direction: Axis.vertical,
            ), // DottedLine
          ),
          ExperiencesItem(),
          SizedBox(
            height: 60,
            child: DottedLine(
              dashColor: Colors.white,
              direction: Axis.vertical,
            ), // DottedLine
          ),
          ExperiencesItem(),

          // SizedBox
        ],
      ), // Column
    ); // Center
  }
}

const expwidth = 300.0;
const expheight = 230.0;

class ExperiencesItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StyledCard(
      height: expheight,
      width: expwidth,
      borderEffect: true,
      child: Column(
        children: [
          Text(
            'Experience Title',
            style: context.textStyle.bodyLgBold.copyWith(
              color: context.colorScheme.onBackground,
            ),
          ),
          Expanded(
            child: Column(
              children: [
                _ExperienceDescreptionItem(),
                _ExperienceDescreptionItem(),
                _ExperienceDescreptionItem(),
                _ExperienceDescreptionItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ExperienceDescreptionItem extends StatelessWidget {
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
            'Experience description goes here',
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
