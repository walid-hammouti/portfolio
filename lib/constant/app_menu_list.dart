import 'package:flutter/widgets.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/routes/app_routes.dart';

class AppMenuList {
  static List<AppMenu> getItems(BuildContext context) => [
    AppMenu(title: context.texts.home, path: AppRoutes.home),
    AppMenu(title: context.texts.projects, path: AppRoutes.projects),
    AppMenu(title: context.texts.blogs, path: AppRoutes.blogs),
    AppMenu(title: context.texts.aboutMe, path: AppRoutes.aboutme),
    AppMenu(title: context.texts.contactme, path: AppRoutes.contactme),
  ];
}

class AppMenu {
  final String title;
  final String path;

  AppMenu({required this.title, required this.path});
}
