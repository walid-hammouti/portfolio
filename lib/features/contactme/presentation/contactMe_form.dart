import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/features/contactme/services/sendEmailService.dart';
import 'package:portfolio/style/app_size.dart';
import 'package:portfolio/widgets/seo_text.dart';
import 'package:portfolio/widgets/styled_button.dart';

class ContactmeForm extends StatefulWidget {
  @override
  State<ContactmeForm> createState() => _ContactmeFormState();
}

class _ContactmeFormState extends State<ContactmeForm> {
  final nameController = TextEditingController();
  final messageController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      constraints:
          context.isPhoneOrTablet
              ? BoxConstraints(
                minHeight:
                    context.insets.vh(context) - context.insets.appBarHeight,
              )
              : null,
      width: 500,
      child: Form(
        key: formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SEOText(
                  context.texts.contactLets,
                  style: context.textStyle.titleLgBold.copyWith(
                    color: context.colorScheme.onBackground,
                  ),
                ),
                SEOText(
                  context.texts.contactTalk,
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
              context.texts.contactSubtitle,
              style: context.textStyle.bodyLgMedium.copyWith(
                color: context.colorScheme.onBackground,
              ),
            ),
            Gap(Insets.xl),

            SEOText(
              context.texts.contactYourName,
              style: context.textStyle.bodyMdMedium.copyWith(
                color: context.colorScheme.onBackground,
              ),
            ),
            Gap(Insets.md),

            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return context.texts.contactNameValidation;
                }
                return null;
              },
              controller: nameController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color:
                        dark
                            ? context.colorScheme.onBackground.withOpacity(0.2)
                            : context.colorScheme.primary,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            Gap(Insets.xl),

            SEOText(
              context.texts.contactYourMessage,
              style: context.textStyle.bodyMdMedium.copyWith(
                color: context.colorScheme.onBackground,
              ),
            ),
            Gap(Insets.md),

            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return context.texts.contactMessageValidation;
                }
                return null;
              },
              controller: messageController,
              minLines: 5,
              maxLines: 20,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color:
                        dark
                            ? context.colorScheme.onBackground.withOpacity(0.2)
                            : context.colorScheme.primary,
                  ),
                ),
                hintText: context.texts.contactMessageHint,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            Gap(Insets.xl),
            PrimaryButton(
              title: context.texts.contactSendButton,
              onPressed: () async {
                if (formkey.currentState!.validate()) {
                  bool response = await Sendemailservice.sendEmail(
                    name: nameController.text,
                    message: messageController.text,
                  );

                  if (response) {
                    formkey.currentState!.reset();
                    nameController.clear();
                    messageController.clear();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(context.texts.contactSuccess)),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(context.texts.contactError)),
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
