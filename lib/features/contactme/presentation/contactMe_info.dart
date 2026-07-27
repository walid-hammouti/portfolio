import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/style/app_size.dart';
import 'package:portfolio/utils/launch_url.dart';
import 'package:portfolio/widgets/my_footer.dart';
import 'package:portfolio/widgets/seo_text.dart';
import 'package:portfolio/widgets/styled_button.dart';

class ContactmeInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:
          context.isPhoneOrTablet
              ? BoxConstraints(
                minHeight:
                    context.insets.vh(context) - context.insets.appBarHeight,
              )
              : null,
      width: 500,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SEOText(
                context.texts.reach,
                style: context.textStyle.titleLgBold.copyWith(
                  color: context.colorScheme.onBackground,
                ),
              ),
              SEOText(
                context.texts.me,
                style: context.textStyle.titleLgBold,
                gradient: LinearGradient(
                  colors: [
                    context.colorScheme.onBackground,
                    context.colorScheme.primary,
                  ],
                ),
              ),
            ],
          ),

          Gap(Insets.xxl),
          SEOText(
            context.texts.contactDescription,
            style: context.textStyle.bodyLgMedium.copyWith(
              color: context.colorScheme.onBackground,
            ),
          ),
          Gap(Insets.xl),
          ListTile(
            leading: Icon(Icons.email, color: context.colorScheme.onBackground),
            title: SEOText(
              context.texts.email,
              style: context.textStyle.bodyMdMedium.copyWith(
                color: context.colorScheme.onBackground,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.phone, color: context.colorScheme.onBackground),
            title: SEOText(
              context.texts.phone,
              style: context.textStyle.bodyMdMedium.copyWith(
                color: context.colorScheme.onBackground,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.link, color: context.colorScheme.onBackground),
            title: FooterLinks(arefooterlinks: false),
          ),
          Gap(Insets.xl),
          PrimaryButton(
            title: context.texts.viewResume,
            onPressed:
                () => launchAppUrl(
                  'https://drive.google.com/file/d/1qJT9jdJarqO9aYZhQenHZs1QFDwv0pQz/view?usp=sharing',
                ),
          ),
        ],
      ),
    );
  }
}
