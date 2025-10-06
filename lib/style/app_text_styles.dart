import 'package:flutter/widgets.dart';

abstract class AppTextStyle {
  TextStyle get titleSmBold;
  TextStyle get bodyMdMedium;
  TextStyle get titleLgBold;
  TextStyle get homeTitleSubtitleLgBold;
  TextStyle get titleXlBold;
  TextStyle get titleMdMedium;
  TextStyle get bodyLgBold;
  TextStyle get bodyLgMedium;
}

class SmallTextStyles implements AppTextStyle {
  @override
  TextStyle get titleSmBold =>
      const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

  @override
  TextStyle get bodyMdMedium =>
      const TextStyle(fontSize: 12, fontWeight: FontWeight.w500);

  @override
  TextStyle get titleLgBold =>
      const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  @override
  TextStyle get homeTitleSubtitleLgBold =>
      const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  @override
  TextStyle get titleXlBold =>
      const TextStyle(fontSize: 36, fontWeight: FontWeight.bold);

  @override
  TextStyle get titleMdMedium =>
      const TextStyle(fontSize: 14, fontWeight: FontWeight.w500);

  @override
  TextStyle get bodyLgBold =>
      const TextStyle(fontSize: 14, fontWeight: FontWeight.bold);

  @override
  TextStyle get bodyLgMedium =>
      const TextStyle(fontSize: 14, fontWeight: FontWeight.w500);
}

class LargeTextStyles implements AppTextStyle {
  @override
  TextStyle get titleSmBold =>
      const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

  @override
  TextStyle get bodyMdMedium =>
      const TextStyle(fontSize: 14, fontWeight: FontWeight.w500);

  @override
  TextStyle get titleLgBold =>
      const TextStyle(fontSize: 40, fontWeight: FontWeight.bold);
  @override
  TextStyle get homeTitleSubtitleLgBold =>
      const TextStyle(fontSize: 36, fontWeight: FontWeight.bold);
  @override
  TextStyle get titleXlBold =>
      const TextStyle(fontSize: 70, fontWeight: FontWeight.bold);

  @override
  TextStyle get titleMdMedium =>
      const TextStyle(fontSize: 20, fontWeight: FontWeight.w500);

  @override
  TextStyle get bodyLgBold =>
      const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

  @override
  TextStyle get bodyLgMedium =>
      const TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
}
