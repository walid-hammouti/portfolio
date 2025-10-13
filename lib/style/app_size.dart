import 'package:flutter/material.dart';

class Insets {
  static const double maxwidth = 1400; // i have add 120
  static const double xxxl = 80;
  static const double xxl = 50;
  static const double xl = 24;
  static const double md = 12;
  static const double xs = 4;
}

abstract class AppInsets {
  double get padding;
  double get appBarHeight;
  double get cardPadding;
  double get gap;
  double get contactmeImageSize;
  double vh(BuildContext context) => MediaQuery.of(context).size.height;
}

class LargeInstes extends AppInsets {
  @override
  double get padding => 80;
  @override
  double get appBarHeight => 64;
  @override
  double get cardPadding => Insets.xl;
  @override
  double get gap => 120;
  @override
  double get contactmeImageSize => 320;
}

class SmallInsets extends AppInsets {
  @override
  double get padding => 16;
  @override
  double get appBarHeight => 56;
  @override
  double get cardPadding => Insets.md;
  @override
  double get gap => 72;
  @override
  double get contactmeImageSize => 240;
}
