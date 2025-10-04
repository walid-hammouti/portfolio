import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/constant/app_menu_list.dart';
import 'package:portfolio/providers.dart';
import 'package:portfolio/style/app_text_styles.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/generated/l10n/app_localizations.dart';
import 'package:portfolio/style/app_size.dart';
import 'package:portfolio/widgets/appbar/app_bar_drawer_icon.dart';
import 'package:portfolio/widgets/appbar/drawer_menu.dart';
import 'package:portfolio/widgets/language_switch.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 200),
          alignment: Alignment.center,
          height: context.insets.appBarHeight,
          color: context.theme.appBarTheme.backgroundColor,
          padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: Insets.maxwidth),
            child: Row(
              children: [
                AppLogo(),
                Spacer(),
                if (context.isDesktop) LargeMenu(),
                Spacer(),
                LanguageSwitch(),
                SizedBox(width: 20),
                ThemeToggle(),
                if (!context.isDesktop) AppBarDrawerIcon(),
              ],
            ),
          ),
        ),
        if (!context.isDesktop) DrawerMenu(),
      ],
    );
  }
}

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(context.texts.walid, style: context.textStyle.titleLgBold);
  }
}

class LargeMenu extends StatelessWidget {
  const LargeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children:
          AppMenuList.getItems(context)
              .map(
                (e) => LargeAppBarMenuItem(
                  title: e.title,
                  ontap: () {
                    context.go(e.path);
                  },
                  isSelected: GoRouterState.of(context).fullPath == e.path,
                ),
              )
              .toList(),
    );
  }
}

class SmallMenu extends StatelessWidget {
  const SmallMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          AppMenuList.getItems(context)
              .map(
                (e) => LargeAppBarMenuItem(
                  title: e.title,
                  ontap: () {
                    context.go(e.path);
                  },
                  isSelected: GoRouterState.of(context).fullPath == e.path,
                ),
              )
              .toList(),
    );
  }
}
/*

The AppMenuList.getItems(context) returns a list of 4 AppMenu objects 
(for example: Home, Courses, Blogs, About Me). Each AppMenu object has a title 
(the display text) and a path (which is currently unused in the code).


The .map() function then converts each AppMenu object into a LargeAppBarMenuItem widget. 
It passes three properties: the title from AppMenu, an empty ontap function 
(which ignores the AppMenu.path), and sets isSelected to true for all items 
(which is likely a bug since typically only one menu item should be selected at a time).


The final output is a Row containing 4 InkWell widgets, 
which are tappable menu items displaying the text from each AppMenu title. 
The current implementation doesn't use the path for navigation and forces all items to appear selected.
*/

class LargeAppBarMenuItem extends StatelessWidget {
  const LargeAppBarMenuItem({
    super.key,
    required this.title,
    required this.isSelected,
    required this.ontap,
  });

  final String title;
  final bool isSelected;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Insets.md,
          vertical: Insets.xs,
        ),
        child: Text(
          title,
          style: SmallTextStyles().bodyLgMedium.copyWith(
            color:
                isSelected
                    ? context.colorScheme.onBackground
                    : context.colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}

class ThemeToggle extends ConsumerWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeAsync = ref.watch(appThemeProvider);

    return themeAsync.when(
      loading: () => const CircularProgressIndicator(),
      error: (error, stack) => Text('Error: $error'),
      data: (theme) {
        return Switch(
          value: theme == 'dark',
          onChanged: (value) {
            ref
                .read(appThemeProvider.notifier)
                .changeTheme(value ? 'dark' : 'light');
          },
        );
      },
    );
  }
}
