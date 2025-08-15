class Insets {
  static const double maxwidth = 1280;
  static const double xxx1 = 80;
  static const double xl = 24;
  static const double md = 12;
  static const double xs = 4;
}

abstract class AppInsets {
  double get padding;
  double get appBarHeight;
}

class LargeInstes extends AppInsets {
  @override
  double get padding => 80;
  @override
  double get appBarHeight => 64;
}

class SmallInsets extends AppInsets {
  @override
  double get padding => 16;
  @override
  double get appBarHeight => 56;
}
