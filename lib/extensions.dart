import 'package:flutter/material.dart';
import 'package:portfolio/style/app_text_styles.dart';
import 'package:portfolio/generated/l10n/app_localizations.dart';
import 'package:portfolio/style/app_size.dart';

enum FormFactorType { mobile, tablet, desktop }

extension StyledContent on BuildContext {
  MediaQueryData get mq => MediaQuery.of(this);
  double get width => mq.size.width;
  double get height => mq.size.height;

  ThemeData get theme => Theme.of(this);
  FormFactorType get formFactor {
    if (width < 600) {
      return FormFactorType.mobile;
    } else if (width < 900) {
      return FormFactorType.tablet;
    } else {
      return FormFactorType.desktop;
    }
  }

  bool get isMobile => formFactor == FormFactorType.mobile;
  bool get isTablet => formFactor == FormFactorType.tablet;
  bool get isDesktop => formFactor == FormFactorType.desktop;

  AppTextStyle get textStyle {
    switch (formFactor) {
      case FormFactorType.mobile:
      case FormFactorType.tablet:
        return SmallTextStyles();
      case FormFactorType.desktop:
        return LargeTextStyles();
    }
  }

  AppInsets get insets {
    switch (formFactor) {
      case FormFactorType.mobile:
      case FormFactorType.tablet:
        return SmallInsets();
      case FormFactorType.desktop:
        return LargeInstes();
    }
  }

  AppLocalizations get texts =>
      AppLocalizations.of(this) ?? lookupAppLocalizations(const Locale('en'));

  ColorScheme get colorScheme => theme.colorScheme;
}
