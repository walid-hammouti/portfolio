import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/shared/app_shared_pref.dart';

class AppLocalController extends AsyncNotifier<String> {
  @override
  FutureOr<String> build() {
    return AppSharedPref.getAppLocal();
  }

  void changeLocale(String newLocal) async {
    await AppSharedPref.setAppLocal(newLocal);
    update((state) => newLocal);
  }
}
