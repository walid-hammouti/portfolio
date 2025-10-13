import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/features/contactme/presentation/contactMe_form.dart';
import 'package:portfolio/features/contactme/presentation/contactMe_image.dart';
import 'package:portfolio/features/contactme/presentation/contactMe_info.dart';
import 'package:portfolio/style/app_size.dart';
import 'package:portfolio/widgets/app_scaffold.dart';
import 'package:portfolio/widgets/seo_text.dart';

class ContactmePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      slivers: [
        SliverToBoxAdapter(
          child: context.isDesktop ? LargeContactMe() : SmallContactMe(),
        ),
      ],
    );
  }
}

class LargeContactMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: Insets.maxwidth,
        minHeight: context.insets.vh(context) - context.insets.appBarHeight,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [ContactmeInfo(), ContactmeForm()],
          ),
        ),
      ),
    );
  }
}

class SmallContactMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: Insets.maxwidth,
        minHeight: context.insets.vh(context) - context.insets.appBarHeight,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [ContactmeInfo(), ContactmeForm()],
          ),
        ),
      ),
    );
  }
}
