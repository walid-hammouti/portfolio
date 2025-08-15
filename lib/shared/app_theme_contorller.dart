import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/shared/app_shared_pref.dart';

class AppThemeController extends AsyncNotifier<String> {
  @override
  Future<String> build() async {
    // Default to 'light' if no theme is saved
    return await AppSharedPref.getAppTheme() ?? 'dark';
  }

  Future<void> changeTheme(String theme) async {
    // Validate input
    if (theme != 'light' && theme != 'dark') {
      throw ArgumentError('Theme must be either "light" or "dark"');
    }

    // Optimistic update
    state = AsyncValue.data(theme);

    try {
      await AppSharedPref.setAppTheme(theme);
    } catch (e) {
      // Revert if error occurs
      state = AsyncValue.error(e, StackTrace.current);
      rethrow;
    }
  }
}
