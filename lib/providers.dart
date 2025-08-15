import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/shared/app_local_controller.dart';
import 'package:portfolio/shared/app_theme_contorller.dart';
import 'package:portfolio/widgets/appbar/drawer_menu.dart';

final appLocalProvider = AsyncNotifierProvider<AppLocalController, String>(
  AppLocalController.new,
);

final appThemeProvider = AsyncNotifierProvider<AppThemeController, String>(
  AppThemeController.new,
);
final drawerMenuControllerProvider =
    AsyncNotifierProvider<DrawerMenuController, bool>(
      () => DrawerMenuController(),
    );
