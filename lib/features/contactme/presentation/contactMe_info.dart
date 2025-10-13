import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/style/app_size.dart';
import 'package:portfolio/widgets/my_footer.dart';
import 'package:portfolio/widgets/seo_text.dart';

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
                "Reach",
                style: context.textStyle.titleLgBold.copyWith(
                  color: context.colorScheme.onBackground,
                ),
              ),
              SEOText(
                " Me",
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
            "Feel free to reach out! You can contact me via email, phone, or through my social media channels. I’d love to hear from you.",
            style: context.textStyle.bodyLgMedium.copyWith(
              color: context.colorScheme.onBackground,
            ),
          ),
          Gap(Insets.xl),
          ListTile(
            leading: Icon(Icons.email, color: context.colorScheme.onBackground),
            title: SEOText(
              "w.walidcontacts@gmail.com",
              style: context.textStyle.bodyMdMedium.copyWith(
                color: context.colorScheme.onBackground,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.phone, color: context.colorScheme.onBackground),
            title: SEOText(
              "+213 5 62 26 57 67",
              style: context.textStyle.bodyMdMedium.copyWith(
                color: context.colorScheme.onBackground,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.link, color: context.colorScheme.onBackground),
            title: FooterLinks(arefooterlinks: false),
          ),
        ],
      ),
    );
  }
}
